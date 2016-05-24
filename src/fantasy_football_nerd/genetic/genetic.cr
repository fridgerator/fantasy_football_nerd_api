module FantasyFootballNerd
	module Genetic
		@@players = [] of Player
		@@population = [] of Team

		def self.run(salary_cap = 60000, population_size = 10000, itterations = 80)
			get_players()
			@@population = Team.create_population(population_size, @@players)

			best_teams = [] of Team
			# puts "grade #{population_grade()}"

			itterations.times do
				evolve_population()
				# puts "grade #{population_grade()}"
				valid_teams = @@population.select{|team| team.salary_sum() < salary_cap }
				valid_teams.sort!{|a, b| b.fitness() <=> a.fitness() }
				best_teams << valid_teams[0] unless valid_teams.empty?
			end

			best_teams.sort!{|a, b| b.fitness() <=> a.fitness() }
			best_teams[0].print()
		end

		def self.get_players
			nfl_players = Array(NflPlayer).from_json(File.read("./players.json"))
			rankings = Array(WeeklyRanking).from_json(File.read("./rankings.json"))

			@@players = Player.create_list(nfl_players, rankings)
		end

		def self.population_grade
			summed = @@population.map{|team| team.fitness() }.reduce{|acc, x| acc + x } 
			summed / @@population.size.to_f
		end

		def self.evolve_population(retain = 0.35, random_select = 0.05, mutate_chance = 0.005)
			graded = @@population.sort{|a, b| b.fitness() <=> a.fitness() }
			retain_index = (graded.size.to_f * retain).to_i
			parents = graded[0..retain_index-1]
			dissolve = graded[retain_index..-1]

			# keep a few random weak teams
			dissolve.each{|team| parents << team if random_select > Random.rand }

			# random mutations
			parents.each{|team| team.mutate(@@players) if mutate_chance > Random.rand }

			needed_to_repopulate = @@population.size - parents.size
			children = [] of Team

			while children.size < needed_to_repopulate
				male = parents.sample()
				female = parents.sample()

				if male != female
					children += Team.breed(male, female)
				end
			end

			@@population = parents += children
		end
	end
end
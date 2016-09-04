module FantasyFootballNerd
  module Genetic
    class Team
      property qb : Player
      property rb1 : Player
      property rb2 : Player
      property wr1 : Player
      property wr2 : Player
      property wr3 : Player
      property te : Player
      property k : Player
      property d : Player

      def self.breed(mother, father)
        [create_child(mother, father), create_child(mother, father)]
      end

      def self.create_child(mother, father)
        rbs = [mother.rb1, mother.rb2, father.rb1, father.rb2].uniq.sample(2)
        wrs = [mother.wr1, mother.wr2, mother.wr3, father.wr1, father.wr2, father.wr3].uniq.sample(3)
        team = self.new(
          [mother.qb, father.qb].sample(),
          rbs[0], rbs[1],
          wrs[0], wrs[1], wrs[2],
          [mother.te, father.te].sample(),
          [mother.k, father.k].sample(),
          [mother.d, father.d].sample()
        )
        team
      end

      def self.create_population(count, players)
        teams = [] of self
        count.times do
          rb1 = players.select{|p| p.position == "RB"}.sample()
          rb2 = players.select{|p| p.position == "RB" && p != rb1}.sample()
          wr1 = players.select{|p| p.position == "WR"}.sample()
          wr2 = players.select{|p| p.position == "WR" && p != wr1}.sample()
          wr3 = players.select{|p| p.position == "WR" && p != wr1 && p != wr2}.sample()

          teams << self.new(
            players.select{|p| p.position == "QB"}.sample(),
            rb1, rb2, wr1, wr2, wr3,
            players.select{|p| p.position == "TE"}.sample(),
            players.select{|p| p.position == "K"}.sample(),
            players.select{|p| p.position == "DEF"}.sample()
          )         
        end
        teams
      end

      def is_uniq?
        self.roster.uniq.size == roster.size
      end

      def initialize(qb, rb1, rb2, wr1, wr2, wr3, te, k, d)
        @qb = qb
        @rb1 = rb1
        @rb2 = rb2
        @wr1 = wr1
        @wr2 = wr2
        @wr3 = wr3
        @te = te
        @k = k
        @d = d
      end

      def roster
        [@qb, @rb1, @rb2, @wr1, @wr2, @wr3, @te, @k, @d]
      end

      def salary_sum
        roster.map{|player| player.salary }.reduce{|acc, x| acc + x }
      end

      def fitness
        roster.map{|player| player.standard }.reduce{|acc, x| acc + x }
      end

      def mutate(players)
        random_position = [:qb, :rb1, :rb2, :wr1, :wr2, :wr3, :te, :k, :d].sample()

        case random_position
        when :qb
          @qb = players.select{|player| player.position == "QB" }[0]
        when :rb1
          @rb1 = players.select{|player| player.position == "RB" && !player.in_team?(self) }[0]
        when :rb2
          @rb2 = players.select{|player| player.position == "RB" && !player.in_team?(self) }[0]
        when :wr1
          @wr1 = players.select{|player| player.position == "WR" && !player.in_team?(self) }[0]
        when :wr2
          @wr2 = players.select{|player| player.position == "WR" && !player.in_team?(self) }[0]
        when :wr3
          @wr3 = players.select{|player| player.position == "WR" && !player.in_team?(self) }[0]
        when :te
          @te = players.select{|player| player.position == "TE" }[0]
        when :k
          @k = players.select{|player| player.position == "K" }[0]
        when :d
          @d = players.select{|player| player.position == "DEF" }[0]
        end
      end

      def print
        puts "#{@qb.display_name} QB #{@qb.salary} - #{@qb.standard}"
        puts "#{@rb1.display_name} RB #{@rb1.salary} - #{@rb1.standard}"
        puts "#{@rb2.display_name} RB #{@rb2.salary} - #{@rb2.standard}"
        puts "#{@wr1.display_name} WR #{@wr1.salary} - #{@wr1.standard}"
        puts "#{@wr2.display_name} WR #{@wr2.salary} - #{@wr2.standard}"
        puts "#{@wr3.display_name} WR #{@wr3.salary} - #{@wr3.standard}"
        puts "#{@te.display_name} TE #{@te.salary} - #{@te.standard}"
        puts "#{@k.display_name} K #{@k.salary} - #{@k.standard}"
        puts "#{@d.display_name} D #{@d.salary} - #{@d.standard}"
        puts "#{self.salary_sum()}"
        puts "#{self.fitness()}"
      end
    end
  end
end
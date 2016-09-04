module FantasyFootballNerd
  module Genetic
    class Player
      property salary : Int32
      property standard : Float64
      property display_name : String | Nil
      property position : String | Nil

      def self.create_list(nfl_players, rankings)
        players = [] of self
        nfl_players.each do |nfl_player|
          next if rankings.select { |r| r.player_id == nfl_player.player_id }.empty?

          ranking = rankings.select { |r| r.player_id == nfl_player.player_id }[0]
          players << Player.new(nfl_player.display_name, ((40..90).to_a.sample * 100), nfl_player.position, ranking.standard.to_f)
        end
        players
      end

      def initialize(display_name, salary, position, standard)
        @display_name = display_name
        @salary = salary
        @position = position
        @standard = standard
      end

      def in_team?(team)
        team.roster.includes? self
      end
    end
  end
end

module FantasyFootballNerd
  def self.nfl_teams
    response = FantasyFootballNerd::Client.get("nfl-teams")
    Array(FantasyFootballNerd::NflTeam).from_json(response.to_s)
  end

  def self.nfl_schedule
    response = FantasyFootballNerd::Client.get("schedule")
    Array(FantasyFootballNerd::NflSchedule).from_json(response.to_s)
  end

  def self.nfl_players(position = "")
  	raise Exception.new("Position must be: QB, RB, WR, TE, K or DEF") unless ["QB", "RB", "WR", "TE", "K", "DEF", ""].includes?(position)

  	response = FantasyFootballNerd::Client.get("players", position)
  	Array(FantasyFootballNerd::NflPlayer).from_json(response.to_s)
  end

  def self.byes
    response = FantasyFootballNerd::Client.get("byes")
    JSON.parse(response.to_s)
  end

  def self.injuries(week = nil)
    response = FantasyFootballNerd::Client.get("injuries", week)
    all_injuries = Array(FantasyFootballNerd::Injury).new
    JSON.parse(response.to_s).each do |team, injuries|
      all_injuries.concat Array(FantasyFootballNerd::Injury).from_json(injuries.to_json)
    end
    all_injuries
  end

  def self.weather_forecasts
    response = FantasyFootballNerd::Client.get("weather")
    games = Array(FantasyFootballNerd::NflSchedule).new
    JSON.parse(response.to_s).each do |k, game|
      games << FantasyFootballNerd::NflSchedule.from_json(game.to_json)
    end
    games
  end

  def self.auction_values(ppr = false)
    response = FantasyFootballNerd::Client.get("auction", ppr ? "ppr" : nil)
    Array(FantasyFootballNerd::AuctionValue).from_json(response.to_s);
  end

  def self.draft_rankings(ppr = false)
    response = FantasyFootballNerd::Client.get("draft-rankings", ppr ? "1" : nil)
    Array(FantasyFootballNerd::DraftRanking).from_json(response.to_s);
  end

  def self.draft_projections(position = "")
    raise Exception.new("Position must be: QB, RB, WR, TE, K or DEF") unless ["QB", "RB", "WR", "TE", "K", "DEF", ""].includes?(position)

    response = FantasyFootballNerd::Client.get("draft-projections", position)
    Array(FantasyFootballNerd::DraftProjection).from_json(response.to_s)
  end

  def self.weekly_rankings(position = "", week = 1, ppr = false)
    raise Exception.new("Position must be: QB, RB, WR, TE, K or DEF") unless ["QB", "RB", "WR", "TE", "K", "DEF", ""].includes?(position)

    response = FantasyFootballNerd::Client.get("weekly-rankings", position, week.to_s, ppr ? "1" : nil)
    Array(FantasyFootballNerd::WeeklyRanking).from_json(response.to_s)
  end

  def self.weekly_projections(position = "", week = nil)
    raise Exception.new("Position must be: QB, RB, WR, TE, K or DEF") unless ["QB", "RB", "WR", "TE", "K", "DEF", ""].includes?(position)

    response = FantasyFootballNerd::Client.get("weekly-projections", position, week)
    Array(FantasyFootballNerd::WeeklyProjection).from_json(response.to_s)
  end

  # TODO: injuries

  # TODO: depth charts
end
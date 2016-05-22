module FantasyFootballNerd
  class Injury
    JSON.mapping({
      week: String,
      player_id: {type: String, key: "playerId"},
      player_name: {type: String, key: "playerName"},
      team: String,
      position: String,
      injury: String,
      practice_status: {type: String, key: "practiceStatus"},
      game_status: {type: String, key: "gameStatus"},
      notes: String,
      last_update: {type: Time, key: "lastUpdate", converter: Time::Format.new("%Y-%m-%d")}
    })
  end
end
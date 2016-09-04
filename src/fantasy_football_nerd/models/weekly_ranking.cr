module FantasyFootballNerd
  class WeeklyRanking
    JSON.mapping({
      week: String,
      player_id: {type: String, key: "playerId"},
      position: String,
      team: String,
      standard: String,
      standard_low: {type: String, key: "standardLow"},
      standard_high: {type: String, key: "standardHigh"},
      ppr: String,
      ppr_low: {type: String, key: "pprLow"},
      ppr_high: {type: String, key: "pprHigh"},
      injury: {type: String, nilable: true},
      practice_status: {type: String, key: "practiceStatus", nilable: true},
      game_status: {type: String, key: "gameStatus", nilable: true},
      last_update: {type: String, key: "lastUpdate", nilable: true}
    })
  end
end
module FantasyFootballNerd
  class DraftRanking
    JSON.mapping({
      player_id: {type: String, key: "playerId"},
      position: String,
      diplay_name: {type: String, key: "displayName"},
      fname: String,
      lname: String,
      team: String,
      bye_week: {type: String, key: "byeWeek"},
      stand_dev: {type: String, key: "standDev", nilable: true},
      nerd_rank: {type: String, key: "nerdRank"},
      position_rank: {type: String, key: "positionRank"},
      overall_rank: {type: String, key: "overallRank"}
    })
  end
end
module FantasyFootballNerd
  class NflPlayer
    JSON.mapping({
      player_id: {type: String, key: "playerId"},
      active: String,
      jersey: String,
      last_name: {type: String, key: "lname"},
      first_name: {type: String, key: "fname"},
      display_name: {type: String, key: "displayName"},
      team: String,
      position: String,
      height: String,
      weight: String,
      dob: String, # convert to time
      college: String
    })
  end
end
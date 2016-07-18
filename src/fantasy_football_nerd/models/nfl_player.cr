module FantasyFootballNerd
  class NflPlayer
    JSON.mapping({
      player_id: {type: String, key: "playerId"},
      active: {type: String, nilable: true},
      jersey: {type: String, nilable: true},
      last_name: {type: String, key: "lname", nilable: true},
      first_name: {type: String, key: "fname", nilable: true},
      display_name: {type: String, key: "displayName", nilable: true},
      player_name: {type: String, key: "playerName", nilable: true},
      team: {type: String, nilable: true},
      position: {type: String, nilable: true},
      height: {type: String, nilable: true},
      weight: {type: String, nilable: true},
      dob: {type: String, nilable: true}, # convert to time
      college: {type: String, nilable: true},
      depth: {type: String, nilable: true}
    })
  end
end
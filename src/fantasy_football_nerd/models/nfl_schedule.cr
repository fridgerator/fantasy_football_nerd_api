module FantasyFootballNerd
  class NflSchedule
    JSON.mapping({
      game_id: {type: String, key: "gameId"},
      game_week: {type: String, key: "gameWeek"},
      game_date: {type: Time, key: "gameDate", converter: Time::Format.new("%Y-%m-%d")},
      away_team: {type: String, key: "awayTeam"},
      home_team: {type: String, key: "homeTeam"},
      game_time_et: {type: Time, key: "gameTimeET", converter: Time::Format.new("%H:%M ")}, # this isnt correct
      tv_station: {type: String, key: "tvStation"},
      stadium: {type: String, nilable: true},
      is_dome: {type: String, nilable: true, key: "isDome"},
      geo_lat: {type: String, nilable: true, key: "geoLat"},
      geo_lng: {type: String, nilable: true, key: "geoLng"},
      low: {type: String, nilable: true},
      high: {type: String, nilable: true},
      forecast: {type: String, nilable: true},
      wind_chill: {type: String, key: "windChill", nilable: true},
      wind_speed: {type: String, key: "windSpeed", nilable: true},
      dome_img: {type: String, key: "domeImg", nilable: true},
      small_img: {type: String, nilable: true, key: "smallImg"},
      medium_img: {type: String, nilable: true, key: "mediumImg"},
      large_img: {type: String, nilable: true, key: "largeImg"}
    })
  end
end
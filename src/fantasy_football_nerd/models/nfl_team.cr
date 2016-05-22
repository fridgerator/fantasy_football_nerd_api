module FantasyFootballNerd
  class NflTeam
    JSON.mapping({
      code: String,
      full_name: {type: String, key: "fullName"},
      short_name: {type: String, key: "shortName"},
      bye_week: {type: String, key: "byeWeek", nilable: true}
    })
  end
end
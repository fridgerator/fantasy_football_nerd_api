module FantasyFootballNerd
	class WeeklyProjection
		JSON.mapping({
			week: String,
			player_id: {type: String, key: "playerId"},
			position: String,
			pass_att: {type: String, key: "passAtt", nilable: true},
			pass_cmp: {type: String, key: "passCmp", nilable: true},
			pass_yds: {type: String, key: "passYds", nilable: true},
			pass_td: {type: String, key: "passTD", nilable: true},
			pass_int: {type: String, key: "passInt", nilable: true},
			rush_att: {type: String, key: "passAtt", nilable: true},
			rush_yds: {type: String, key: "rushYds", nilable: true},
			rush_td: {type: String, key: "rushTD", nilable: true},
			fumbles_list: {type: String, key: "fumblesLost", nilable: true},
			receptions: {type: String, nilable: true},
			rec_yds: {type: String, key: "recYds", nilable: true},
			rec_td: {type: String, key: "tecTD", nilable: true},
			fg: {type: String, nilable: true},
			fg_att: {type: String, key: "fgAtt", nilable: true},
			xp: {type: String, nilable: true},
			def_int: {type: String, key: "defInt", nilable: true},
			def_fr: {type: String, key: "defFR", nilable: true},
			def_ff: {type: String, key: "defFF", nilable: true},
			def_sack: {type: String, key: "defSack", nilable: true},
			def_td: {type: String, key: "defTD", nilable: true},
			def_ret_td: {type: String, key: "defRetTD", nilable: true},
			def_safety: {type: String, key: "defSafety", nilable: true},
			def_pa: {type: String, key: "defPA", nilable: true},
			def_yds_allowed: {type: String, key: "defYdsAllowed", nilable: true},
			display_name: {type: String, key: "displayName"},
			team: String
		})
	end
end
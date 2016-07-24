module FantasyFootballNerd
	class DraftProjection
		JSON.mapping({
			player_id: {type: String, key: "playerId"},
			display_name: {type: String, key: "displayName"},
			team: String,
			fantasy_points: {type: String, key: "fantasyPoints", nilable: true},

			# General / Offence
			rush_yards: {type: String, key: "rushYards", nilable: true},
			rush_td: {type: String, key: "rushTD", nilable: true},

			# QB
			completions: {type: String, nilable: true},
			attempts: {type: String, nilable: true},
			passing_yards: {type: String, key: "passingYards", nilable: true},
			padding_td: {type: String, key: "passingTD", nilable: true},
			padding_int: {type: String, key: "passingINT", nilable: true},

			# RB
			rush_att: {type: String, key: "rushAtt", nilable: true},
			fumbles: {type: String, nilable: true},
			rec: {type: String, nilable: true},
			rec_yards: {type: String, key: "recYards", nilable: true},

			# K
			xp: {type: String, nilable: true},
			fb: {type: String, nilable: true},

			# DEF
			sacks: {type: String, nilable: true},
			interceptions: {type: String, nilable: true},
			funble_rec: {type: String, key: "funbleRec", nilable: true},
			td: {type: String, key: "TD", nilable: true},
			special_team_td: {type: String, key: "specialTeamTD", nilable: true},

		})
	end
end
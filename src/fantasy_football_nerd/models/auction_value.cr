module FantasyFootballNerd
  class AuctionValue
    JSON.mapping({
      player_id: {type: String, key: "playerId"},
      ppr: String,
      min_price: {type: String, key: "minPrice"},
      max_price: {type: String, key: "maxPrice"},
      avg_price: {type: String, key: "avgPrice"},
      display_name: {type: String, key: "displayName"},
      team: String,
      position: String
    })
  end
end
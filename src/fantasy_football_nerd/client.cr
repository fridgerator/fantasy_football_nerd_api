module FantasyFootballNerd
  class Client
    BASE_URL = "http://www.fantasyfootballnerd.com/service/"
    API_KEY = ENV["FF_NERDS_API_KEY"]? ? ENV["FF_NERDS_API_KEY"] : "test"

    # Sends query to google api endpoint.
    # Appends the api key if it exists in ENV
    # Handles the response from google.
    def self.get(endpoint : String, *args)
      url = "#{BASE_URL}#{endpoint}/json/#{API_KEY}"
      args.each {|arg| url += "/#{arg}"}
      response = HTTP::Client.get url
      handle_response(response, endpoint)
    end

    # Handle's the response from Google. Parsing the response body or raising errors
    # as necessary
    private def self.handle_response(response, endpoint)
      case response.status_code
      when 200..299
        parsed = JSON.parse(response.body)
        raise FantasyFootballNerd::Errors::ClientError.new(parsed["error_message"].to_s) if parsed["error_message"]?
        if results_key(endpoint).empty?
          parsed.to_json
        else
          parsed[results_key(endpoint)].to_json
        end
      when 400..499
        puts "error"
        puts response.body
      when 500
        raise FantasyFootballNerd::Errors::ServerError.new("Internal Server Error")
      when 502
        raise FantasyFootballNerd::Errors::ServerError.new("Bad Gateway")
      when 503
        raise FantasyFootballNerd::Errors::ServerError.new("Service Unavailable")
      when 504
        raise FantasyFootballNerd::Errors::ServerError.new("Gateway Timeout")
      else
        raise Exception.new("Uncaught error")
      end
    end

    # Returns the base key name used when parsing the response
    private def self.results_key(endpoint : String)
      case endpoint
      when "nfl-teams"
        "NFLTeams"
      when "schedule"
        "Schedule"
      when "players"
        "Players"
      when "byes"
        ""
      when "injuries"
        "Injuries"
      when "weather"
        "Games"
      when "auction"
        "AuctionValues"
      when "draft-rankings"
        "DraftRankings"
      when "draft-projections"
        "DraftProjections"
      when "weekly-rankings"
        "Rankings"
      when "weekly-projections"
        "Projections"
      when "depth-charts"
        "DepthCharts"
      else
        "routes"
      end
    end

    # Parses params hash and returns a query string
    private def self.to_query_string(params : Hash)
      HTTP::Params.build do |form|
        params.each do |key, value|
          form.add(key.to_s, value.to_s)
        end
      end
    end
  end
end
module Pubg
  class Base
    BASE_URL = 'https://pubgtracker.com/api/'.freeze

    class << self
      def client
        @client ||= Faraday.new(
          url: BASE_URL,
          headers: {
            'TRN-Api-Key' => Pubg.config.tracker_id
          }
        ) do |connection|
          connection.use Pubg::ParseJsonMiddleware, content_type: /\bjson$/
          connection.adapter :net_http
        end
      end
    end
  end
end

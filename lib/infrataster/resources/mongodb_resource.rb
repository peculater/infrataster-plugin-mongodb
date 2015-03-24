require 'infrataster'
require 'redis'

module Infrataster
  module Resources
    class MongodbResource < BaseResource
      Error = Class.new(StandardError)

      attr_reader :query
      attr_accessor :mongodb_client
       
      def initialize(query, options={})
        @query = query 
        @mongodb_client = nil
      end
    
      def to_s
        "Mongodb : \"#{@query}\""
      end
    end
  end
end

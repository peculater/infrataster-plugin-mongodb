require 'infrataster'
require 'mongo'

include Mongo 

module Infrataster
  module Contexts
    class MongodbContext < BaseContext
      def result 

        # Default to 'localhost'
        options = {host: 'localhost'}
        if server.options[:mongodb]
          options = options.merge(server.options[:mongodb])
        end
        host = "#{options[:host]}"
        options.delete(:host)

        # Connect to Mongo
        resource.mongodb_client = Mongo::Client.new([ host ], options )

        # Run query 
        db = resource.mongodb_client.database
        db.command(resource.query)
      end
    end
  end
end 

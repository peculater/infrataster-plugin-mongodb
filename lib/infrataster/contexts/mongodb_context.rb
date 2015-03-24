require 'infrataster'
require 'mongo'

include Mongo 

module Infrataster
  module Contexts
    class MongodbContext < BaseContext
      def result 
        options = {host: 'localhost', port: 27017}
        if server.options[:mongodb]
          options = options.merge(server.options[:mongodb])
        end
        
        # Initialize the mongodb obj
        #if options.has_key?(:db)
        #  resource.mongodb_client = MongoClient.new("#{options[:host]}",
        #                                            "#{options[:port]}").db("#{options[:db]}")
        #else 
          # default config
          resource.mongodb_client = MongoClient.new("#{options[:host]}", "#{options[:port]}")
        #end   

        # Query  parse 
        query, arguments = resource.query.split(' ', 2) 
        # For show query parse and get arguments

        if resource.mongodb_client.respond_to?(query)
          # Run query 
          resource.mongodb_client.method(query).call(*arguments)
        else 
          resource.mongodb_client.db("#{options[:db]}").method(query).call(*arguments)
        end  
      end
    end
  end
end 

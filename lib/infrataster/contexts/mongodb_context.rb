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
        #if options.has_key?(:auth)
          # In case of password protected database
        #  resource.mongodb_client = MongoClient.new("#{options[:host]}",
        #                                            "#{options[:port]}").db("#{options[:db]}")
        #else 
          # default config
          resource.mongodb_client = MongoClient.new("#{options[:host]}", "#{options[:port]}")
        #end   

        # Query  parse 
        query, arguments = resource.query.split(' ', 2) 
        # parse arguments if present      
        if not arguments.nil? 
          print arguments
          arguments = arguments.scan(/'[^']*'/).map {|n| eval n} 
          if query == "insert" or query == "find"
            # for insert and find operations convert string to hash
            arguments = eval(arguments[0])
          end
        end 

        # Run query 
        if resource.mongodb_client.respond_to?(query)
          # For normal methods
          print "normal..."
          resource.mongodb_client.method(query).call(*arguments)
        elsif resource.mongodb_client.db("#{options[:db]}").respond_to?(query)  
          # For database related methods
          print "with db"
          resource.mongodb_client.db("#{options[:db]}").method(query).call(*arguments)
        else
          # for collection related methods
          print "with collection"
          print arguments
          resource.mongodb_client.db("#{options[:db]}")["#{options[:collection]}"].method(query).call(*arguments)
        end  
      end
    end
  end
end 

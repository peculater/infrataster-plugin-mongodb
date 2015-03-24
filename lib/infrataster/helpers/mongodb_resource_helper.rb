require 'rspec'
require 'infrataster/resources'

module Infrataster
  module Helpers
    module ResourceHelper
      def mongodb(*args)
        Resources::MongodbResource.new(*args)
      end
    end
  end
end

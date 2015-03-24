require 'spec_helper'

describe server(:mongodb) do
  describe mongodb("database_names") do
    it 'should show database' do
      # Show All databases
      print "res", result
      result.should include("test_db")
    end
  end

  describe mongodb("collection_names") do
    it 'should show collections' do
      # Show All collections
      print "res", result
      result.should include("test_collection")
    end
  end

end

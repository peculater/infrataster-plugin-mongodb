require 'spec_helper'

describe server(:mongodb) do
  describe mongodb("server_info") do
    it 'should show server info' do
      # Show mongodb server information
      result["version"].should == "2.6.8"
    end
  end 

  describe mongodb("ping") do
    it 'should ping mongodb' do
      # Check the connection to mongodb
      result.should == {"ok"=>1.0}
    end
  end 
  
  describe mongodb("validate_collection 'test_collection'") do
    it 'should validate collection' do
      # Validate collection
      result["valid"].should == true
    end
  end 
  
  describe mongodb("database_names") do
    it 'should show database' do
      # Show All databases
      result.should include("test_db")
    end
  end

  describe mongodb("collection_names") do
    it 'should show collections' do
      # Show All collections
      result.should include("test_collection")
    end
  end

  # TODO: Test 
  describe mongodb("insert '{\"status\"=>\"Success\"}'") do
    it 'should insert document to collection' do
      # Insert document to collection
      print "res::::", result 
      result.should include("test_collection")
    end
  end

  describe mongodb("find '{\"status\"=>\"Success\"}'") do
    it 'should find document from collection' do
      # Find document from collection
      print "res ::::",  result 
      result.each {|res| print res}
    end
  end

end

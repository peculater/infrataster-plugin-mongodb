require 'spec_helper'

describe server(:mongodb) do
  describe mongodb({ "isMaster": 1 }) do
    it 'should be the master node' do
      # Show mongodb server information
      result.each do |doc|
        doc["ismaster"].should == true 
      end
    end
  end 

  describe mongodb({ "ping": 1 }) do
    it 'should ping mongodb' do
      # Check the connection to mongodb
      result.ok?
    end
  end 
  
  describe mongodb({ "insert": "infrataster_collection", "documents": [ {"status": "Success"}] }) do
    it 'should insert document to collection' do
      # Insert document to collection
      #print "res::::", result 
      result.ok?
    end
  end

  describe mongodb({ "find": "infrataster_collection", "filter": {"status": "Success"}}) do
    it 'should find document from collection' do
      # Find document from collection
      #print "res ::::",  result 
      #result.each {|res| print res}
      result.ok?
    end
  end

end

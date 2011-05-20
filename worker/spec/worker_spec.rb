require File.join( File.dirname(__FILE__),  "spec_helper" )

describe Thumbnail do
  before :all do
    @job = {
      "source" => "/tmp/_mg_6664.jpg", 
      "destination" =>"/tmp/result_mg_6664.jpg",
      "operation" =>"thumbnail",
      "account" => "john_doe"
    }
  end
  
  it "should make a thumbnail" do
    Thumbnail.new @job
    File.exist?(@job['destination']).should be_true
  end
  
  after :each do
    #FileUtils.rm @job['destination']
  end
end
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Mongoid::Activity do
  before(:each) do
    @task = Task.new
  end
  
  describe "not saved" do
    it "should be activable" do
      @task.activate!
      @task.active?.should be_true
    end
  
    it "should be deactivable" do
      @task.activate!
      @task.deactivate!
      @task.inactive?.should be_true
    end
  end
    
  describe "saved" do
    it "should be activable" do
      @task.save
      @task.activate!
      @task.active?.should be_true
    end
  
    it "should be deactivable" do
      @task.save
      @task.activate!
      @task.deactivate!
      @task.inactive?.should be_true
    end
  end
end

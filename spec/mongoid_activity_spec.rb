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
    before(:each) do
      @task.save
    end
    
    it "should be activable" do
      @task.activate!
      @task.active?.should be_true
    end
  
    it "should be deactivable" do
      @task.activate!
      @task.deactivate!
      @task.inactive?.should be_true
    end
    
    it "should have a active scope" do
      @task.activate!
      Task.active.first.should == @task
    end
        
    it "should have a inactive scope" do
      @task.deactivate!
      Task.inactive.first.should == @task
    end
  end
end

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Mongoid::Activity do
  before(:each) do
    @task = Task.new
  end
  
  describe "not saved" do
    it "should be activable" do
      @task.activate!
      expect(@task.active?).to be_truthy
    end
  
    it "should be deactivable" do
      @task.activate!
      @task.deactivate!
      expect(@task.inactive?).to be_truthy
    end
  end
    
  describe "saved" do
    before(:each) do
      @task.save
    end
    
    it "should be activable" do
      @task.activate!
      expect(@task.active?).to be_truthy
    end
  
    it "should be deactivable" do
      @task.activate!
      @task.deactivate!
      expect(@task.inactive?).to be_truthy
    end
    
    it "should have a active scope" do
      @task.activate!
      expect(Task.active.first).to eq(@task)
    end
        
    it "should have a inactive scope" do
      @task.deactivate!
      expect(Task.inactive.first).to eq(@task)
    end
  end
end

Mongoid Activity
============

Mongoid Activity is a simple gem to include active state to your Mongoid models.

Installation
--------

In your Gemfile:

    source 'http://rubygems.org'
    
    gem 'mongoid_activity'
  
Then:
  
    bundle install

Examples
--------

    class Task
      include Mongoid::Document
      include Mongoid::Activity
      
      field :description
    end

After that you gain activity methods:
    
    t = Task.create :description => "Finish mongoid_activity gem"
    t.activate!
    => true
    t.active?
    => true
    t.deactivate!
    => true
    t.inactive?
    => true
    t.active?
    => false
    Product.active.size
    => 0
    Product.inactive.size
    => 1
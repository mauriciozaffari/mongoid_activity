module Mongoid::Activity
  extend ActiveSupport::Concern
  
  included do
    field :active, :type => Boolean
    index({ active: 1 })
    
    scope :inactive,  :where => { :active => false }
    scope :active,    :where => { :active => true }

    def activate!
      new_record? ? self.active = true : update_attributes(:active => true)
      active?
    end

    def deactivate!
      new_record? ? self.active = false : update_attributes(:active => false)
      inactive?
    end
    
    def active?
      active
    end
    
    def inactive?
      !active
    end
  end
  
end

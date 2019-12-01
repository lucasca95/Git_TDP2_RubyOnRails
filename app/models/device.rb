class Device < ApplicationRecord
  belongs_to :target
  belongs_to :esp
  has_and_belongs_to_many :versions
  has_many :issues
  def program
    
    return self.versions.last.nil? ? nil : self.versions.last.program
  end
end

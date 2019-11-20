class Device < ApplicationRecord
  belongs_to :target
  belongs_to :esp
  has_and_belongs_to_many :versions
  has_many :issues
end

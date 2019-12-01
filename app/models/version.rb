class Version < ApplicationRecord
  belongs_to :program
  has_many :device_versions
end

class Version < ApplicationRecord
  belongs_to :program
  has_many :device_versions
  validates :program_id, uniqueness: { scope: :number,  message: "should happen once per program" }
end

class Version < ApplicationRecord
  belongs_to :program
  has_many :device_versions
  validates :program_id, uniqueness: { scope: :number,  message: "should happen once per program" }

  def self.nextVersion(program_id)
    v = Version.where(program_id:program_id).maximum(:number)
    return v.nil? ? 1 : v + 1
  end
end

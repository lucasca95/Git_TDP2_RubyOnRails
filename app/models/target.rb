class Target < ApplicationRecord
    has_and_belongs_to_many :programs
    has_many :devices
end

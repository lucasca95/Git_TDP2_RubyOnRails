class Target < ApplicationRecord
    has_and_belongs_to_many :programs
    has_many :devices

    def to_s
        return self.name
    end

end

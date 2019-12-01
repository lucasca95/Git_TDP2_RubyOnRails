class Program < ApplicationRecord
    has_and_belongs_to_many :targets
    has_many :versions
    validates :name, presence: true
    validates :name, uniqueness: true

    def to_s
        return name
    end

    def lastVersion
        return self.versions.last
    end
end

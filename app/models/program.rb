class Program < ApplicationRecord
    has_and_belongs_to_many :targets
    has_many :versions
end

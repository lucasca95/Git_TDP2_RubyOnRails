class Issue < ApplicationRecord
  belongs_to :device , optional: true
end

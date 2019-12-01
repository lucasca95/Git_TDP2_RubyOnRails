class Issue < ApplicationRecord
  belongs_to :device , optional: true
  validates :message, presence: true
end

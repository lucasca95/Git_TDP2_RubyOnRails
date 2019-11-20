class Device < ApplicationRecord
  belongs_to :target
  belongs_to :esp
end

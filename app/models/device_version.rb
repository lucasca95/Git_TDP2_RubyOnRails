class DeviceVersion < ApplicationRecord
  belongs_to :device
  belongs_to :version
end

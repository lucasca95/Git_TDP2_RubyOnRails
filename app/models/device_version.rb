class DeviceVersion < ApplicationRecord
  belongs_to :device
  belongs_to :version
  default_scope {order(:created_at)}

  def state_s

    case self.state
    when 0 
      return "Installed"
    when 1
      return "First"
    when 2
      return "Forced"
    else
      return "Error"
    end
  
  end
end

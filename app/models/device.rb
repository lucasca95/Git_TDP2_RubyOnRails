class Device < ApplicationRecord
  belongs_to :target
  belongs_to :esp
  has_many :device_versions
  has_many :issues
  def program
    return self.device_versions.last.nil? ? nil : self.device_versions.last.version.program
  end
  def versionState
    self.device_versions.where(version:self.actualVersion).to_ary.sort_by{|v| -v[:state]}.first
  end
  def actualVersion
    self.device_versions.where(state:0).last.nil? ? nil : self.device_versions.where(state:0).last.version
  end
  def lastVersion?
    self.actualVersion == self.lastVersion
  end
  def lastVersion
    if self.device_versions.where(state:2).count == 0
        return self.program.lastVersion
    else 
      return self.device_versions.where(state:2).last.version
    end
  end

  def updated
    dv = self.device_versions.build(state:0,version:self.lastVersion)
    dv.save
  end

end

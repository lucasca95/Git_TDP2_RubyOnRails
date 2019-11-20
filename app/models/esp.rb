class Esp < ApplicationRecord
    has_one :device




    def lastVersion?
        return self.device.versions.last.program.versions.last.id == self.device.versions.last.id
    end
end

class Esp < ApplicationRecord
    has_one :device



    def program
        return self.device.versions.last.program
    end
    def installedVersion
        return self.device.versions.last
    end
    def actualVersion
        return self.program.versions.last
    end
    def lastVersion?
        return self.actualVersion.id == self.installedVersion.id
    end

    def getLastVersion(page,size)
        result = ""
        f = File.new("compiled_programs/#{self.program.id}/#{self.actualVersion.id}/#{self.device.target.id}.hex")
        f.readlines[page*size..((page + 1)*size)-1].each do |l|
            result = "#{result}#{l.to_s.gsub!( "\n", "")}"
        end
        return result    
    end

    def updated
        self.device.versions << self.actualVersion
    end 
end

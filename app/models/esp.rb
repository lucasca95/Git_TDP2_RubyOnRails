class Esp < ApplicationRecord
    has_one :device
    validates :mac, format: { with: /[a-fA-F0-9:]{17}|[a-fA-F0-9]{12}/ , message: "Invalid MAC address"}
    validates :mac, uniqueness: true
    validates :version,  numericality: { only_integer: true }
    def lastVersion?
        return self.device.lastVersion?
    end

    def getLastVersion(page,size)
        result = ""
        f = File.new("#{Rails.root}/compiled_programs/#{self.device.program.id}/#{self.device.lastVersion.number}/#{self.device.target.id}.hex")
        f.readlines[page*size..((page + 1)*size)-1].each do |l|
            result = "#{result}#{l.to_s.gsub!( "\n", "")}"
        end
        return result    
    end

    def updated
        self.device.updated
    end 
    def to_s
     return self.mac
    end
    def self.unassigned(esp)
        return Esp.joins("left join devices as d on d.esp_id = esps.id").where("d.id is null or d.id = #{esp.nil? ? 0 : esp.id.to_s}")
    end
end

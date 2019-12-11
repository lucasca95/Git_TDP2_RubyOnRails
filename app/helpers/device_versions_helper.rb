module DeviceVersionsHelper
    def deviceVersion_link (dv)
        if dv.device.isForced?
            if dv.state == 2
                return link_to 'Remove', delete_device_version_path(dv), method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-danger"
            else
                return ""
            end
        else
            if dv.state == 0
                return link_to 'Force', device_version_path(device_version:{device_id:dv.device_id,version_id:dv.version_id,state:2}), method: :post, data: { confirm: 'Are you sure?' }, class: "btn btn-danger"
            else
                return ""
            end
        end
    end
end

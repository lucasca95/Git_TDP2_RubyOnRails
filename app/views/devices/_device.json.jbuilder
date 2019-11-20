json.extract! device, :id, :name, :latitude, :longitude, :target_id, :esp_id, :created_at, :updated_at
json.url device_url(device, format: :json)

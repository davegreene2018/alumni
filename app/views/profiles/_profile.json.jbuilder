json.extract! profile, :id, :status, :about, :created_at, :updated_at
json.url profile_url(profile, format: :json)

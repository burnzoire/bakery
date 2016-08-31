json.extract! item, :id, :code, :name, :created_at, :updated_at
json.url item_url(item, format: :json)
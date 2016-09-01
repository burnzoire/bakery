json.extract! item_pack, :id, :item_id, :quantity, :price, :created_at, :updated_at
json.url item_pack_url(item_pack, format: :json)
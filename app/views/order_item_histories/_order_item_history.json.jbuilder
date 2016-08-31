json.extract! order_item_history, :id, :order_item_id, :quantity, :price, :created_at, :updated_at
json.url order_item_history_url(order_item_history, format: :json)
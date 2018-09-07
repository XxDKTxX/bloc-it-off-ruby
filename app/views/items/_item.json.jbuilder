json.extract! item, :id, :title, :user_id, :done, :created_at, :updated_at
json.url item_url(item, format: :json)

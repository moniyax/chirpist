json.extract! repost, :id, :post_id, :user_id, :created_at, :updated_at
json.url repost_url(repost, format: :json)

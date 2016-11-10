json.extract! article, :id, :url, :score, :user_id, :created_at, :updated_at
json.url article_url(article, format: :json)
json.extract! short_url, :id, :url, :title, :shortened_url, :visit_count, :created_at, :updated_at
json.url short_url_url(short_url, format: :json)

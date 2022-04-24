json.extract! app, :id, :id, :title, :description, :version, :icon, :package, :user_id, :category, :tags, :created_at, :updated_at, :created_at, :updated_at
json.url app_url(app, format: :json)
json.icon url_for(app.icon)
json.package url_for(app.package)

json.extract! request, :id, :name, :email, :content, :created_at, :updated_at
json.url request_url(request, format: :json)

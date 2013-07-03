json.array!(@logins) do |login|
  json.extract! login, :name, :password
  json.url login_url(login, format: :json)
end

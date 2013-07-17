get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  Url.find_or_create_by_full_url(params[:full_url])
  erb :index
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end

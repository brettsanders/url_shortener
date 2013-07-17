get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @url = Url.find_or_create_by_full_url(params[:full_url])
  erb :index
end

# e.g., /q6bda
get '/:short_url' do
  p params
  @record = Url.find_by_short_url(params[:short_url])
  # p @record[:short_url]
  @record.click_count += 1
  @record.save
  redirect to("http://#{@record.full_url}")
end

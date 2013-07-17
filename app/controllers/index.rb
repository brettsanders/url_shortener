get '/' do
  # Look in app/views/index.erb
  @notification = "Welcome to our Site"
  erb :index
end

post '/urls' do
  p params[:full_url]
  @url = Url.create(full_url: params[:full_url])
  @notification = "Your Email format is Invalid" unless @url.valid?
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

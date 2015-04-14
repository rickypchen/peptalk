get '/search' do
  query = params[:query]
  client = Soundcloud.new(:client_id => ENV['SOUNDCLOUND_CLIENT_KEY'])
  @tracks = client.get('/tracks', :limit => 3, :q => query)
  @speeches = []
  @track_url = []
  @tracks.each do |track|
    @track_url << track.permalink_url
    @embed_info = client.get('/oembed', :url => track.permalink_url, :maxheight => 166)
    @speeches << @embed_info
  end
  @searches = Hash[*@track_url.zip(@speeches).flatten]
  erb :search
end

post '/users/:user_name/wall/newspeech' do
  track_url = params[:url]
  current_user.quotes.create(quote: track_url, author: params[:author])
  redirect "/users/#{current_user.username}/wall"
end

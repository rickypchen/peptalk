post '/users/:user_name/wall/newspeech' do
  client = Soundcloud.new(:client_id => ENV['SOUNDCLOUND_CLIENT_KEY'])
  track_url = params[:url]
  @embed_info = client.get('/oembed', :url => track_url)
  quote = @embed_info['html']
  p quote
  @new_speech = Quote.create(quote: quote, author: params[:author])
  current_user.quotes << @new_speech
  redirect "/users/#{current_user.username}/wall"
end

get '/search' do
  query = params[:query]
  client = Soundcloud.new(:client_id => ENV['SOUNDCLOUND_CLIENT_KEY'])
  @tracks = client.get('/tracks', :limit => 3, :q => query)
  @speeches = []
  @track_url = []
  @tracks.each do |track|
    @track_url << track.permalink_url
    @embed_info = client.get('/oembed', :url => track.permalink_url)
    @speeches << @embed_info
  end
  @searches = Hash[*@track_url.zip(@speeches).flatten]
  p @searches
  erb :search
end
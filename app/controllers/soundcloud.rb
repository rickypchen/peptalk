post '/users/:user_name/wall/newspeech' do
  client = Soundcloud.new(:client_id => ENV['SOUNDCLOUND_CLIENT_KEY'])
  track_url = params[:url]
  @embed_info = client.get('/oembed', :url => track_url)
  quote = @embed_info['html']
  @new_speech = Quote.create(quote: quote, author: params[:author])
  current_user.quotes << @new_speech
  redirect "/users/#{current_user.username}/wall"
end
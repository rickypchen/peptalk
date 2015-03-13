
get '/auth/soundcloud/callback' do
  client = Soundcloud.new({
    :client_id => ENV['SOUNDCLOUND_CLIENT_KEY'],
    :client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'],
    :redirect_uri => 'http://localhost:9393/soundcloud/callback'
                          })

  redirect client.authorize_url
end

get '/soundcloud/callback' do
  client = Soundcloud.new({
    :client_id => ENV['SOUNDCLOUND_CLIENT_KEY'],
    :client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'],
    :redirect_uri => 'http://localhost:9393/soundcloud/callback'
                          })
  code = params[:code]
  access_token = client.exchange_token(:code => code)
  session[:token] = access_token["access_token"]
  redirect '/soundcloud/user'
end

get '/soundcloud/user' do
  client = Soundcloud.new(:access_token => session[:token])
  current_user = client.get('/me')
  userinfo = current_user.to_json
  userinfo = JSON.parse(userinfo)
  @user = User.find_or_create_by(username: userinfo["username"], first_name: userinfo["first_name"], last_name: userinfo["last_name"])
  session[:user_id] = @user.id
  redirect "/users/#{@user.username}/wall"
end

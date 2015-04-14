
get '/auth/soundcloud/callback' do
  client = Soundcloud.new({
    :client_id => ENV['SOUNDCLOUND_CLIENT_KEY'],
    :client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'],
    :redirect_uri => 'http://peptalk.herokuapp.com/soundcloud/callback'
                          })

  redirect client.authorize_url
end

get '/soundcloud/callback' do
  client = Soundcloud.new({
    :client_id => ENV['SOUNDCLOUND_CLIENT_KEY'],
    :client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'],
    :redirect_uri => 'http://peptalk.herokuapp.com/soundcloud/callback'
                          })
  code = params[:code]
  access_token = client.exchange_token(:code => code)
  session[:token] = access_token["access_token"]
  redirect '/soundcloud/user'
end

get '/soundcloud/user' do
  client = Soundcloud.new(:access_token => session[:token])
  userinfo = client.get('/me')
  @profile = userinfo["avatar_url"]
  @user = User.find_or_create_by(username: userinfo["username"], first_name: userinfo["first_name"], last_name: userinfo["last_name"], profile_image: userinfo["avatar_url"])
  session[:user_id] = @user.id
  redirect "/users/#{@user.username}/wall"
end

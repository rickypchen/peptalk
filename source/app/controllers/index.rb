get '/' do
  erb :index
end

post '/users/new' do
  @new_user = User.new(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], password: params[:password])
  if @new_user && @new_user.save
    redirect '/users'
  else
    flash[:registration_error] = @new_user.errors.full_messages
    redirect '/'
  end
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.username}/wall"
  else
    flash[:login_error] = "Invalid password/username"
    redirect '/'
  end
end

delete '/sessions/:user_id' do
  session[:user_id] = nil
  redirect '/'
end

get "/users/:user_name/wall" do
  @user = User.find_by(username: params[:user_name])
  erb :wall
end
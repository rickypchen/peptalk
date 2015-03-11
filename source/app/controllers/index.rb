get '/' do
  erb :index
end

post '/users/new' do
  @user = User.new(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], password: params[:password_hash])
  @user.save
  flash[:error] = @user.errors.full_messages
  redirect '/'
end

get '/wall' do
  erb :wall
end
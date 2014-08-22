get '/user' do
  redirect "/user/#{current_user.id}" if is_logged_in?
  erb :index
end

get '/user/signup' do
  erb :"/user/signup"
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :"/user/profile"
end

post '/user/login' do
  login
  return erb :index if @errors != nil
  redirect "/user/#{@user.id}"
end

get '/user/:id/logout' do
  session[:user_id] = nil
  erb :index
end

post '/user/signup' do
  user = User.new(params[:user])
  if user.save
    redirect "/user/#{user.id}"
  elsex
    @errors = user.errors
    erb :"/user/signup"
  end
end

get '/user/:id/edit' do
  @user = User.find(params[:id])
  erb :"/user/edit"
end
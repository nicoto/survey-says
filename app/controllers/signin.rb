# HTML form to sign up
get '/signin' do
  erb :signin
end

post '/signin' do
  @user = User.where(username: params[:username]).first if params[:username]
  if @user && @user.password_hash == params[:password_hash]
    session[:user_id] = @user.id
    redirect to '/survey'
  end
  @errors = "Your login info was incorrect! Please try again!"
  erb :signin
end

post '/signout' do
  if params[:signout]
    session[:user_id] = nil
  end
  redirect to '/'
end


get '/signup' do
  erb :signup
end

post '/signup' do
  if params[:user][:password_hash] == params[:password_hash_verify]
    @user = User.new(params[:user])
    #set a session now that they are logged in
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    end
  end
  @error = "Sorry! Your username, or password, or BOTH are incorrect."
  erb :signup
end

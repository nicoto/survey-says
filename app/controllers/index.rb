get '/' do
  if current_user
    "Hello You are Here!"
    # redirect "/#{current_user}/surveys"
  else
    redirect "/signin"
  end
end

get '/' do
  if current_user
    "Hello You are Here!"
    redirect "/survey"
  else
    redirect "/signin"
  end
end


 # list of surveys
get '/survey' do
  p params
  if Survey.any?
    @surveys = Survey.all
  erb :'/survey/show'
  end
end

get '/survey/new' do
  erb :'/survey/new'
end
post '/survey/new' do
  p params
  survey = Survey.new(name: params[:name])
  if survey.save
    redirect '/survey'
  else
    @error = "Entry invalid"
    erb :"/survey/new"
  end
end




# get 'user/:id/survey/:id'
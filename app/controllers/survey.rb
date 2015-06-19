
 # list of surveys
 get '/survey' do
  p params
    @surveys = Survey.all
    erb :'/survey/list'
end

# get '/survey/new' do
#   erb :'/survey/new'
# end

post '/survey/new' do
  p params
  survey = Survey.new(name: params[:name], user_id: current_user.id)
  if survey.save
    redirect '/survey'
  else
    @error = "Entry invalid"
    erb :"/survey/new"
  end
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  @questions = Question.where(survey_id: @survey.id)
  erb :"survey/show"
end






# get 'user/:id/survey/:id'

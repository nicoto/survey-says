require 'json'


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
    erb :"/survey"
  end
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  @questions = Question.where(survey_id: @survey.id)
  erb :"survey/show"
end

post '/survey/:id' do
  content_type :json
  @question = Question.new(question: params[:question], survey_id: params[:survey_id])
  if @question.save
    @Answer1 = Answer.create(question_id: @question.id, content: params[:ans1])
    @Answer2 = Answer.create(question_id: @question.id, content: params[:ans2])
    response_value = {question: @question, ans1: @Answer1, ans2: @Answer2}.to_json
  else
    response_value = "im not really good at this......".to_json
  end
  return response_value
end






# get 'user/:id/survey/:id'

require 'json'


 # list of surveys
 get '/survey' do
  p params
    @surveys = Survey.all
    erb :"/survey/list"
end

# get '/survey/new' do
#   erb :'/survey/new'
# end

post '/survey/new' do
  p "*" * 100
  p params
  survey = Survey.new(name: params[:name], user_id: current_user.id)
  if survey.save
    p "*" * 100
    erb :"survey/_list_new", locals: {survey: survey}, layout: false
  else
    "this is wrong"
  end
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :"survey/show"
end

post '/survey/:id' do
  question = Question.new(question: params[:question], survey_id: params[:survey_id])
  if question.save
    Answer.create!(question_id: question.id, content: params[:ans1])
    Answer.create!(question_id: question.id, content: params[:ans2])
    erb :"survey/_list_question", locals:{ question: question }, layout: false
  else
    status 400
    question.errors.full_messages.join("\n")
  end
end


get '/survey/:id/results' do
  @questions_for_the_survey = Question.where(survey_id: params[:id])
  @result = SelectedAnswer.where(question_id: params[:id])
  erb :"survey/result"
end

post '/survey/:id/results' do
  SelectedAnswer.transaction do
    params[:questions].each do |question_id, answer_id|
      selected_answer = SelectedAnswer.where(
        user_id: current_user.id,
        question_id: question_id,
      ).first_or_initialize
      selected_answer.answer_id = answer_id;
      selected_answer.save!
    end
  end

  redirect to("/survey/#{param[:id]}/results")
end






# get 'user/:id/survey/:id'

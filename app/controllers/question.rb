post '/question' do
  p params
  @question = Question.new(question: params[:question], survey_id: params[:survey_id])
  if @question.save
    @Answer1 = Answer.create(question_id: @question.id, content: params[:ans1])
    @Answer2 = Answer.create(question_id: @question.id, content: params[:ans2])
    redirect "/survey/#{@question.survey_id}"
  end
end

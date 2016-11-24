class AnswersController < ApplicationController

  before_action :authenticate_user!
  def create
    question = Question.find(params[:question_id])
    question.answers.create(answers_params)
    redirect_to :back
  end

  def answers_params
     params.require(:answer).permit(:body).merge(user: current_user)
  end

end

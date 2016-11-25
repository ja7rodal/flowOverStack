class AnswersController < ApplicationController

  before_action :authenticate_user!
  def create
    question = Question.find(params[:question_id])
    answer = question.answers.new(answers_params)
    if answer.save
      redirect_to question_path(question), notice:"Respuesta actualizada"
    else
      @@errs = answer.errors
      redirect_to question_path(question)
    end

  end

  def answers_params
     params.require(:answer).permit(:body).merge(user: current_user)
  end

end

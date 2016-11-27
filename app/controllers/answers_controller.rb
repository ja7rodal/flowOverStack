class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create

    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answers_params)
    @comment = Comment.new
    if @answer.save
      redirect_to @question, notice: "Respuesta enviada"
    else
      render "questions/show"
    end
  end

  def answers_params
     params.require(:answer).permit(:body).merge(user: current_user)
  end
end

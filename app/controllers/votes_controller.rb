class VotesController < ApplicationController
  before_action :authenticate_user!
  #before_filter :load_voteable

  def create
    resource, id = request.path.split('/')[1, 2]
    @voteable = resource.singularize.classify.constantize.find(id)
    @voteable.class.to_s == "Answer" ? @question = @voteable.question : @question = @voteable
    @vote = @voteable.votes.create(user: current_user)
    @answer = Answer.new
    @comment = Comment.new
    redirect_to @question, notice: "Voto Creado"

  end

  def destroy
    @question = Question.find(params[:ans])
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to @question, notice: "Voto eliminado"
  end

  private

  def load_voteable
    resource, id = request.path.split('/')[1, 2]
    @voteable = resource.singularize.classify.constantize.find(id)

  end
end

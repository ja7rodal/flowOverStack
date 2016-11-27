class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_commentable


  def create
    @commentable.class.to_s == "Answer" ? @question = @commentable.question : @question = @commentable
    @comment = @commentable.comments.new comment_params
    @answer = Answer.new

    if @comment.save
      redirect_to @question, notice: "Comentario Creado"
    else
      render "questions/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end

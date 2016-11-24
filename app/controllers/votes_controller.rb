class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = @voteable.votes.new vote_params
    @vote.user = current_user
    @vote.save
    redirect_to :back
  end

  private

    def vote_params
      params.require(:vote).merge(user: current_user)
    end
end

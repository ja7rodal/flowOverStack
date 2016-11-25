class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = @voteable.votes.create(user: current_user)
    @vote.save
    redirect_to :back
  end

  def destroy
    vote = Vote.all
    vote.where(user: current_user).take.try(:destroy)

    redirect_to :back
  end

end

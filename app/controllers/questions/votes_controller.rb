class Questions::CommentsController < CommentsController
  before_action :set_voteable

  private

    def set_voteable
      @voteable = Question.find(params[:question_id])
    end
end

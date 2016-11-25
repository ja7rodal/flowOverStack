# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :text
#  question_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  validates :body, presence: true

  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

end

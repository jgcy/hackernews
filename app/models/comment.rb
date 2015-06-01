class Comment < ActiveRecord::Base
  validates :comment_body, presence: true

  belongs_to :user
  belongs_to :status

end

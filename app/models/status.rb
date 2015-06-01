class Status < ActiveRecord::Base
  validates :status_body, presence: true

  has_many :status_tags
  has_many :tags, through: :status_tags
  belongs_to :user
end

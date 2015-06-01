class Tag < ActiveRecord::Base
  validates :name, presence: true
  has_many :status_tags
  has_many :statuses, through: :status_tags
end

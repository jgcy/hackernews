class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :statuses, through: :status_tags
end

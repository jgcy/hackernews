class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password, presence:true, length: {minimum: 6}

  has_one :profile
  has_many :statuses
  has_many :tags, through: :statuses
  has_many :likes, through: :statuses

  def self.authenticate(email, password)
    @user = User.where(email: email, password: password).first

    if @user.present?
      @user
    else
      nil
    end
  end
end

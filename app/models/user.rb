class User < ActiveRecord::Base
  has_many :items
  has_many :comments
  has_many :stocks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  def stock?(item)
    stocks.find_by(item_id: item)
  end
end

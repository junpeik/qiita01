class Item < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :stocks
  validates :title, :body, presence: true
end

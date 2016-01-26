class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  validates :body, presence: true
end

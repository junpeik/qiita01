class Tag < ActiveRecord::Base
  has_many :items, through: :item_tags
  has_many :item_tags
end

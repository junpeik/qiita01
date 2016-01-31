class Item < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :stocks
  has_many :tags, through: :item_tags
  has_many :item_tags
  accepts_nested_attributes_for :tags
  validates :title, :body, presence: true

  def tags_attributes=(params)
    if tags = params['0']['name']
      tags.gsub('　', ' ').split(' ').each do |tag_name|
        tag = Tag.find_or_create_by!(name: tag_name)
        self.item_tags.find_or_initialize_by(tag: tag)
      end
    end
  end
end

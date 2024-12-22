class Toy < ApplicationRecord
  has_many :toy_tags, dependent: :destroy
  has_many :tags, through: :toy_tags

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def assign_tags(tag_names)
    return if tag_names.blank?

    # 半角スペース又は全角スペースで分割
    tag_names = tag_names.gsub(/　/, ' ') # 全角スペースを半角スペースに変換
    tag_names.split(" ").map(&:strip).each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      tags << tag unless tags.include?(tag)
    end
  end
end

class Toy < ApplicationRecord
  has_many :toy_tags, dependent: :destroy
  has_many :tags, through: :toy_tags

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end

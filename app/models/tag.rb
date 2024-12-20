class Tag < ApplicationRecord
  has_many :toy_tags, dependent: :destroy
  has_many :toys, through: :toy_tags

  validates :name, presence: true, uniqueness: true
end

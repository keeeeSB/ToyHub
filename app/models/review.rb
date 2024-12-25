class Review < ApplicationRecord
  belongs_to :user
  belongs_to :toy

  validates :comment, presence: true, length: { maximum: 50 }
  validates :rating, presence: true
end

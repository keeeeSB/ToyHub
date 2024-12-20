class ToyTag < ApplicationRecord
  belongs_to :toy
  belongs_to :tag
end

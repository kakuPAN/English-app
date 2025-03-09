class Sentence < ApplicationRecord
  has_many :words

  validates :content, presence: true
  validates :content, length: { maximum: 2000 }
end

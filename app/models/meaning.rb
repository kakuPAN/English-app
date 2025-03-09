class Meaning < ApplicationRecord
  belongs_to :unknown_word

  validates :content, length: { maximum: 5 }, presence: true
end

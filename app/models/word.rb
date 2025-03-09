class Word < ApplicationRecord
  belongs_to :sentence
  has_many :unknown_words
end

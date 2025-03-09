class UnknownWord < ApplicationRecord
  belongs_to :word
  has_many :meanings
end

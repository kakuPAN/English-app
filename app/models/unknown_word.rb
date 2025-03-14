class UnknownWord < ApplicationRecord
  has_many :meanings, dependent: :destroy
  has_many :examples, dependent: :destroy
end

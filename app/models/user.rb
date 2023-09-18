class User < ApplicationRecord
  has_many :transactions
  has_many :categorys
  validates :name, presence: true
end

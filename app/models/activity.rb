class Activity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories, through: :category_activities
  has_many :category_activities
  validates :name, :amount, presence: true
end

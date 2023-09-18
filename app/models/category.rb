class Category < ApplicationRecord
  has_many :category_activities, dependent: :destroy
  has_many :activities, through: :category_activities, dependent: :destroy, class_name: 'Activity'
  validates :name, :icon, :user_id, presence: true
end

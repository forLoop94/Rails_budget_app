class CategoryActivity < ApplicationRecord
  belongs_to :activity, class_name: 'Activity'
  belongs_to :category, class_name: 'Category'
end

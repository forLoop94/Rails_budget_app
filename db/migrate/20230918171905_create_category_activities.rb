class CreateCategoryActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :category_activities do |t|
      t.references :category, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end

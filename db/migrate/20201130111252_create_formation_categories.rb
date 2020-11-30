class CreateFormationCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :formation_categories do |t|
      t.references :formation, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateFormations < ActiveRecord::Migration[6.0]
  def change
    create_table :formations do |t|
      t.string :title
      t.integer :capacity
      t.string :description

      t.timestamps
    end
  end
end

class CreateFormationSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :formation_sessions do |t|
      t.timestamp :start_date
      t.string :end_date
      t.string :timestamp
      t.references :room, null: false, foreign_key: true
      t.references :formation, null: false, foreign_key: true
      t.timestamps
    end
  end
end

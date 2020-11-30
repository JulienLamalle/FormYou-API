class CreateFormationSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :formation_sessions do |t|
      t.timestamp :start_date
      t.string :end_date
      t.string :timestamp
      t.belongs_to :room, null: false, index: true
      t.belongs_to :formation, null: false, index: true
      t.timestamps
    end
  end
end

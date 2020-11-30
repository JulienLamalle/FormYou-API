class CreateFormationAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :formation_attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :formation, null: false, foreign_key: true
      t.references :formation_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class FormationAttendance < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :user
  belongs_to :formation
  belongs_to :formation_session


end

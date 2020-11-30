class FormationSession < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :room
  belongs_to :formation
  has_many :formation_attendances
  has_many :users, through: :formation_attendances
  has_many :formations, through: :formation_attendances

  
end

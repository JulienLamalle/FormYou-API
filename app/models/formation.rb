class Formation < ApplicationRecord

   # ASSOCIATIONS
   has_many :formations_attendances
   has_many :users, through: :formation_attendances
   has_many :rooms, through: :formation_sessions
   has_many :formation_categories
   has_many :categories, through: :formation_categories

   # VALIDATIONS
   validates :name, :description, presence: true
end

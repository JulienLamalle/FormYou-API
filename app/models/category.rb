class Category < ApplicationRecord
    # ASSOCIATIONS
    has_many :formations, through: :formation_categories
    # VALIDATIONS
    validates :name, presence: true
end

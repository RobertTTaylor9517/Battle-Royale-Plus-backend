class Character < ApplicationRecord
    belongs_to :team
    has_many :character_attacks, dependent: :destroy
    has_many :attacks, through: :character_attacks
end

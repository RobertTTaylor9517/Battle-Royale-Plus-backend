class Attack < ApplicationRecord
    has_many :character_attacks
    has_many :characters, through: :character_attacks
end

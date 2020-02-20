class Enemy < ApplicationRecord
    has_many :floor_enemies
    has_many :floors, through: :floor_enemies
    has_many :enemy_attacks
    has_many :attacks, through: :enemy_attacks
end

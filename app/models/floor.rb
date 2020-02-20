class Floor < ApplicationRecord
    belongs_to :dungeon
    has_many :floor_enemies
    has_many :enemies, through: :floor_enemies
end

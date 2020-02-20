class FloorEnemy < ApplicationRecord
    belongs_to :floor 
    belongs_to :enemy 
end

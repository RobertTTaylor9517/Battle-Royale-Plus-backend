class CharacterAttack < ApplicationRecord
    belongs_to :character 
    belongs_to :attack 
end

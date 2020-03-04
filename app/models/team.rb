require 'faker'
class Team < ApplicationRecord
    NUM_OF_CHARACTERS = 4
    belongs_to :user
    has_many :characters, dependent: :destroy

    validates :team_name, presence: true
    # validates :team_name, uniqueness: true

    def generate_team
        focus = ['ice', 'water', 'fire', 'earth']
        4.times do
            char = Character.create(name: Faker::Name.first_name, focus: focus.sample, health: 100, team_id: self.id)

            attacks = []
            attacks.concat(Attack.where(element: char.focus))
            attacks.concat(Attack.where(element: 'none'))
            attacks.concat(Attack.where(element: 'medic'))

            puts(attacks)

            4.times do
                CharacterAttack.create(character_id: char.id, attack_id: attacks.sample.id)
            end

        end
    end

private


    def validate_char_limit(character)
        raise Exception.new if characters.size >= NUM_OF_CHARACTERS
    end
end

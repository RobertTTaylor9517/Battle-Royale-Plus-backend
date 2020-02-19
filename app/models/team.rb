class Team < ApplicationRecord
    NUM_OF_CHARACTERS = 4
    belongs_to :user
    has_many :characters, before_add: :validate_char_limit

    validates :team_name, presence: true
    validates :team_name, uniqueness: true

private

    def validate_char_limit(character)
        raise Exception.new if characters.size >= NUM_OF_CHARACTERS
    end
end

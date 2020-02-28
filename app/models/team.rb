class Team < ApplicationRecord
    NUM_OF_CHARACTERS = 4
    belongs_to :user
    has_many :characters, dependent: :destroy

    validates :team_name, presence: true
    validates :team_name, uniqueness: true

    def message
        byebug
        return 'it worked'
    end

private


    def validate_char_limit(character)
        raise Exception.new if characters.size >= NUM_OF_CHARACTERS
    end
end

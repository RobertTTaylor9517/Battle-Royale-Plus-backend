class Team < ApplicationRecord
    belongs_to :user
    has_many :characters

    validates :team_name, prescence: true
    validates :team_name, uniqueness: true
end

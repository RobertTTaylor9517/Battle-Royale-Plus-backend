class Floor < ApplicationRecord
    belongs_to :dungeon
    has_many :floor_enemies
    has_many :enemies, through: :floor_enemies

    def gen_floor(easy, normal, hard, mini_boss, boss)
        case self.difficulty
        when 'easy'
            rand(1..2).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: easy.sample.id)
            end
        when 'normal'
            rand(1..2).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: normal.sample.id)
            end
            rand(2..3).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: easy.sample.id)
            end
        when 'hard'
            rand(1..2).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: hard.sample.id)
            end
            rand(2..3).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: normal.sample.id)
            end
        when 'harder'
            rand(3..4).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: hard.sample.id)
            end
        when 'mini_boss'
            FloorEnemy.create(floor_id: self.id, enemy_id: mini_boss.sample.id)
        when 'boss'
            FloorEnemy.create(floor_id: self.id, enemy_id: boss.sample.id)
        end
    end
    
end

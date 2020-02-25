class Floor < ApplicationRecord
    belongs_to :dungeon
    has_many :floor_enemies
    has_many :enemies, through: :floor_enemies

    def gen_floor()
        case self.difficulty
        when 'easy'
            easy = Enemy.where(difficulty: 'easy')
            rand(1..2).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: easy.sample.id)
            end
        when 'normal'
            easy = Enemy.where(difficulty: 'easy')
            normal = Enemy.where(difficulty: 'normal')
            rand(1..2).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: normal.sample.id)
            end
            rand(2..3).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: easy.sample.id)
            end
        when 'hard'
            normal = Enemy.where(difficulty: 'normal')
            hard = Enemy.where(difficulty: 'hard')

            rand(1..2).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: hard.sample.id)
            end
            rand(2..3).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: normal.sample.id)
            end
        when 'harder'
            hard = Enemy.where(difficulty: 'hard')
            rand(3..4).times do
                FloorEnemy.create(floor_id: self.id, enemy_id: hard.sample.id)
            end
        when 'mini_boss'
            mini_boss =  Enemy.where(difficulty: 'mini_boss')
            FloorEnemy.create(floor_id: self.id, enemy_id: mini_boss.sample.id)
        when 'boss'
            boss = Enemy.where(difficulty: 'boss')
            FloorEnemy.create(floor_id: self.id, enemy_id: boss.sample.id)
        end
    end
    
end

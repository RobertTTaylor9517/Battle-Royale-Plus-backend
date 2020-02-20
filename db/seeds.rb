# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Attack.destroy_all
Dungeon.destroy_all
Floor.destroy_all
FloorEnemy.destroy_all
Enemy.destroy_all
EnemyAttack.destroy_all

flame_pillar = Attack.find_or_create_by!(name: "Flame Pillar", element: "fire", damage: 25)
fire_flame = Attack.find_or_create_by(name: "Fire Flame", element: "fire", damage: 10)
flame_punch = Attack.find_or_create_by(name: "Fire Fist", element: "fire", damage: 15)
ice_pillar = Attack.find_or_create_by(name: "Ice Pillar", element: "ice", damage: 20)
frost =  Attack.find_or_create_by(name: "Frost", element: "ice", damage: 15)
freeze = Attack.find_or_create_by(name: "Freeze", element: "ice", damage: 30)
shake = Attack.find_or_create_by(name: "Shake", element: "earth", damage: 10)
rock = Attack.find_or_create_by(name: "Rock", element: "earth", damage: 20)
quake = Attack.find_or_create_by(name: "Quake", element: "earth", damage: 30)
water_wheel = Attack.find_or_create_by(name: "Water Wheel", element: "water", damage: 25)
wave = Attack.find_or_create_by(name: "Wave", element: "water", damage: 18)
flood = Attack.find_or_create_by(name: "Flood", element: "water", damage: 30)
rush = Attack.find_or_create_by(name: "Rush", element: "none", damage: 15)
strike = Attack.find_or_create_by(name: "Strike", element: "none", damage: 6)
heal = Attack.find_or_create_by(name: "Heal", element: "medic", damage: 25)
flameMaxim = Attack.find_or_create_by(name: "Maximum Flame", element: "boss", damage: 50)
stab = Attack.find_or_create_by(name: "Stab", element: "enem", damage: 30)
balast = Attack.find_or_create_by(name: "Balast", element: "enem", damage: 30)

goblin = Enemy.create!(name: "Goblin", health: 80, weakness: "fire")
EnemyAttack.find_or_create_by!(enemy_id: goblin.id, attack_id: rush.id)
EnemyAttack.find_or_create_by!(enemy_id: goblin.id, attack_id: strike.id)

mermen = Enemy.create!(name: "Merman", health: 100, weakness: "ice")
EnemyAttack.find_or_create_by!(enemy_id: mermen.id, attack_id: wave.id)
EnemyAttack.find_or_create_by!(enemy_id: mermen.id, attack_id: water_wheel.id)

highGoblin = Enemy.create!(name: "Goblin Mage", health: 100, weakness: "earth")
EnemyAttack.find_or_create_by!(enemy_id: highGoblin.id, attack_id: fire_flame.id)
EnemyAttack.find_or_create_by!(enemy_id: highGoblin.id, attack_id: flame_punch.id)
EnemyAttack.find_or_create_by!(enemy_id: highGoblin.id, attack_id: ice_pillar.id)

goblinKnight = Enemy.create!(name: "Goblin Knight", health: 90, weakness: 'fire')
EnemyAttack.find_or_create_by!(enemy_id: goblinKnight.id, attack_id: rush.id)
EnemyAttack.find_or_create_by!(enemy_id: goblinKnight.id, attack_id: rock.id)

golem = Enemy.create!(name: "Golem", health: 500, weakness: 'none')
EnemyAttack.find_or_create_by!(enemy_id: golem.id, attack_id: quake.id)
EnemyAttack.find_or_create_by!(enemy_id: golem.id, attack_id: rush.id)

dungeon1 = Dungeon.find_or_create_by(name: "First Dungeon")

floorA1 = Floor.create!(dungeon_id: dungeon1.id, difficulty: 'easy')
floorA2 = Floor.create!(dungeon_id: dungeon1.id, difficulty: 'easy')
floorA3 = Floor.create!(dungeon_id: dungeon1.id, difficulty: 'easy')
floorA4 = Floor.create!(dungeon_id: dungeon1.id, difficulty: 'easy')
floorA5 = Floor.create!(dungeon_id: dungeon1.id, difficulty: 'normal')
floorA6 = Floor.create!(dungeon_id: dungeon1.id, difficulty: 'normal')
floorA7 = Floor.create!(dungeon_id: dungeon1.id, difficulty: 'normal')
floorA8 = Floor.create!(dungeon_id: dungeon1.id, difficulty: 'normal')
floorA9 = Floor.create!(dungeon_id: dungeon1.id, difficulty: 'normal')
floorA10 = Floor.create!(dungeon_id: dungeon1.id, difficulty: 'hard')


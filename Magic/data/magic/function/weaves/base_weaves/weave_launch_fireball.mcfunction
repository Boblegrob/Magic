$summon fireball ^ ^ ^1 {Tags:["launched_fireball"],life:1200,Silent:1b,Health:1f,ExplosionPower:$(size)}
data modify storage magic:weave_launch_fireball Motion set value [0.0,0.0,0.0]

execute store result score @s reg_1 run data get entity @s Pos[0] 1000
execute as @e[tag=launched_fireball,limit=1,sort=nearest] store result score @s reg_1 run data get entity @s Pos[0] 1000
scoreboard players operation @e[tag=launched_fireball,limit=1,sort=nearest] reg_1 -= @s reg_1
execute store result storage magic:weave_launch_fireball Motion[0] double 0.002 run scoreboard players get @e[tag=launched_fireball,limit=1,sort=nearest] reg_1

execute store result score @s reg_1 run data get entity @s Pos[1] 1000
execute as @e[tag=launched_fireball,limit=1,sort=nearest] store result score @s reg_1 run data get entity @s Pos[1] 1000
scoreboard players operation @e[tag=launched_fireball,limit=1,sort=nearest] reg_1 -= @s reg_1
execute store result storage magic:weave_launch_fireball Motion[1] double 0.002 run scoreboard players get @e[tag=launched_fireball,limit=1,sort=nearest] reg_1

execute store result score @s reg_1 run data get entity @s Pos[2] 1000
execute as @e[tag=launched_fireball,limit=1,sort=nearest] store result score @s reg_1 run data get entity @s Pos[2] 1000
scoreboard players operation @e[tag=launched_fireball,limit=1,sort=nearest] reg_1 -= @s reg_1
execute store result storage magic:weave_launch_fireball Motion[2] double 0.002 run scoreboard players get @e[tag=launched_fireball,limit=1,sort=nearest] reg_1

execute anchored eyes run tp @e[tag=launched_fireball,limit=1,sort=nearest] ^ ^ ^2
data modify entity @e[tag=launched_fireball,limit=1,sort=nearest] Motion set from storage magic:weave_launch_fireball Motion
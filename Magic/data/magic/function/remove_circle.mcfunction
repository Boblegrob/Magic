tag @s remove circle_owner

scoreboard players operation Temp reg_1 = @s player_id

#Clear, temp might change when storing hotbar
execute as @a[tag=can_use] if score @s circled_owner_id = Temp reg_1 run tag @s add temp_remove_circle

tag @a[tag=temp_remove_circle] remove circled
tag @a[tag=temp_remove_circle] remove angrealed
scoreboard players reset @a[tag=temp_remove_circle] circled_owner_id

execute as @a[tag=temp_remove_circle] run function magic:load_hotbar

tag @a remove temp_remove_circle
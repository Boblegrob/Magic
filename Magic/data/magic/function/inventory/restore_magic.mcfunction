#Undos what inventory/restore_regular did

function magic:inventory/store_hotbar

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Air","italic":false,"color":"aqua"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=1,custom_data={Magic:1}] 1

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Earth","italic":false,"color":"dark_green"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=2,custom_data={Magic:2}] 1

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Fire","italic":false,"color":"red"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=3,custom_data={Magic:3}] 1

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Water","italic":false,"color":"dark_blue"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=4,custom_data={Magic:4}] 1

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Spirit","italic":false,"color":"white"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=5,custom_data={Magic:5}] 1

#32, perfectly balanced
give @s[tag=using] minecraft:ender_eye[enchantment_glint_override=1b,custom_name='[{"text":"Force","italic":false,"color":"dark_purple"}]',lore=['[{"text":"Controls your power","italic":false}]'],custom_model_data=1,custom_data={Magic:6,Magic_preserve:1}] 32
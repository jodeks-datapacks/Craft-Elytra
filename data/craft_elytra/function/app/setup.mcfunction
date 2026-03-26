scoreboard objectives add jodek.config dummy
execute unless score &craft_elytra_load_message jodek.config = &craft_elytra_load_message jodek.config run scoreboard players set &craft_elytra_load_message jodek.config 1
execute unless score &craft_elytra_advancements jodek.config = &craft_elytra_advancements jodek.config run scoreboard players set &craft_elytra_advancements jodek.config 1

scoreboard objectives add craft_elytra.image dummy

# Print the image
function craft_elytra:config/image
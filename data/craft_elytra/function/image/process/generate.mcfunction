#> craft_elytra:image/process/generate
#
# This function generates the image data.

data modify storage craft_elytra:image data.current.image_data set from storage craft_elytra:image data.image_data
data modify storage craft_elytra:image data.current.description set from storage craft_elytra:image data.description
data modify storage craft_elytra:image data.current.pixel_character set from storage craft_elytra:image data.pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data craft_elytra.image 0
# Set width
execute store result score $width craft_elytra.image run data get storage craft_elytra:image data.width
# Set height
execute store result score $height craft_elytra.image run data get storage craft_elytra:image data.height
# Set length
scoreboard players operation $length craft_elytra.image = $width craft_elytra.image
scoreboard players operation $length craft_elytra.image *= $height craft_elytra.image
# Clear remaining entries in tellraw
data remove storage craft_elytra:image data.tellraw

# Add spacing on top
function craft_elytra:image/process/append/line_break
# Loop over image data
function craft_elytra:image/process/loop_over_image_data
# Add spacing on bottom
function craft_elytra:image/process/append/line_break
# Copy current pixel
data modify storage craft_elytra:image data.current.pixel_color set \
  from storage craft_elytra:image data.current.image_data[0]
data modify storage craft_elytra:image data.current.description_text set \
  from storage craft_elytra:image data.current.description[0]

scoreboard players add $index.image_data craft_elytra.image 1

# Calculate column
scoreboard players operation $index.column craft_elytra.image = $index.image_data craft_elytra.image
scoreboard players operation $index.column craft_elytra.image %= $width craft_elytra.image

# Calculate row
scoreboard players operation $index.row craft_elytra.image = $index.image_data craft_elytra.image
scoreboard players operation $index.row craft_elytra.image /= $width craft_elytra.image

# Append start spacing
execute if score $index.column craft_elytra.image matches 1 run \
  function craft_elytra:image/process/append/blank

# Append colored pixel
execute unless data storage craft_elytra:image data.current{pixel_color: ''} run \
  function craft_elytra:image/process/append/pixel
# Append background pixel
execute if data storage craft_elytra:image data.current{pixel_color: ''} run \
  function craft_elytra:image/process/append/background

# Append description
execute if score $index.column craft_elytra.image matches 0 run \
    function craft_elytra:image/process/image_end/description

# Remove first element from the image_data array
data remove storage craft_elytra:image data.current.image_data[0]
# Loop over rows
execute if score $index.row craft_elytra.image < $height craft_elytra.image run \
  function craft_elytra:image/process/loop_over_image_data
 
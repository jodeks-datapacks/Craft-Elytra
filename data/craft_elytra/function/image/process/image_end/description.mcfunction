# Append blank
function craft_elytra:image/process/append/blank

data modify storage craft_elytra:image data.tellraw append \
  from storage craft_elytra:image data.current.description_text

# Append blank
function craft_elytra:image/process/append/blank

# Append line_break
execute unless score $index.image_data craft_elytra.image = $length craft_elytra.image \
  run function craft_elytra:image/process/append/line_break

# Remove first element from the description
data remove storage craft_elytra:image data.current.description[0]
 
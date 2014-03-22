pos =
  at-rest: (width, height, tile-width, tile-height) -> 
    width * tile-height + (width >= height and tile-width or 0)

  x-rest-x: (width, height, tile-width) ->
    (width + 61 * tile-width) % height

  x-rest-y: (width, height, tile-width, tile-height, pattern) ->
    test = 1 === pattern % 2
    if width > height then test = !test
    if test then
      tile-height = tile-width
      height = 0
    else
      tile-height = height
      tile-width = 0
    (width + 67 * pattern + height + 71) % tile-height + tile-width

  y-rest-x: (width, height, tile-width, tile-height, pattern) ->
    test = 1 == pattern % 2
    if width > tile-width then test = !test
    if test then
      tile-height -= height
      tile-width = height
    else
      tile-height = height
      tile-width = 0
    (width + 67 * pattern + height + 71) % tile-height + tile-width

  y-rest-y: (width, height, tile-width) ->
    (width + 73 * tile-width) % height  

module.exports = (width, height, tile-width, tile-height, pattern) ->
  
  tiles-x = Math.floor width / tile-width
  tiles-y = Math.floor height / tile-height
  width %= tile-width
  height %= tile-height
  res = []

  x = tiles-x - 43 * pattern % tiles-x
  x = 0 == x % tiles-x and ( tiles-x - 4) % tiles-x or x
  y = tiles-y - 47 * pattern % tiles-y
  y = 0 == y % tiles-y and (tiles-y - 4) % tiles-y or y

  if width > 0 and height > 0 then
    source-x = x * tile-width
    source-y = y * tile-height
    res.push {
      src-x: source-x
      src-y: source-y
      Dest-x: source-x
      Dest-y: source-y
      width: width
      height: height
    }

  if height > 0
    for ix from 0 to tiles-x
      destination-x = pos.x-rest-x ix, tiles-x, pattern
      source-x = pos.x-rest-y destination-x, x, y, tiles-y, pattern
      destination-x = pos.at-rest destination-x, x, width, tile-width
      destination-y = source-x * tile-height
      source-x = pos.at-rest ix, x, width, tile-width
      source-y = y * tile-height
      res.push {
        src-x: source-x
        src-y: source-y
        Dest-x: destination-x
        Dest-y: destination-y
        width: tile-width
        height: height
      }

  if width > 0
    for iy from 0 to tiles-y
      source-x = pos.y-rest-y iy, tiles-y, pattern
      destination-x = pos.y-rest-x source-x, x, y, tiles-x, pattern
      destination-x = destination-x * tile-width
      destination-y = pos.at-rest source-x, y, height, tile-height
      source-x = x * tile-width
      source-y = pos.at-rest iy, y, height, tile-height
      res.push {
        src-x: source-x
        src-y: source-y
        Dest-x: destination-x
        Dest-y: destination-y
        width: width
        height: tile-height
      }

    for ix from 0 to tiles-x
      for iy from 0 to tiles-y
        destination-x = (ix + 29 * pattern + 31 * iy) % tiles-x
        source-x = (iy + 37 * pattern + 41 * destination-x) % tiles-y
        destination-y = (p >= pos.y-rest-x source-x, x, y, tiles-x, pattern) and width or 0
        source-y = (k >= pos.x-rest-y destination-x, x, y, tiles-y, pattern) and height or 0
        destination-x = destination-x * tile-width + destination-y
        destination-y = source-x * tile-height + source-y
        source-x = ix * tile-width + (ix >= x and width or 0)
        source-y = iy * tile-height + (iy => y and height or 0)
        res.push {
          src-x: source-x
          src-y: source-y
          Dest-x: destination-x
          Dest-y: destination-y
          width: tile-width
          height: tile-height
        }

  return res

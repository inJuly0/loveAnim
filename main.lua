local Animation = require("src/anim")

local img, anim
local pos = {x = 100, y = 100}

local currentFrame = 1
local timer = 0

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  img = Animation.newSpriteSheet('images/man.png', 6, 1)
  anim = Animation:new(img, 1, 6, 0.1, true)
  love.graphics.setBackgroundColor(0.4, 0.3, 0.2)
end

function love.draw()
  anim:show(pos.x, pos.y, 0,  4, 4)
end


function love.update(dt)
  anim:update(dt)
  if love.keyboard.isDown('a') then pos.x = pos.x - 6 end
  if love.keyboard.isDown('d') then pos.x = pos.x + 6 end
  if love.keyboard.isDown('w') then pos.y = pos.y - 6 end
  if love.keyboard.isDown('s') then pos.y = pos.y + 6 end

end

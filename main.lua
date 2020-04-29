local Sprite = require("src/SpriteSheet")
local Animation = require("src/anim")

local img, anim
local frames = {}
local pos = {x = 100, y = 100}

local currentFrame = 1
local timer = 0

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  img = Sprite:new('images/man.png', 6, 1)
  anim = Animation:new(img, 1, 6, 0.1, true)

  -- local hframes, width, height = 6, img:getDimensions()
  -- w = width / hframes
  -- frames[1] = love.graphics.newQuad( 0, 0, w, 32, img:getDimensions())
  -- frames[2] = love.graphics.newQuad(w, 0, w, 32, img:getDimensions())
  -- frames[3] = love.graphics.newQuad(2 * w, 0, w, 32, img:getDimensions())
  love.graphics.setBackgroundColor(0.4, 0.3, 0.2)
end

function love.draw()
  -- love.graphics.draw(img, frames[currentFrame], pos.x, pos.y, 0, 2, 2)
  -- love.graphics.print(timer)
  anim:show(pos.x, pos.y, 0,  4, 4)
end


function love.update(dt)

  -- timer = timer + dt
  -- if timer > 0.1 then
  --   if currentFrame > 2 then
  --     currentFrame = 1
  --   else currentFrame = currentFrame + 1 end
  --   timer = 0
  -- end
  anim:update(dt)
  if love.keyboard.isDown('a') then pos.x = pos.x - 6 end
  if love.keyboard.isDown('d') then pos.x = pos.x + 6 end
  if love.keyboard.isDown('w') then pos.y = pos.y - 6 end
  if love.keyboard.isDown('s') then pos.y = pos.y + 6 end

end

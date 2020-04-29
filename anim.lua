local SpriteSheet = require("SpriteSheet")

local Animation = {}

function Animation:new(spriteSheet, s, e, t, l)

  newAnim = {
    sheet = spriteSheet,
    startIndex = s,
    endIndex = e,
    duration = t,
    loop = l,
    currentIndex = s,
    frameCount = e - s,
    timeElapsed = 0
  }

  assert(newAnim.frameCount > 0)
  self.__index = self
  return setmetatable(newAnim, self)
end

function Animation:update(dt)
  self.timeElapsed = self.timeElapsed + dt
  if self.timeElapsed >= self.duration then
    if self.currentIndex + 1 > self.frameCount and self.loop then
      self.currentIndex = self.startIndex
    else
      self.currentIndex = self.currentIndex + 1
    end
    self.timeElapsed = 0
  end
end

function Animation:show(x, y, r, sx, sy)
  self.sheet:showFrame(self.currentIndex, x, y, r, sx, sy)
end

return Animation

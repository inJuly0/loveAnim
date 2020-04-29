local SpriteSheet = {}

function SpriteSheet:new(imagePath, hFrames, vFrames)
  newSheet = {
    _imageData = {source = nil, rows = 0, cols = 0},
    frameWidth = 0, frameHeight = 0
  }

  newSheet._imageData.source = love.graphics.newImage(imagePath)
  if newSheet._imageData.source == nil then return nil end

  -- set spritesheet grid dimensions

  local width, height = newSheet._imageData.source:getDimensions()
  newSheet.frameWidth = width / hFrames
  newSheet.frameHeight = height / vFrames


  newSheet._imageData.cols = width  / newSheet.frameWidth
  newSheet._imageData.rows = height / newSheet.frameHeight

  -- set of all the quads that can be accessed by indexing

  newSheet._frames = {}

  local r,c  = newSheet._imageData.rows, newSheet._imageData.cols

  for i = 1, r do
    for j = 1,c do
      newSheet._frames[(i - 1) * r + j] =
          love.graphics.newQuad(newSheet.frameWidth * (j - 1) ,
              newSheet.frameHeight * (i - 1),
              newSheet.frameWidth,
              newSheet.frameHeight,
              newSheet._imageData.source:getDimensions())
    end
  end

  self.__index = self
  return setmetatable(newSheet, self)
end

function SpriteSheet:showFrame(frameIndex, x, y, r, sx, sy)

  if frameIndex > table.getn(self._frames) or frameIndex <= 0 then
    return nil
  end

  love.graphics.draw(self._imageData.source,
      self._frames[frameIndex],
      x, y, r, sx, sy)
end

return SpriteSheet

# loveAnim
An animation library for the [LÖVE](https://love2d.org/) game framework in lua.
It takes in a sprite sheet preferably of a single game entity
(monster, item, anything) and generates a spritesheet which can then be animated
easily using the animation library.

## Usage

1. Download zip or clone the repo
2. copy over all the files in the `src` folder into your source directory
3. import using require and follow the example below :

``` lua

local Animation = require("anim")

-- in love.load() :

sheet = Animation.newSpriteSheet('images/image.png', 2 , 2)
anim1 = Animation:new(sheet, 1, 2, 0.1, true)

-- in love.draw():

anim1.show()

--in love.update(dt):

anim1.update(dt)

```

## Reference

creating a spritesheet and animating it:

```lua
sheet = Animation.newSpriteSheet(path, hFrames , vFrames)

-- path (string) : path to the source image
-- hFrames (number) : number of horizontal frames in the image
-- vFrames (number) : number of vertical frames in the image

anim = Animation:new(sheet, startIndex , endIndex, wait, loop)

-- sheet(SrpiteSheet) : spritesheet for the animation to draw from
-- startIndex(number): starting index of the animation in the spritesheet
-- endIndex(number): ending index of the animation in the spritesheet
-- wait(number): time to wait for each frame
-- loop(boolean): whether to loop the aniamtion or freeze on the last frame.

```

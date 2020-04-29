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

local SpriteSheet = require("srpite")
local Animation = require("anim")

-- in love.load() :

sheet = SpriteSheet:new('images/image.png', 2 , 2)
anim1 = Animation:new(sheet, 1, 2, 0.1, true)

-- in love.draw():

anim1.show()

--in love.update(dt):

anim1.update(dt)

```

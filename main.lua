HC = require "lib.HardonCollider"
V = require "lib.hump.vector"
STI = require "lib.STI"

require "lib.lovemachine.Animation.Animation"

require "Beam"
require "Enemy"
require "EnemyTypes"
require "GameObject"
require "Player"
require "Utils"

-- Work with the zerobrane debugger
if arg[#arg] == "-debug" then require("mobdebug").start() end

function love.load()
  require "LevelManager" -- calls level.load on level 1
end

function love.update(dt)
  LEVEL_MANAGER.update(dt)
end

function love.draw()
  LEVEL_MANAGER.draw()
end

function love.mousepressed(mx, my, button)
  LEVEL_MANAGER.mousepressed(mx, my, button)
end

function love.keypressed(key, isRep)
  LEVEL_MANAGER.mousepressed(key, isRep)
end

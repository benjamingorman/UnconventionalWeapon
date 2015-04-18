require "Object"
Beam = {}
Beam.__index = Beam

Beam.setPos = Object.setPos
Beam.setVel = Object.setVel

function Beam.new(position, angle)
  self = {}
  setmetatable(self, Beam)

  self.latestPoint = position
  local basePoint = Vector2.new(position.x, position.y)
  self.points = {basePoint, self.latestPoint}
  self.angle = angle or 0
  self.color = {125,125,0}
 
  return self
end

function Beam:update(dt)
  self:move(dt)
end

function Beam:draw()
  love.graphics.setColor( unpack(self.color) )
  for i = 1, #self.points do
    love.graphics.line(self.points[i]:xy(), self.points[i+1]:xy())
  end
  love.graphics.setColor(255,255,255)
end

function Beam:move(dt)
  local magnitude = self.velocity:magnitude()
  local delta = Vector2.new(math.cos(self.angle) * magnitude, math.sin(self.angle) * magnitude)

  self.latestPoint = self.latestPoint + delta 
end

function Beam:setAngle(angle)
  self.angle = angle
end

function Beam:bounce(pos)
  Vector2.assert(pos)
  self.points.insert(pos)
end
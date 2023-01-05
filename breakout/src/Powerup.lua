Powerup = Class {}

function Powerup:init(x, y, type)
    self.width = 16
    self.height = 16
    self.type = type
    self.x = x
    self.y = y
    self.dx = math.random(-200, 200)
    self.dy = math.random(50, 200)
    self.inPlay = true
end

function Powerup:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end
    return true
end

function Powerup:reset(x, y, type)
    self.width = 16
    self.height = 16
    self.type = type
    self.x = x
    self.y = y
    self.dx = math.random(-200, 200)
    self.dy = math.random(50, 200)
end

function Powerup:update(dt)
    if not self.inPlay then
        return
    end

    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    if self.x <= 0 then
        self.x = 0
        self.dx = -self.dx
        gSounds['wall-hit']:play()
    end

    if self.x >= VIRTUAL_WIDTH - self.width then
        self.x = VIRTUAL_WIDTH - self.width
        self.dx = -self.dx
        gSounds['wall-hit']:play()
    end

end

function Powerup:render()
    if self.inPlay then
        love.graphics.draw(gTextures['main'], gFrames['powerups'][self.type], self.x, self.y)
    end
end

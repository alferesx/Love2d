-- Include Simple Tiled Implementation into project
local sti = require "sti"

function love.load()
    -- Load map file
    map = sti("mapa.lua")

    -- Create new dynamic data layer called "Sprites" as the 8th layer
    local layer = map:addCustomLayer("Sprites", 3)

    -- Get player spawn object
    local player
    for k, object in pairs(map.objects) do
        if object.name == "Player" then
            player = object
            print('Achou!')
            break
        end
    end
    -- Create player object
    local sprite = love.graphics.newImage("sprite.png")
    layer.player = {
        sprite = sprite,
        x      = player.x,
        y      = player.y,
        ox     = sprite:getWidth() / 2,
        oy     = sprite:getHeight() / 1.35
    }

    -- Add controls to player
    layer.update = function(self, dt)
        -- 96 pixels per second
        local speed = 96

        -- Move player up
        if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
            self.player.y = self.player.y - speed * dt
        end

        -- Move player down
        if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
            self.player.y = self.player.y + speed * dt
        end

        -- Move player left
        if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
            self.player.x = self.player.x - speed * dt
        end

        -- Move player right
        if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
            self.player.x = self.player.x + speed * dt
        end
    end

    -- Draw player
    layer.draw = function(self)
        love.graphics.draw(
            self.player.sprite,
            math.floor(self.player.x),
            math.floor(self.player.y),
            0,
            1,
            1,
            self.player.ox,
            self.player.oy
        )

        -- Temporarily draw a point at our location so we know
        -- that our sprite is offset properly
        love.graphics.setPointSize(5)
        love.graphics.points(math.floor(self.player.x), math.floor(self.player.y))
    end

end

function love.update(dt)
    -- Update world
    map:update(dt)
end

function love.draw()
     -- Translate world so that player is always centred
     local player = map.layers["Sprites"].player
     local tx = math.floor(player.x - love.graphics.getWidth() / 2)
     local ty = math.floor(player.y - love.graphics.getHeight() / 2)
     love.graphics.translate(player.x, player.y)
    
     -- Draw world
     map:draw(-tx, -ty,1,1)
end
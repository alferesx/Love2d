blocox = 30
blocoy = 40
playerScript = require("player")
dialogScript = require("dialogScript")
local sti = require "sti"
local  animation
local layer
local player
function love.load()

    love.window.setMode(900, 1300, {resizable=true, vsync=false, minwidth=400, minheight=300})
    bloco = love.graphics.newImage('bloco.jpg')
    playerScript.iniciar()
    playerScript.load()

end

function love.draw()
    local tx = math.floor(playerScript.x - love.graphics.getWidth() / 2)
    local ty = math.floor(playerScript.y - love.graphics.getHeight() / 2)
    love.graphics.translate(-tx, -ty)
    dialogScript.draw()
    playerScript.draw()
    love.graphics.draw(bloco,blocox,blocoy,0,0.1,0.1)
    love.graphics.setBackgroundColor(0,0,0);
end

function love.update(dt)
    playerScript.update(dt)
    if love.keyboard.isDown('t') then
        dialogScript.load("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    end
    dialogScript.update(dt)
end





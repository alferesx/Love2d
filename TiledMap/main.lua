-- Include Simple Tiled Implementation into project
local sti = require "sti"
local playerScript = require "player"
local colisao

function love.load()
    --Dimensiona a janela do jogo com umas propriedades
        love.window.setMode(900, 1300, {resizable=true, vsync=false, minwidth=400, minheight=300})
    -- Load map file
    map = sti("mapa.lua")
    playerScript.load();
end

function love.update(dt)
    -- Update world
    map:update(dt)
    playerScript.update(dt);
end

function love.draw()
     --Ajusta a camera para sempre centralizar no player
     local tx = math.floor(playerScript.x - love.graphics.getWidth() / 2)
     local ty = math.floor(playerScript.y - love.graphics.getHeight() / 2)
     love.graphics.translate(-tx, -ty)
    
     -- Draw world
     map:draw(-playerScript.x,-playerScript.y,1.5,1.3)
     playerScript.draw();
end
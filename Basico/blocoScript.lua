blocox = 30
blocoy = 40
local bloco
local worldPlayer

local B;
local M = {}

function load()
    bloco = love.graphics.newImage('bloco.jpg')
end

function iniciar(x,y)
    blocox = x or 30;
    blocoy = y or 40;
end

function loadWorld(world)
    worldPlayer=world;
    B = {name="B"}
    worldPlayer:add(B, blocox, blocoy, bloco:getWidth()*0.1, bloco:getHeight()*0.1) -- x,y, width, height
end

function draw()
    love.graphics.draw(bloco,blocox,blocoy,0,0.1,0.1)
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("line",blocox, blocoy,  bloco:getWidth()*0.1,bloco:getHeight()*0.1 )
    love.graphics.setColor(1,1,1)
end

function update(dt)
    M.x = blocox ;
    M.y = blocoy;
   
end

M.load = load;
M.loadWorld = loadWorld;
M.draw = draw;
M.update = update;
M.iniciar = iniciar;
M.x = blocox ;
M.y = blocoy;
return M;





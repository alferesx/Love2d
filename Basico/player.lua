mariox = love.graphics.getWidth()/2
marioy = love.graphics.getHeight()/2
mario_speed=0.3;
local anim8 = require 'anim8/anim8'
local worldPlayer
local A;

direcao = 1;
local image2, animation

local hitbox = {
    x = love.graphics.getWidth()/2,
    y = love.graphics.getHeight()/2,
    h = 59,
    w = 40
}

local M = {}

function iniciar(x,y)
    mariox = x or love.graphics.getWidth()/2;
    marioy = y or love.graphics.getWidth()/2;
end

function loadWorld(world)
    worldPlayer=world;
   A  = {name="A"}
    worldPlayer:add(A, mariox, marioy, hitbox.w, hitbox.h) -- x,y, width, height
end

function load()

    image2 = love.graphics.newImage("Charactervector.png")
    local g = anim8.newGrid(400, 599, image2:getWidth(), image2:getHeight())
    animation = anim8.newAnimation(g('1-4',3),0.1);
    animation_vertical = anim8.newAnimation(g('1-4',1),0.1);
end

function draw()
    if direcao ==1 
    then
    animation:draw(image2, mariox+20, marioy+30,0,0.1,0.1,200,300)
    elseif direcao ==2 
        then
        animation:draw(image2, mariox+20, marioy+30,0,-0.1,0.1,200,300)
    elseif direcao ==3 
        then
            animation_vertical:draw(image2, mariox+20, marioy+30,0,0.1,-0.1,200,300)
    elseif direcao ==4 
        then
            animation_vertical:draw(image2, mariox+20, marioy+30,0,0.1,0.1,200,300)
    end
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("line",hitbox.x, hitbox.y, hitbox.w,hitbox.h )
    love.graphics.setColor(1,1,1)

end

function update(dt)
    M.x = mariox ;
    M.y = marioy;
    hitbox.x=mariox;
    hitbox.y=marioy;
    if love.keyboard.isDown( 'left' )
    then
        direcao=1;
        animation:update(dt)
        local actualX, actualY, cols, len = worldPlayer:move(A, mariox-mario_speed,marioy)
        mariox = actualX;
        marioy = actualY; 
        
     elseif     love.keyboard.isDown( 'right' )
     then
        direcao=2;
        animation:update(dt)
        local actualX, actualY, cols, len = worldPlayer:move(A, mariox+mario_speed,marioy)
        mariox = actualX;
        marioy = actualY;
        
     elseif     love.keyboard.isDown( 'up' )
     then
        direcao=3;
        animation_vertical:update(dt)
        local actualX, actualY, cols, len = worldPlayer:move(A, mariox,marioy-mario_speed)
        mariox = actualX;
        marioy = actualY;
        
     elseif     love.keyboard.isDown( 'down' )
     then
        direcao=4;
        local actualX, actualY, cols, len = worldPlayer:move(A, mariox,marioy+mario_speed)
        mariox = actualX;
        marioy = actualY;
        animation_vertical:update(dt) 
         end
         print(worldPlayer:getRect(A))
         print(mariox)
end


M.load = load;
M.loadWorld = loadWorld;
M.draw = draw;
M.update = update;
M.iniciar = iniciar;
M.x = mariox ;
M.y = marioy;
M.hitbox = hitbox;
return M;



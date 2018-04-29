mariox = love.graphics.getWidth()/2
marioy = love.graphics.getHeight()/2
mario_speed=0.3;
local anim8 = require 'anim8/anim8'

direcao = 1;
local image2, animation

local hitbox = {
    x = 0,
    y = 0,
    h = 0,
    w = 0
}

local M = {}

function iniciar(x,y)
    mariox = x or love.graphics.getWidth()/2;
    marioy = y or love.graphics.getWidth()/2;
    print('Teste do2 Debug')
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
    animation:draw(image2, mariox, marioy,0,0.1,0.1,200,300)
    elseif direcao ==2 
        then
        animation:draw(image2, mariox, marioy,0,-0.1,0.1,200,300)
    elseif direcao ==3 
        then
            animation_vertical:draw(image2, mariox, marioy,0,0.1,-0.1,200,300)
    elseif direcao ==4 
        then
            animation_vertical:draw(image2, mariox, marioy,0,0.1,0.1,200,300)
    end
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("line",hitbox.x, hitbox.y, hitbox.w,hitbox.h )
    love.graphics.setColor(255,255,255)

end

function update(dt)
    M.x = mariox ;
    M.y = marioy;
    hitbox.x=mariox-20;
    hitbox.y=marioy-30;
    hitbox.w=40;
    hitbox.h=59;
    if love.keyboard.isDown( 'left' )
    then
        direcao=1;
        animation:update(dt)
        mariox=mariox-mario_speed;
        
     elseif     love.keyboard.isDown( 'right' )
     then
        direcao=2;
        animation:update(dt)
        mariox=mariox+mario_speed;
        
     elseif     love.keyboard.isDown( 'up' )
     then
        direcao=3;
        animation_vertical:update(dt)
        marioy=marioy-mario_speed;
        
     elseif     love.keyboard.isDown( 'down' )
     then
        direcao=4;
        marioy=marioy+mario_speed;
        animation_vertical:update(dt) 
         end
  
end


M.load = load;
M.draw = draw;
M.update = update;
M.iniciar = iniciar;
M.x = mariox ;
M.y = marioy;
M.hitbox = hitbox;
return M;



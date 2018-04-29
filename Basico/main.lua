blocox = 30
blocoy = 40
playerScript = require("player")
dialogScript = require("dialogScript")
splashy = require"splashy"
local sti = require "sti"
local  animation

function love.load()
    --Inicia o som
    sound = love.audio.newSource("music.ogg", "stream")
    love.audio.play(sound)
    sound:setVolume(0.2)

    --Dimensiona a janela do jogo com umas propriedades
    love.window.setMode(900, 1300, {resizable=true, vsync=false, minwidth=400, minheight=300})
    
    --Carrega a imagem do bloco
    bloco = love.graphics.newImage('bloco.jpg')

    --Inicia o player
    playerScript.load()

end

function love.draw()

    --Ajusta a camera para sempre centralizar no player
    local tx = math.floor(playerScript.x - love.graphics.getWidth() / 2)
    local ty = math.floor(playerScript.y - love.graphics.getHeight() / 2)
    love.graphics.translate(-tx, -ty)

    -- chama a funcao desenho do dialog script e do player script
    dialogScript.draw()
    playerScript.draw()

    -- Desenha o bloco e o blacground
    love.graphics.draw(bloco,blocox,blocoy,0,0.1,0.1)
    love.graphics.setBackgroundColor(0,0,0);
end

function love.update(dt)

    --chama a funcao atualizar do player script e do dialog script
    playerScript.update(dt)
    dialogScript.update(dt)

    --se apertar t chama o dialog com o texto predefinido
    if love.keyboard.isDown('t') then
        dialogScript.load("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    end
    
end





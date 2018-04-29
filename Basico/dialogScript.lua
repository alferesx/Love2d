local M = {}


function dialog_setup(msg)
    dialog_message = msg
    dialog_length = 0
    dialog_speed = 10
    dialog_finished = false
    dialog_opened = true
  end

  function dialog_update(dt)
    if dialog_finished==false
    then 
        dialog_length = dialog_length + dialog_speed * dt
         if dialog_length > #dialog_message then
             dialog_finished = true
        end
    end    
  end

  function dialog_draw()
    if dialog_finished==false
    then 
        local msg = string.sub(dialog_message, 1, math.floor(dialog_length))
        love.graphics.printf(msg, 10, 10,600,'left')
    end
  end

M.load = dialog_setup;
M.draw = dialog_draw;
M.update = dialog_update;

return M;
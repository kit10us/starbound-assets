function init()
  message.setHandler("youwin", function()
      world.spawnItem(config.getParameter("winningItem"), vec2.add(object.position(), {0, 3}))
    end)
end

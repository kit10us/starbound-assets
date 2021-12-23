function init()
  self.open = false

  self.triggerTime = config.getParameter("openDelay")
  self.timer = 0
end

function update()
  local bossIds = config.getParameter("bossIds")
  local boss
  for _,bossId in pairs(bossIds) do
    boss = world.loadUniqueEntity(bossId)
    if boss ~= 0 then break end
  end

  if not self.open and boss == 0 then
    self.timer = self.timer + script.updateDt()

    if self.timer > self.triggerTime then
      sendMessage("openDoor")
      self.open = true
      self.timer = 0
    end
  elseif self.open and boss ~= 0 then
    sendMessage("lockDoor")
  end
end

function sendMessage(message)
  local doors = world.entityQuery(entity.position(), config.getParameter("unlockRange"), { includedTypes = { "object" } })
  for _,doorId in pairs(doors) do
    world.sendEntityMessage(doorId, message)
  end
end

function noblePortrait()
    local drawables = root.npcPortrait("full", "novakid", "captainnoble", 1, 1, {})
    local name = "Captain Noble"
    return drawables, name
end

function setBountyPortraits()
    local d, n = noblePortrait()
    for _, pType in pairs({"QuestStarted", "QuestComplete", "QuestFailed"}) do
        quest.setPortrait(pType, d)
        quest.setPortraitTitle(pType, n)
    end
end

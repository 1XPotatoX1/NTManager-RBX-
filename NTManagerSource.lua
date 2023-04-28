--[[
███╗   ███╗ █████╗ ██████╗ ███████╗    ██████╗ ██╗   ██╗    ██╗  ██╗██████╗  ██████╗ ████████╗ █████╗ ████████╗ ██████╗ ██╗  ██╗
████╗ ████║██╔══██╗██╔══██╗██╔════╝    ██╔══██╗╚██╗ ██╔╝    ╚██╗██╔╝██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗╚══██╔══╝██╔═══██╗╚██╗██╔╝
██╔████╔██║███████║██║  ██║█████╗      ██████╔╝ ╚████╔╝      ╚███╔╝ ██████╔╝██║   ██║   ██║   ███████║   ██║   ██║   ██║ ╚███╔╝ 
██║╚██╔╝██║██╔══██║██║  ██║██╔══╝      ██╔══██╗  ╚██╔╝       ██╔██╗ ██╔═══╝ ██║   ██║   ██║   ██╔══██║   ██║   ██║   ██║ ██╔██╗ 
██║ ╚═╝ ██║██║  ██║██████╔╝███████╗    ██████╔╝   ██║       ██╔╝ ██╗██║     ╚██████╔╝   ██║   ██║  ██║   ██║   ╚██████╔╝██╔╝ ██╗
╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝    ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚═╝      ╚═════╝    ╚═╝   ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
please dont remove this 😭]]

--//Manager
local nametagManager = {}
local nametagAuthorisation = { --Player UserIds
	[3243266725] = {Text = "SpecialUser", Color = Color3.fromRGB(133, 255, 51)}
}
local nametagRanks = { --GroupRanks
	[254] = {Text = "Owner", Color = Color3.fromRGB(255, 234, 0)}
}


function nametagManager.Authorisation(player: Player, Nametag, UpDown)
	for userRequired, rankProperties in nametagAuthorisation do
		if player.UserId == userRequired then
			local newRank2 = Nametag.PlayerRank:Clone()
			newRank2.Parent = Nametag
			newRank2.Name = "UserTag"
			if UpDown == ":" then
				newRank2.Position = UDim2.new(0, 0, 0, 0)
			else newRank2.Position = UDim2.new(0,0,0.3,0)	
			end
			newRank2.Text = rankProperties.Text
			newRank2.TextColor3 = rankProperties.Color
		else continue
		end
	end
end

function nametagManager.SetUp(player: Player, allowDisplay: boolean, rankId)	
	if not player then warn("NametagManager Error: Player wasn't sent as an argument.") return end
	
	local Nametag = script:WaitForChild("Template"):Clone()
	local PlayerCharacter = player.Character or player.CharacterAdded:Wait()
	
	Nametag.Parent = PlayerCharacter:WaitForChild("Head")
	Nametag.Adornee = PlayerCharacter.Head
	Nametag.PlayerName.Text = player.Name
	
	if allowDisplay then
		Nametag.PlayerName.Text = player.DisplayName
	end
	
	if rankId then
		if not player:IsInGroup(rankId) then return end
		for rankRequired, rankProperties in nametagRanks do
			if player:GetRankInGroup(rankId) >= rankRequired then
				Nametag.PlayerRank.Text = rankProperties.Text
				Nametag.PlayerRank.TextColor3 = rankProperties.Color
				nametagManager.Authorisation(player, Nametag, ":")
			else continue
			end
		end
	else
		nametagManager.Authorisation(player, Nametag, ".")
		Nametag.PlayerRank:Destroy()
	end
end

return nametagManager

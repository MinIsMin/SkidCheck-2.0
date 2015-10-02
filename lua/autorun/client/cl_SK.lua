/*
	=== SkidCheck - 2.0 ===
	--By HeX
*/


//Message
function Skid.Msg()
	//Sound
	if net.ReadBit() == 0 then
		surface.PlaySound("vo/npc/male01/herecomehacks0"..math.random(1,2)..".wav")
		return
	end
	
	
	//Message
	local self	 = net.ReadEntity()
	local Reason = net.ReadString()
	
	chat.AddText(
		Skid.GREY, "[",
		Skid.WHITE, "Skid",
		Skid.BLUE, "Check",
		Skid.GREY, "] ",
		(self.Team and team.GetColor( self:Team() ) or Skid.RED), self:Nick(),
		Skid.GREY, " (",
		Skid.GREEN, self:SteamID(),
		Skid.GREY, ")",
		Skid.GREY, " <",
		Skid.RED, Reason,
		Skid.GREY, "> ",
		Skid.GREY, "is a ",
		Skid.PINK, "KNOWN CHEATER"
	)
	
	//Sound
	surface.PlaySound("ambient/machines/thumper_shutdown1.wav")
	
	//Log
	if self == LocalPlayer() then return end
	local Log = Format(
		"\r\n[%s]: %s - %s (%s) - %s",
		os.date(), GetHostName(), self:Nick(), self:SteamID(), Reason
	)
	file.Append("cl_sk_encounters.txt", Log)
end
net.Receive("Skid.Msg", Skid.Msg)


//Console message
timer.Simple(1, function()
	MsgC(Skid.GREY, 	"\n[")
	MsgC(Skid.WHITE2, 	"Skid")
	MsgC(Skid.BLUE, 	"Check")
	MsgC(Skid.GREY, 	"] ")
	MsgC(Skid.GREEN, 	"Ready :)\n")
end)


















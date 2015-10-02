![](http://i.imgur.com/qJSb8nT.png)

```
=== SkidCheck - 2.0 ===
--By HeX

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ SkidCheck is the database of players who *I* don't want joining the UHDM server. +
+ If you don't trust the list, don't install it. It was made by me to keep out     +
+ people who ruin the game.  Not to cause drama.                                   +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

How to use:
Nothing is needed to configure or set up (Unless you want to).

By default, for any IDs in the database, this addon will do a warning message & sound
in the chat when those players spawn in the server.
It will also update the lists from GitHub on map change, and then every 6 hours.

It can not *detect* cheaters, nor can it punish anyone it finds. It can only do the
following:


CVars (Add to your server.cfg if you want to change default options):
sk_kick  0/1  --Prevent players on the naughty list from joining.
0 by default

sk_omit  1/0  --Send SK message to everyone BUT the known cheater
1 by default, useless if sk_kick or sk_admin is 1

sk_admin 0/1  --ONLY send SK messages to admins, no one else
0 by default, useless if sk_kick or sk_omit is 1

sk_sync  6/0  --Allow list sync from GitHub?
6 by default, value = hours to check for updates (0 to disable)

sk_silent 0/1 --Disable all SK messages? (WILL STILL KICK if sk_kick is 1)
0 by default



Commands:
sk            --Re-play the sound and message of any cheaters in game.

sk_update     --Sync all lists rignt now, usually runs every sk_sync hours



Logs (in the server's /data folder):
sk_connect.txt       --Logs known cheater join attempts
sk_encounters.txt    --Logs every known cheater that spawns (if sk_kick is 0)




Hooks (SERVER side):

hook.Add("BlockSkidConnect", "SK", function(user,SID, Reason)
	return true, "You're not welcome here.\n<"..Reason..">" --Reject connection
end)

Called when a known cheater connects.
return true to prevent connection (with optional custom message).
Return nil to allow (if sk_kick is 0)




hook.Add("OnSkid", "SK", function(ply, Reason)
	return true --Prevent SK message
end)

Called when a known cheater spawns in the server.
Return true to stop the default message and handle it yourself
Return nil for default message & sound (if sk_kick, sk_silent and sk_admin are 0)

sk_kick must be 0 for this to work, which will ALLOW them to join your server unless
handled yourself in this hook!





+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ If you want your ID removed, post an 'Issue' here with proof that you don't cheat +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

```








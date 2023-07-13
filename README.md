# lr Sends clients stats on LVL UP
 **Post-query to http used JSONObj after lvl up**

## Description
The plugin sends statistics on the server among the players every time the client raises his level. It is useful in order to track whether a player is on the server and does not wind up statistics.

## Requirements
- [REST in Pawn](https://hlmod.net/resources/rest-in-pawn.468/)
- [SourceMod](https://www.sourcemod.net/downloads.php?branch=stable)
- [LR](https://github.com/levelsranks/levels-ranks-core/tree/3.1.7B2)

## ConVar
In the server.cfg configuration file, specify convar `http_a "OWN_a_LINK"`

## Containts of post request
```json
{
	"SteamID":				"STEAM_0:1:180196110",
	"Name":					"Palonez",
	"Kills":				0,
	"Deaths":				0,
	"Scores":				0,
	"LVL_UP":				10,
	"Time":					1686829508,
	"Json":
	[
		"{
			'SteamID':		'Grant', 				
			'Kills':		1,	
			'Deaths':		0,	
			'Scores':		2,	
			'Time':			0
		}",
		"{
			'SteamID':	'Dean', 				
			'Kills':	1,	
			'Deaths':	0,	
			'Scores':	2,	
			'Time':		0
		}",
		"{
			'SteamID':	'Henry', 				
			'Kills':	0,	
			'Deaths':	1,	
			'Scores':	0,	
			'Time':		0
		}",
		"{
			'SteamID':	'STEAM_1:1:00000000',	
			'Kills':	0,	
			'Deaths':	0,	
			'Scores':	0,	
			'Time':		1109303291
		}"
	]
}
```
At this moment there are 2 real players on the server, one of which received the request, as well as 3 bots

## About possible problems, please let me know: 
- [HLMOD](https://hlmod.ru/members/palonez.92448/)
- [DISCORD](https://discord.com/users/quake1011/)
- [STEAM](https://steamcommunity.com/id/comecamecame/)

<pre>
	<center>
		<a src='https://vk.com/bgtroll'>
			<img type="full" width="100px" height="100px" src="https://hlmod.net/attachments/vk-process-mining-kopija-png.113163/">
		</a>
		
		<a src='https://hlmod.ru/members/palonez.92448/'>
			<img type="full" width="100px" height="100px" src="https://hlmod.net/attachments/png-transparent-brand-logo-steam-gump-s-kopija-png.113164/">
		</a>
		
		<a src='https://discordapp.com/users/quake1011/'>
			<img type="full" width="100px" height="100px" src="https://hlmod.net/attachments/app-icons-discord-png.113165/">
		</a>  
		
		<a src='https://steamcommunity.com/id/comecamecame'>
			<img type="full" width="100px" height="100px" src="https://hlmod.net/attachments/s-l500-png.113166/">
		</a>
		
		<a src='https://t.me/ArrayListX'>
			<img type="full" width="100px" height="100px" src="https://hlmod.net/attachments/tg-process-mining-kopija-png.113176/">
		</a>

		<a src='https://github.com/Quake1011'>
			<img type="full" width="100px" height="100px" src="https://hlmod.net/attachments/2056021-png.113177/">
		</a>
	</center>
</pre>

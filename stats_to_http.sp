#include <lvl_ranks>
#include <cstrike>
#include <ripext>

public Plugin myinfo = 
{ 
	name = "[LR] Sends client`s stats on LVL UP", 
	author = "Palonez", 
	description = "Post-request to http used JSONObj after lvl up", 
	version = "1.0", 
	url = "https://github.com/Quake1011" 
};

static char url[2048];

public void OnPluginStart()
{
	if(LR_IsLoaded()) LR_Hook(LR_OnLevelChangedPost, OnLvlCH);
	
	ConVar cvar;
	HookConVarChange(cvar = CreateConVar("http_url", "hlmod.ru", "the url to which the post request will be sent"), OnHook);
	cvar.GetString(url, sizeof(url));
}

public void OnHook(ConVar convar, const char[] oldValue, const char[] newValue)
{
	convar.GetString(url, sizeof(url));
}

public void OnLvlCH(int iClient, int iNewLevel, int iOldLevel) 
{
	if (0 < iClient <= MaxClients && IsClientInGame(iClient) && !IsFakeClient(iClient)) 
	{
		if (iOldLevel < iNewLevel) 
		{
			char auth[22], fmt[MAX_NAME_LENGTH];
	
			JSONArray jArray = new JSONArray();
			JSONObject obj = new JSONObject();

			GetClientAuthId(iClient, AuthId_Steam2, auth, sizeof(auth));
			Format(fmt, sizeof(fmt), "%s", auth);
			obj.SetString("SteamID", fmt);
			Format(fmt, sizeof(fmt), "%N", iClient);
			obj.SetString("Name", fmt);
			obj.SetInt("Kills", GetClientFrags(iClient));
			obj.SetInt("Deaths", GetClientDeaths(iClient));
			obj.SetInt("Scores", CS_GetClientContributionScore(iClient));
			obj.SetInt("LVL_UP", iNewLevel);
			obj.SetInt("Time", GetTime());

			for(int i = 1; i <= MaxClients; i++) 
			{
				if(IsClientInGame(i) && !IsClientSourceTV(i) && i != iClient) 
				{
					JSONObject tempobj = new JSONObject();
	
					IsFakeClient(i) ? GetClientName(i, fmt, sizeof(fmt)) : GetClientAuthId(i, AuthId_Steam2, auth, sizeof(auth));
					tempobj.SetString("SteamID", IsFakeClient(i) ? fmt : auth);
					tempobj.SetInt("Kills", GetClientFrags(i));
					tempobj.SetInt("Deaths", GetClientDeaths(i));
					tempobj.SetInt("Scores", CS_GetClientContributionScore(i));
					tempobj.SetFloat("Time", IsFakeClient(i) ? 0.0 : GetClientTime(i));
	
					jArray.Push(tempobj);
					delete tempobj;
				}
			}

			obj.Set("Json", jArray);

			HTTPRequest req = new HTTPRequest(url);
			req.Post(obj, OnAcceptObj);

			delete jArray;
			delete obj;
		}
	}
}

public void OnAcceptObj(HTTPResponse response, any value, const char[] error)
{
	if(response.Status != HTTPStatus_OK) 
	{
		LogMessage("Error: %s", error);
		return;
	}
	else LogMessage("Data successfully sends");
}
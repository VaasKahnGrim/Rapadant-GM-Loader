local AdminAPIKey = ''
local PublicAPIKey = ''
local SteamAPIKey = ""
local function Admin_SendLog(json)
	http.Post(AdminAPIKey,json, 
	function(result) end)
end
local function Public_SendLog(json)
	http.Post(PublicAPIKey,json, 
	function(result) end)
end
function discord_player_general(ply,text)
	if(IsValid(ply)) and (ply:IsPlayer()) and (!ply:IsBot()) and (isstring(text))then
		local nickname = string.JavascriptSafe(ply:Nick())
		local text = string.JavascriptSafe(text)
		local steamid = ply:SteamID64()
		http.Fetch(SteamAPIKey.."&steamids="..steamid,
			function(body,len,headers,code)
				local data = util.JSONToTable(body)
				local json_table = [[
				{
					"embeds": [
						{
							"color": "294330",
							"author": {
								"name": "]] .. nickname .. [[",
								"url": "]] .. data.response.players[1].profileurl .. [[",
								"icon_url": "]] .. data.response.players[1].avatarmedium .. [["
							},
							"description": "]] .. text .." steam://connect/join.rapadantnetworks.org:27125" .. [[",
							"thumbnail": {
								"url": "]] .. data.response.players[1].avatarmedium .. [["
							},
							"timestamp": "]] .. os.date("!%Y-%m-%dT%H:%M:%S", os.time()) ..[["
						}
					]
				}
			]]
			local tbl = util.JSONToTable(json_table)
			tbl['payload_json'] = json_table
			Admin_SendLog(tbl)
			end,
		function(error)	end)
	end
end
function discord_player_general_pub(ply,text)
	if(IsValid(ply)) and (ply:IsPlayer()) and (!ply:IsBot()) and (isstring(text))then
		local nickname = string.JavascriptSafe(ply:Nick())
		local text = string.JavascriptSafe(text)
		local steamid = ply:SteamID64()
		http.Fetch(SteamAPIKey.."&steamids="..steamid,
			function(body,len,headers,code)
				local data = util.JSONToTable(body)
				local json_table = [[
				{
					"embeds": [
						{
							"color": "294330",
							"author": {
								"name": "]] .. nickname .. [[",
								"url": "]] .. data.response.players[1].profileurl .. [[",
								"icon_url": "]] .. data.response.players[1].avatarmedium .. [["
							},
							"description": "]] .. text .." steam://connect/join.rapadantnetworks.org:27125".. [[",
							"thumbnail": {
								"url": "]] .. data.response.players[1].avatarmedium .. [["
							},
							"timestamp": "]] .. os.date("!%Y-%m-%dT%H:%M:%S", os.time()) ..[["
						}
					]
				}
			]]
			local tbl = util.JSONToTable(json_table)
			tbl['payload_json'] = json_table
			Public_SendLog(tbl)
			end,
		function(error)	end)
	end
end
function discord_player_darkrp(ply,text)
	if(IsValid(ply)) and (ply:IsPlayer()) and (!ply:IsBot()) and (isstring(text))then
		local nickname = string.JavascriptSafe(ply:Nick())
		local text = string.JavascriptSafe(text)
		local steamid = ply:SteamID64()
		http.Fetch(SteamAPIKey.."&steamids=".. steamid,
			function(body, len, headers, code)
				local data = util.JSONToTable(body)
				local json_table = [[
					{
						"embeds": [
							{
								"color": "14177041",
								"author": {
									"name": "]] .. nickname .. [[",
									"url": "]] .. data.response.players[1].profileurl .. [[",
									"icon_url": "]] .. data.response.players[1].avatarmedium .. [["
								},
								"description": "]] .. text .. [[",
								"thumbnail": {
									"url": "]] .. data.response.players[1].avatarmedium .. [["
								},
								"timestamp": "]] .. os.date("!%Y-%m-%dT%H:%M:%S", os.time()) ..[["
							}
						]
					}
				]]
				local tbl = util.JSONToTable(json_table)
				tbl['payload_json'] = json_table
				Admin_SendLog(tbl)
			end,
		function(error)	end)
	end
end
function Discord_Server_General(text)
	if(isstring(text))then
		local text = string.JavascriptSafe(text)
		local json_table = [[
			{
				"embeds": [
					{
						"color": "41270",
						"title": "]] .. text .." steam://connect/join.rapadantnetworks.org:27125" .. [[",
						"timestamp": "]] .. os.date("!%Y-%m-%dT%H:%M:%S", os.time()) ..[["
					}
				]
			}
		]]
		local tbl = util.JSONToTable(json_table)
		tbl['payload_json'] = json_table
		Admin_SendLog(tbl)
	end
end
function Discord_Server_General_pub(text)
	if(isstring(text))then
		local text = string.JavascriptSafe(text)
		local json_table = [[
			{
				"embeds": [
					{
						"color": "41270",
						"title": "]] .. text .." steam://connect/join.rapadantnetworks.org:27125" .. [[",
						"timestamp": "]] .. os.date("!%Y-%m-%dT%H:%M:%S", os.time()) ..[["
					}
				]
			}
		]]
		local tbl = util.JSONToTable(json_table)
		tbl['payload_json'] = json_table
		Public_SendLog(tbl)
	end
end
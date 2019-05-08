GM.LoaderName = 'VaasLoader'
GM.Name = ' StarwarsRP'
GM.Author = 'VaasKahnGrim'
GM.Email = 'no'
GM.Website = 'https://www.rapadantnetworks.org'
GM.Version = '1.0'
AddCSLuaFile'systems/antiscripthook/cl_init.lua'--because apparently people steal code. this should fuck over a few of the unintelligent attempts
AddCSLuaFile'systems/antiscripthook/sh_init.lua'

AddCSLuaFile'cl_init.lua'

--include'libs/discord.lua' (don't use for now, an example of using a lib within the loader for use in all modes)

local mode = 'default'
if(mode == 'default')then

	AddCSLuaFile'default_shared.lua'
	AddCSLuaFile'default_client.lua'
	include'default_shared.lua'
	include'default_init.lua'
	--[[put any systems that are to be loaded below this line. Think of systems as mode specific addons]]

elseif(mode == 'othermode')then
	AddCSLuaFile'othermode_client.lua'
	AddCSLuaFile'othermode_shared.lua'
	include'othermode_shared.lua'
	include'othermode_init.lua'
else
	print'Mode var not set'
end

--include'systems/server_function_overides/sv_init.lua' (don't use, this is an example of making a system work on all modes)
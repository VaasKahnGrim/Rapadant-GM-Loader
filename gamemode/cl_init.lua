AddCSLuaFile()
GM.LoaderName = 'VaasLoader'
GM.Name = "StarwarsRP"
GM.Author = 'VaasKahnGrim'
GM.Email = 'no'
GM.Website = 'https://www.rapadantnetworks.org'
GM.Version = '1.0'
include'systems/antiscripthook/cl_init.lua'--because apparently people steal code. this should fuck over a few of the unintelligent attempts

local mode = 'default'
if(mode == 'default')then

	include'default_shared.lua'
	include'default_client.lua'
	
	--[[put any systems that are to be loaded below this line. Think of systems as mode specific addons]]

elseif(mode == 'othermode')then
	include'othermode_shared.lua'
	include'othermode_client.lua'
else
	print'Mode var not set'
end

--[[end of loader]]

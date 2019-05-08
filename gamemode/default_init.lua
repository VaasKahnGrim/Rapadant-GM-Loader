--[[server]]
local fol = GM.FolderName..'/gamemode/default_modules/'
local files,folders = file.Find(fol..'*','LUA')

for _,v in pairs(files)do
	if DarkRP.disabledDefaults['modules'][v:Left(-5)] then continue end
	if string.GetExtensionFromFilename(v) ~= 'lua' then continue end
	include(fol..v)
end

for _,folder in SortedPairs(folders,true)do
	if folder == '.' or folder == '..' or DarkRP.disabledDefaults['modules'][folder] then continue end
	for _,File in SortedPairs(file.Find(fol..folder..'/sh_*.lua','LUA'),true)do
		AddCSLuaFile(fol..folder..'/'..File)
			if File == 'sh_interface.lua' then continue end
		include(fol..folder..'/'..File)
	end
	for _,File in SortedPairs(file.Find(fol..folder..'/sv_*.lua','LUA'),true)do
			if File == 'sv_interface.lua' then continue end
		include(fol..folder..'/'..File)
	end
	for _,File in SortedPairs(file.Find(fol..folder..'/cl_*.lua','LUA'),true)do
		if File == 'cl_interface.lua' then continue end
		AddCSLuaFile(fol..folder..'/'..File)
	end
end
--could probably write this better/might move to being shared later

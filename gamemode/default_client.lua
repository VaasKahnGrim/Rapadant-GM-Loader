--[[client]]
local function LoadModules()
	local root = GM.FolderName..'/gamemode/default_modules/'
	local _,folders = file.Find(root..'*','LUA')
	for _,folder in SortedPairs(folders,true)do
		if DarkRP.disabledDefaults['modules'][folder] then continue end
		for _,File in SortedPairs(file.Find(root..folder..'/sh_*.lua','LUA'),true)do
			if File == 'sh_interface.lua' then continue end
			include(root..folder..'/'..File)
		end
		for _,File in SortedPairs(file.Find(root..folder..'/cl_*.lua','LUA'),true)do
			if File == 'cl_interface.lua' then continue end
			include(root..folder..'/'..File)
		end
	end
end
LoadModules()

--could probably write this better
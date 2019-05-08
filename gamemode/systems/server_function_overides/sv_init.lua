--a simple example of overriding the print function, credits to Starlight|Oliver
local shouldprint = false
local oldprint = print

function print(...)
	if shouldPrint == true then
		oldprint(...)
	end
end


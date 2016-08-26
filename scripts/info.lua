
-- [[ board info
majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
print("NodeMCU "..majorVer.."."..minorVer.."."..devVer.." ChipID: "..chipid)
print("FLASH:  ID("..flashid..") SIZE("..flashsize..") MODE("..flashmode..") SPEED("..flashspeed..")")

-- [[ file content
flist = file.list();
for fname,fsize in pairs(flist) do
	print("#########################\n### name:"..fname..", size:"..fsize.."\n######")

	if file.open(fname, "r") == true
		then
			print(file.read('\r'))
			file.close()
		else
			print("Error: can't read file"..fname)
	end

end


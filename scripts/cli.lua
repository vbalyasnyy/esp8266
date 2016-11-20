function cat(fname)
	if file.open(fname, "r") == true then
		print(file.read('\r'))
		file.close()
	else
		print("Error: can't read file <"..fname..">")
	end
end

function ls()
	flist = file.list();
	for fname,fsize in pairs(flist) do
		print("### name:"..fname..", size:"..fsize)
	end
end


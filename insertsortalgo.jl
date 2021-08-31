function insertFileCabinet(fileCabinet, toInsert)
	locationCheck = length(fileCabinet)
	insertLocation = 1
	while locationCheck >= 1
		if toInsert > fileCabinet[ locationCheck ]
			insertLocation = locationCheck + 1
			locationCheck = lastindex(fileCabinet)
		end
		locationCheck = locationCheck - 1
	end
	insert!(fileCabinet, insertLocation, locationCheck )
	return fileCabinet
end

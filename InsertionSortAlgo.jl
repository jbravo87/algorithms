fileCabinet = []
typeof(fileCabinet)
fileCabinet
push!( fileCabinet, 1, 2, 2, 3, 3, 4, 6, 8, 12 )
toInsert = 5
toInsert
locationCheck = length( fileCabinet )
locationInsert = 1
if toInsert > fileCabinet[ locationCheck ]
    locationInsert = locationCheck + 1
end
insert!( fileCabinet, locationInsert, locationCheck )

funtcion insertFileCabinet( fileCabinet, toInsert )

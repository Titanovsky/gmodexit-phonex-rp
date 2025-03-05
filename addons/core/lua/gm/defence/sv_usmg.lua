local old_umsg_Start = umsg.Start

function umsg.Start( str, receivers  )
	print( '[usmg] Name: ', str )

   --debug.trace()
   old_umsg_Start( str, receivers )
end
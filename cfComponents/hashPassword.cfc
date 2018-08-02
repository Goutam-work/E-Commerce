<!---
  --- HashPassword
  --- ------------
  ---
  --- author: goutamg
  --- date:   7/30/18
  --->
<cfcomponent output = "false" >

	<cffunction name = "hashPassword" access = "public" output = "false">
		<cfargument name = "password" required = "true" />
		<cfreturn HASH('#arguments.password#','SHA1') />
	</cffunction>

</cfcomponent>
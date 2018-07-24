<cfcomponent  output="true" >


	<cffunction name="checkEmail" access="remote" returntype="boolean" returnformat="json">
		<cfargument name="mail" required="true" >

		<cfquery name="mailCheckQuery" result="countEmail" datasource="ECommerce">
	    	SELECT userID FROM users.user_details
	    	WHERE Email=<cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar" />;
		</cfquery>

		<cfif #mailCheckQuery.recordCount# >
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

</cfcomponent>
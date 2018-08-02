<cfcomponent  output="false" >
	<cffunction name="checkEmail" access="remote" returntype="string" returnformat="json">
		<cfargument name="mail" required="true" >
	<cftry>

		<cfquery name="mailCheckQuery" result="countEmail">
	    	SELECT userID FROM users.user_details
	    	WHERE Email=<cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar" />;
		</cfquery>
	<cfcatch>
			<cfset type="#cfcatch.Type#" />
			<cflog type="Error"
					file="ECommerce"
					text="Exception error --
					   	  Exception type: #type# " />
	</cfcatch>
	</cftry>
		<cfif #mailCheckQuery.recordCount# >
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

</cfcomponent>
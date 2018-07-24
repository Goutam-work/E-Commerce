
<cfcomponent  output="false" >
	<cffunction name="login" access="public" output="false" returntype="boolean" >
		<cfargument name="loginEmail" required="true" >
		<cfargument name="loginPassword" required="true" >
		<cfquery name="loginQuery" result="countEmail">
	    	SELECT userID,firstName,Email,password,userRole FROM users.user_details
	    	WHERE Email=<cfqueryparam value="#arguments.loginEmail#" cfsqltype="cf_sql_varchar" />
	    	AND password=<cfqueryparam value="#arguments.loginPassword#" cfsqltype="cf_sql_varchar" />;
		</cfquery>

		<cfif #loginQuery.recordCount# >
			<cfif #loginQuery.userRole#>
				<cfset var role="admin" >
			<cfelse>
				<cfset var role="user" >
			</cfif>
			<cflogin>
				<cfloginuser name="#loginQuery.firstName#" password="#loginQuery.password#" roles="#role#">
			</cflogin>
			<cfset session.loggedInUser = {'userName' = loginQuery.firstName, 'Email' = loginQuery.Email, 'userId' = loginQuerry.userID } />
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="logout" access="public" output="false" returntype="void" >
		<cfset structdelete(session,'loggedInUser') />
		<cflogout />
	</cffunction>

</cfcomponent>
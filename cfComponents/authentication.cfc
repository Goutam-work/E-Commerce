<cfcomponent  output = "false" >
	<!--- login function --->
	<cffunction name = "login" access = "remote" returntype = "string" returnformat = "json" >
		<cfargument name = "loginEmail" required = "true" >
		<cfargument name = "loginPassword" required = "true" >
		<cftry>
			<cfquery name = "loginQuery" result = "countEmail">
	    	SELECT userID,firstName,Email,password,CASE userRole
			WHEN 1 THEN 'admin'
			ELSE 'user'
			END AS role FROM users.user_details
	    	WHERE Email = <cfqueryparam value = "#arguments.loginEmail#" cfsqltype = "cf_sql_varchar" />
	    	AND password = <cfqueryparam value = "#arguments.loginPassword#" cfsqltype = "cf_sql_varchar" />;
			</cfquery>
		<cfcatch>
			<cfdump var = "loginQuerry error" />
		</cfcatch>
		</cftry>
		<cfif #loginQuery.recordCount# >
			<cflogin>
				<cfloginuser name = "#loginQuery.firstName#" password = "#loginQuery.password#" roles = "#loginQuery.role#">
			</cflogin>
			<cfset session.loggedInUser = {'userId' = "#loginQuery.userID#" ,
			'userName' = "#loginQuery.firstName#", 'Email' = "#loginQuery.Email#"  } />
			<cfreturn #loginQuery.role# />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
	<!--- logout function --->
	<cffunction name = "logout" access = "remote" output = "false" returntype = "void" >
		<cfset structdelete(session,'loggedInUser') />
		<cflogout />
	</cffunction>

</cfcomponent>
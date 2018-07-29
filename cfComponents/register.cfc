<cfcomponent  output="false" >

	<cffunction name="registration" access="remote" output="false">
		<cfargument name="fname" required="true" >
		<cfargument name="mname" required="false">
		<cfargument name="lname" required="true" >
		<cfargument name="mail" required="true" >
		<cfargument name="phone" required="true" >
		<cfargument name="password" required="true" >
		<cfargument name="dob" required="true" >
		<cfargument name="gender" required="true" >
		<cfargument name="address" required="true" >
		<cfargument name="city" required="true" >
		<cfargument name="zip" required="true" >
		<cfargument name="country"  required="true" >
		<cfargument name="state" required="true" >
		<cftry>
			<cfquery name="mailCheckQuery" result="countEmail">
		    	SELECT CASE COUNT(userID)
				WHEN 0 THEN 1
				ELSE 0
				END AS role FROM users.user_details;
			</cfquery>
			<cfquery name="insertAddress" result="addressID" >
				INSERT INTO users.address_details VALUES
				(
				<cfqueryparam value="#arguments.address#" cfsqltype = "cf_sql_varchar" />,
				<cfqueryparam value="#arguments.city#" cfsqltype = "cf_sql_varchar" />,
				<cfqueryparam value="#arguments.zip#" cfsqltype = "cf_sql_integer" />,
				<cfqueryparam value="#arguments.country#" cfsqltype = "cf_sql_varchar" />,
				<cfqueryparam value="#arguments.state#" cfsqltype = "cf_sql_varchar" />
				);
			</cfquery>
			<cfquery name="insertRecord" >
			    	INSERT INTO users.user_details VALUES
			    	(
		    		<cfqueryparam value="#arguments.fname#" cfsqltype = "cf_sql_varchar" />,
		    		<cfqueryparam value="#arguments.mname#" cfsqltype = "cf_sql_varchar" null = "#not len(arguments.mname)#" />,
		    		<cfqueryparam value="#arguments.lname#" cfsqltype ="cf_sql_varchar" />,
		    		<cfqueryparam value="#arguments.mail#" cfsqltype ="cf_sql_varchar" />,
		    		<cfqueryparam value="#arguments.phone#" cfsqltype ="cf_sql_biginteger" />,
		    		<cfqueryparam value="#arguments.password#" cfsqltype ="cf_sql_varchar" />,
		    		<cfqueryparam value="#arguments.dob#" cfsqltype = "cf_sql_date" />,
		    		<cfqueryparam value="#arguments.gender#" cfsqltype = "cf_sql_varchar" />,
		    		<cfqueryparam value="#addressID.IDENTITYCOL#" cfsqltype = "cf_sql_integer" />,
		    		<cfqueryparam value="#mailCheckQuery.role#" cfsqltype = "cf_sql_bit" />,
		    		<cfqueryparam value="0" cfsqltype = "cf_sql_bit" />
					);
			</cfquery>
			<cfcatch type="database">
				<cfdump var="database-error" />
			</cfcatch>
		</cftry>
	</cffunction>

</cfcomponent>
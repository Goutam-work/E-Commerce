<cfcomponent  output="true" >


	<cffunction name="registration" access="remote" returntype="boolean" returnformat="json" output="true">
		<cfargument name="fname" required="true" >
		<cfargument name="mname" required="false" default = null>
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

		<cfquery name="mailCheckQuery" result="countEmail" datasource="ECommerce">
	    	SELECT userID FROM users.user_details;
		</cfquery>

		<cfif #mailCheckQuery.recordCount# LT 1 >
			<cfset variables.role = 1 />
		<cfelse>
			<cfset variables.role = 0 />
		</cfif>
			<cfquery name="insertAddress" result="addressID" datasource="ECommerce">
				INSERT INTO users.address_details VALUES
				(<!--- '#arguments.address#','#arguments.city#',#arguments.zip#,'#arguments.country#','#arguments.state#'); --->
				<cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.city#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.zip#" cfsqltype="cf_sql_integer" />,
				<cfqueryparam value="#arguments.country#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.state#" cfsqltype="cf_sql_varchar" />
				);
		</cfquery>
		<cfquery name="insertRecordAdmin" datasource="ECommerce" >
		    	INSERT INTO users.user_details VALUES
		    	(
		    	<!--- '#arguments.fname#','#arguments.mname#','#arguments.lname#','#arguments.mail#',#arguments.phone#,
		    	'#arguments.password#','#arguments.dob#','#arguments.gender#',#addressID.IDENTITYCOL#,1,''); --->
	    		<cfqueryparam value="#arguments.fname#" cfsqltype="cf_sql_varchar" />,
	    		<cfqueryparam value="#arguments.mname#" cfsqltype="cf_sql_varchar" />,
	    		<cfqueryparam value="#arguments.lname#" cfsqltype="cf_sql_varchar" />,
	    		<cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar" />,
	    		<cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_biginteger" />,
	    		<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar" />,
	    		<cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_date" />,
	    		<cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar" />,
	    		<cfqueryparam value="#addressID.IDENTITYCOL#" cfsqltype="cf_sql_integer" />,
	    		<cfqueryparam value="#variables.role#" cfsqltype="cf_sql_bit" />,
	    		<cfqueryparam value="0" cfsqltype="cf_sql_bit" />
				);
		</cfquery>
		<cfreturn true />
	</cffunction>

</cfcomponent>
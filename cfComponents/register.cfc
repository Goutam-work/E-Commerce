
<cfcomponent  output="true" >


	<cffunction name="registration" access="remote" output="true">
		<cfargument name="fname" type="any" required="true" >
		<cfargument name="mname" type="any" required="false" >
		<cfargument name="lname" type="any" required="true" >
		<cfargument name="mail" type="any" required="true" >
		<cfargument name="phone" type="any" required="true" >
		<cfargument name="password" type="any" required="true" >
		<cfargument name="dob" type="any" required="true" >
		<cfargument name="gender" type="any" required="true" >
		<cfargument name="address" type="any" required="true" >
		<cfargument name="city" type="any" required="true" >
		<cfargument name="zip" type="any" required="true" >
		<cfargument name="country" type="any" required="true" >
		<cfargument name="state" type="any" required="true" >

		<cfquery name="mailCheckQuery" result="countEmail" datasource="ECommerce">
	    	select Email from users.user_details where Email='#arguments.mail#';
		</cfquery>
		<cfset variables.result = structNew()>

		<cfif #mailCheckQuery.recordCount# LT 1 >
				<cfquery name="insertAddress" result="addressID" datasource="ECommerce">
				insert into users.address_details values('#arguments.address#','#arguments.city#',#arguments.zip#,'#arguments.country#','#arguments.state#');
				</cfquery>
				<cfquery name="insertRecord" datasource="ECommerce" >
	    	insert into users.user_details values('#arguments.fname#','#arguments.mname#','#arguments.lname#','#arguments.mail#',#arguments.phone#,'#arguments.password#','#arguments.dob#','#arguments.gender#',#addressID.IDENTITYCOL#,'','');
				</cfquery>
				<cfset variables.result.success = true>
		<cfelse>
				<cfset variables.result.success = false>
		</cfif>
		
			<cfreturn serializeJSON(variables.result) />
		
	</cffunction>

</cfcomponent>
<cfcomponent displayname="Application" output="true" hint="Handle the application.">


    <!--- Set up the application. --->
    <cfset THIS.Name = "ECommercej" />
    <cfset THIS.ApplicationTimeout = CreateTimeSpan( 1, 0, 0, 0 ) />
    <cfset THIS.datasource = "ECommerce" />
	<cfset THIS.sessionManagement = "Yes" />
	<cfset This.sessiontimeout = #CreateTimeSpan(1,0,0,0)# />

	 <!--- Set up the product component --->
    <cffunction name = "OnApplicationStart" returntype = "boolean">
		<cfset application.products = createObject(
		"component","cfComponents.product")/>
	 <!--- Set up the HASHing component --->
		<cfset application.hashPassword = createObject(
		"component","cfComponents.hashPassword")/>
        <cfreturn true />
    </cffunction>

</cfcomponent>
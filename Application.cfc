<cfcomponent displayname="Application" output="true" hint="Handle the application.">


    <!--- Set up the application. --->
    <cfset THIS.Name = "E-Commerce" />
    <cfset THIS.ApplicationTimeout = CreateTimeSpan( 1, 0, 0, 0 ) />
    <cfset THIS.datasource = "ECommerce" />
	<cfset THIS.sessionManagement="Yes" />



    <cffunction name="OnApplicationStart" returntype="boolean">
		<cfset application.users = createObject(
		"component",'ECommerce.cfComponents')/>
        <cfreturn true />
    </cffunction>



</cfcomponent>
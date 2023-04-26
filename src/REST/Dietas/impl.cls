Class REST.Dietas.impl Extends (%REST.Impl, Ens.BusinessService) [ ProcedureBlock ]
{

/// PYD:ADDED 
Parameter CONTENTTYPE = "application/json";

Parameter ExposeServerExceptions = 1;

/// Process request SwaggerSpec /_spec
ClassMethod SwaggerSpec() As %Status
{
	Set spec = {}.%FromJSON(##class(%Dictionary.CompiledXData).%OpenId("REST.Dietas.Spec||OpenAPI").Data)
	Set url = $Select(%request.Secure:"https",1:"http") _ "://"_$Get(%request.CgiEnvs("SERVER_NAME")) _ ":" _ $Get(%request.CgiEnvs("SERVER_PORT")) _ %request.Application
	Set spec.servers = [{"url" : (url)}]
	Quit spec
}

/// Service implemntation for get /dietas/{IDPaciente}
ClassMethod leerDieta(messageRequest As REST.Dietas.requests.leerDieta) As %Stream.Object
{
	; Implement your service here.
	//Force  Reply as JSON for Web Browser (which sends xml/html)
	Do ##class(%REST.Impl).%SetContentType("application/json")

	///Aqui una implementación Fija para probar
	/*
	set response=##class(REST.Dietas.model.RMCocinaRecord).%New()
	set response.Habitacion="777"
	set response.NombreCompleto="Paciente de Pruebas"
	do response.%JSONExportToStream(.stream)
	return stream
	*/

	//Una Implementacion que llama a la Producción.
	$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST.Dietas.impl",.tService))
	do tService.ProcessInput(messageRequest,.response,"LeerDieta") 
	$$$TRACE("LeerDieta 1")
	do response.%JSONExportToStream(.stream)
	return stream
}

/// Override this method to process incoming data. Do not call SendRequestSync/Async() from outside this method (e.g. in a SOAP Service or a CSP page).
Method OnProcessInput(pInput As REST.Dietas.requests.leerDieta, Output pOutput As REST.Dietas.model.RMCocinaRecord, ByRef pHint As %String) As %Status
{
	#DIM tSC as %Status=$$$OK
	if (pHint="LeerDieta") {
		//El DietasRouter Accepta mensajes tipo Hospital.Msg.DietaRequest
		//El DietaRouter devuelve mensajes de tipo Hospital.RMCocina.Record
		set tReq=##class(Hospital.Msg.DietaRequest).%New()
		set tReq.IDPaciente=pInput.pathIDPaciente
		#DIM tRsp as Hospital.RMCocina.Record
		set tSC=..SendRequestSync("Hospital.Cocina.BO.LeerDietas",tReq,.tRsp)

		set pOutput=##class(REST.Dietas.model.RMCocinaRecord).%New()
		set pOutput.IDPaciente=tRsp.IDPaciente
		set pOutput.NombreCompleto=tRsp.NombreCompleto
		set pOutput.Habitacion=tRsp.Habitacion
		set pOutput.Dieta=tRsp.Dieta
		set pOutput.FechaEntrada=tRsp.FechaEntrada
		//....
		
		
	}else {
		///Aqui se puede implementar el Post (Añadir nueva Dieta)
	}
	return tSC
}

}

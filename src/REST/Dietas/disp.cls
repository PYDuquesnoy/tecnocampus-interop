Class REST.Dietas.disp Extends %CSP.REST [ ProcedureBlock ]
{

/// Process request SwaggerSpec /_spec
ClassMethod SwaggerSpec() As %Status
{
	Try {
		Do ##class(%REST.Impl).%SetContentType("application/json")
		If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
		Set response=##class(REST.Dietas.impl).SwaggerSpec()
		Do ##class(REST.Dietas.impl).%WriteResponse(response)
	} Catch(ex) {
		 Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("REST.Dietas.disp","ExposeServerExceptions"))
	}
	Quit $$$OK
}

/// Process request get /dietas/{IDPaciente}
ClassMethod leerDieta(IDPaciente As %String) As %Status
{
	Set sc = $$$OK
	Try{
		Do ##class(%REST.Impl).%SetContentType($Get(%request.CgiEnvs("HTTP_ACCEPT")))
		If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
		Set requestMessage = ##class(REST.Dietas.requests.leerDieta).%New()
		Do requestMessage.LoadFromRequest(%request)
		Set scValidateRequest = requestMessage.RequestValidate()
		If $$$ISERR(scValidateRequest) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR(5001,"Invalid requestMessage object.")) Quit
		Set requestMessage.pathIDPaciente = IDPaciente
		Set response = ##class(REST.Dietas.impl).leerDieta(requestMessage)
		Do ##class(REST.Dietas.impl).%WriteResponse(response)
	} Catch(ex) {
		Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("REST.Dietas.impl","ExposeServerExceptions"))
	}
	Quit sc
}

Parameter CHARSET = "utf-8";

Parameter CONVERTINPUTSTREAM = 1;

Parameter IgnoreWrites = 1;

Parameter SpecificationClass = "REST.Dietas.Spec";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <Route Url="/dietas/:IDPaciente" Method="GET" Call="leerDieta" />
  <Route Url="/_spec" Method="get" Call="SwaggerSpec" />
</Routes>
}

}

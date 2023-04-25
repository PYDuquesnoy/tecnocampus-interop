/// Hospital.WS.Dietas
Class Hospital.WS.Dietas Extends EnsLib.SOAP.Service
{

/// Name of the WebService.
Parameter SERVICENAME = "Dietas";

/// TODO: change this to actual SOAP namespace.
/// SOAP Namespace for the WebService
Parameter NAMESPACE = "http://MiCocina.es";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

Method GetMenuForPatient(IDPaciente As %String) As Hospital.RMCocina.Record [ WebMethod ]
{
    set tMessage=##class(Hospital.Msg.DietaRequest).%New()
    set tMessage.IDPaciente=IDPaciente
	do ..ProcessInput(tMessage,.tResponse,"GetMenuForPatient")
	Return tResponse
}

/// Override this method to process incoming data. Do not call SendRequestSync/Async() from outside this method (e.g. in a SOAP Service or a CSP page).
Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
	#DIM tSC as %Status=$$$OK
    #DIM errObj as %Exception.AbstractException
    try {
        $$$ThrowOnError(..SendRequestSync("Hospital.Cocina.BO.LeerDietas",pInput,.pOutput))
    }catch (errObj) {
        set tSC=errObj.AsStatus()
    }
    quit tSC
}

}

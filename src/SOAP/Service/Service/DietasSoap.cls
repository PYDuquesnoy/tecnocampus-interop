Class SOAP.Service.Service.DietasSoap Extends %SOAP.WebService [ ProcedureBlock ]
{

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://MiCocina.es";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "Dietas";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

Method GetMenuForPatient(IDPaciente As %String) As Hospital.RMCocina.Record [ Final, ProcedureBlock = 1, SoapAction = "http://MiCocina.es/Hospital.WS.Dietas.GetMenuForPatient", SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
 set obj=##class(Hospital.RMCocina.Record).%New()
 set obj.Dieta="Dieta liquida"
 return obj
}

}

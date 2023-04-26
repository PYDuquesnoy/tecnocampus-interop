Class REST.Dietas.requests.leerDieta Extends Ens.Request [ ProcedureBlock ]
{

Property %Consume As %String;

Property %ContentType As %String;

Property %URL As %String [ InitialExpression = {..#URL} ];

/// El Identificador de paciente
Property pathIDPaciente As %String;

/// Load object properties from %CSP.Request object.
Method LoadFromRequest(request As %CSP.Request = {%request}) As %Status
{
	Set sc = $$$OK
	Set ..%ContentType = $Piece(request.ContentType, ";", 1)
	;pathIDPaciente must be set out of this method
	Quit sc
}

/// Load object properties from %CSP.Request object.
Method RequestValidate() As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(..%ValidateObject())
	Quit sc
}

Parameter METHOD = "get";

Parameter URL = "/dietas/{IDPaciente}";

Storage Default
{
<Data name="leerDietaDefaultData">
<Subscript>"leerDieta"</Subscript>
<Value name="1">
<Value>%Consume</Value>
</Value>
<Value name="2">
<Value>%ContentType</Value>
</Value>
<Value name="3">
<Value>%URL</Value>
</Value>
<Value name="4">
<Value>pathIDPaciente</Value>
</Value>
</Data>
<DefaultData>leerDietaDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

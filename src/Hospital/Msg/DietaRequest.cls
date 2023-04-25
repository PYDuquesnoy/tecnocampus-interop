Class Hospital.Msg.DietaRequest Extends Ens.Request
{

Property IDPaciente As %String;

Storage Default
{
<Data name="DietaRequestDefaultData">
<Subscript>"DietaRequest"</Subscript>
<Value name="1">
<Value>IDPaciente</Value>
</Value>
</Data>
<DefaultData>DietaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

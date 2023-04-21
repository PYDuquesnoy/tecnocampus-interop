/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'Hospital.RMDietas'
/// on 2023-04-20 at 15:02:54.544 [2023-04-20 14:02:54.544 UTC]
/// by user _SYSTEM
Class Hospital.RMDietas.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property IDPaciente As %Integer;

Property Nombre As %String;

Property Apellido1 As %String;

Property Apellido2 As %String;

Property Habitacion As %Integer;

Property FechaEntrada As %String;

Property Dieta As %String;

Property Acompañante As %String;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>IDPaciente</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Apellido1</Value>
</Value>
<Value name="5">
<Value>Apellido2</Value>
</Value>
<Value name="6">
<Value>Habitacion</Value>
</Value>
<Value name="7">
<Value>FechaEntrada</Value>
</Value>
<Value name="8">
<Value>Dieta</Value>
</Value>
<Value name="9">
<Value>Acompañante</Value>
</Value>
<Value name="10">
<Value>Nombre</Value>
</Value>
</Data>
<DataLocation>^Hospital.RMDietas.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Hospital.RMDietas.RecordD</IdLocation>
<IndexLocation>^Hospital.RMDietas.RecordI</IndexLocation>
<StreamLocation>^Hospital.RMDietas.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

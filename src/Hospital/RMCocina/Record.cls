/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'Hospital.RMCocina'
/// on 2023-04-25 at 13:22:14.998 [2023-04-25 12:22:14.998 UTC]
/// by user _SYSTEM
Class Hospital.RMCocina.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property IDPaciente As %Integer;

Property NombreCompleto As %String(MAXLEN = 100);

Property Habitacion As %Integer;

Property FechaEntrada As %String;

Property Dieta As %String;

Property Acompañante As %Boolean;

Property DietaAcompañante As %String;

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
<Value>Habitacion</Value>
</Value>
<Value name="5">
<Value>FechaEntrada</Value>
</Value>
<Value name="6">
<Value>Dieta</Value>
</Value>
<Value name="7">
<Value>Acompañante</Value>
</Value>
<Value name="8">
<Value>DietaAcompañante</Value>
</Value>
<Value name="9">
<Value>NombreCompleto</Value>
</Value>
</Data>
<DataLocation>^Hospital.RMCocina.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Hospital.RMCocina.RecordD</IdLocation>
<IndexLocation>^Hospital.RMCocina.RecordI</IndexLocation>
<StreamLocation>^Hospital.RMCocina.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

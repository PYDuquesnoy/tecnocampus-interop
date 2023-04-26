Class REST.Dietas.model.RMCocinaRecord Extends (%RegisteredObject, %JSON.Adaptor) [ ProcedureBlock ]
{

Property Acompanante As %Boolean;

Property Dieta As %String [ Required ];

Property DietaAcompanante As %String;

Property FechaEntrada As %String;

Property Habitacion As %String [ Required ];

Property IDPaciente As %Integer [ Required ];

Property NombreCompleto As %String [ Required ];

}

/// ANNOTATION: El Formato para la aplicacion de Cocina
Class Hospital.RMCocina Extends EnsLib.RecordMap.RecordMap
{

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="Hospital.RMCocina" type="delimited" char_encoding="UTF-8" targetClassname="Hospital.RMCocina.Record" complexBatchManaged="0" padFromLeft="0" recordTerminator="\x0a" allowEmbeddedRecordTerminator="0" allowEarlyTerminator="0">
  <Separators>
    <Separator>,</Separator>
  </Separators>
  <annotation>El Formato para la aplicacion de Cocina</annotation>
  <Field name="IDPaciente" required="0" ignored="0" datatype="%Integer" repeating="0">
  </Field>
  <Field name="NombreCompleto" required="0" ignored="0" datatype="%String" params="MAXLEN=100" repeating="0">
  </Field>
  <Field name="Habitacion" required="0" ignored="0" datatype="%Integer" repeating="0">
  </Field>
  <Field name="FechaEntrada" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="Dieta" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="Acompañante" required="0" ignored="0" datatype="%Boolean" repeating="0">
  </Field>
  <Field name="DietaAcompañante" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
</Record>
}

}

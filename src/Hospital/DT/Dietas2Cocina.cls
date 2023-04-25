Class Hospital.DT.Dietas2Cocina Extends Ens.DataTransformDTL [ DependsOn = (Hospital.RMDietas.Record, Hospital.RMCocina.Record) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Hospital.RMDietas.Record' targetClass='Hospital.RMCocina.Record' create='new' language='objectscript' >
<assign value='source.IDPaciente' property='target.IDPaciente' action='set' />
<assign value='source.Nombre_" "_source.Apellido1_" "_source.Apellido2' property='target.NombreCompleto' action='set' />
<assign value='source.Habitacion' property='target.Habitacion' action='set' />
<assign value='..ConvertDateTime(source.FechaEntrada,"%d/%m/%Y","%Y-%m-%d")' property='target.FechaEntrada' action='set' />
<assign value='source.Dieta' property='target.Dieta' action='set' />
<if condition='$length(source.Acompañante)&gt;0' >
<annotation>Not Equal --&gt;  &#39;=  </annotation>
<true>
<assign value='1' property='target.Acompañante' action='set' />
<assign value='source.Acompañante' property='target.DietaAcompañante' action='set' />
</true>
<false>
<assign value='0' property='target.Acompañante' action='set' />
</false>
</if>
</transform>
}

}

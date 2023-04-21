Class Hospital.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Hospital.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description>La Produccion para todas las integraciones</Description>
  <ActorPoolSize>0</ActorPoolSize>
  <Item Name="Hospital.Dietas.BO.FileOutput" Category="Dietas" ClassName="EnsLib.RecordMap.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="Prueba de generacoion de Fichero con el RecordMap Definido" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Filename">%f</Setting>
    <Setting Target="Host" Name="RecordMap">Hospital.RMDietas</Setting>
    <Setting Target="Adapter" Name="FilePath">/interfaces/cocina/out/</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="Hospital.Dietas.BS.FileInput" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="Lee las dietas de los pacientes ingresados desde un CSV" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="RecordMap">Hospital.RMDietas</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Hospital.Dietas.BO.FileOutput</Setting>
    <Setting Target="Adapter" Name="FilePath">/interfaces/emrdietas/</Setting>
    <Setting Target="Host" Name="HeaderCount">1</Setting>
  </Item>
</Production>
}

}

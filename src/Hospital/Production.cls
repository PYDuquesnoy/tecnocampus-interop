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
    <Setting Target="Host" Name="TargetConfigNames">DietasRouter</Setting>
    <Setting Target="Adapter" Name="FilePath">/interfaces/emrdietas/</Setting>
    <Setting Target="Host" Name="HeaderCount">1</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
  </Item>
  <Item Name="DietasRouter" Category="Dietas" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="Enrutador de peticion de dietas" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">Hospital.Rul.DietasRouter</Setting>
  </Item>
  <Item Name="Hospital.Cocina.BO.FileOutput" Category="Dietas" ClassName="EnsLib.RecordMap.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">Cocina_%f</Setting>
    <Setting Target="Host" Name="RecordMap">Hospital.RMCocina</Setting>
    <Setting Target="Adapter" Name="FilePath">/interfaces/cocina/out/</Setting>
  </Item>
  <Item Name="Hospital.Cocina.BO.SqlInsert" Category="" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="Graba Datos en Aplicación de Cocina" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">MYSQL</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://localhost:3306/COCINA</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.cj.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">EnsLib.JavaGateway.Service</Setting>
    <Setting Target="Host" Name="InputParameters">*IDPaciente,*NombreCompleto,*Habitacion,*FechaEntrada,*Dieta,*Acompañante,*DietaAcompañante</Setting>
    <Setting Target="Host" Name="Query">insert into COCINA.dieta(idpaciente, nombrecompleto, habitacion, FechaEntrada, Dieta, Acompañante, DietaAcompañante) values (?,?,?,?,?,?,?)</Setting>
    <Setting Target="Host" Name="RequestClass">Hospital.RMCocina.Record</Setting>
    <Setting Target="Adapter" Name="JDBCClasspath">/opt/mysql/mysql-connector-j-8.0.33/mysql-connector-j-8.0.33.jar</Setting>
  </Item>
  <Item Name="EnsLib.JavaGateway.Service" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Hospital.Cocina.BO.LeerDietas" Category="Dietas" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">MYSQL</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://localhost:3306/COCINA</Setting>
    <Setting Target="Adapter" Name="JGService">EnsLib.JavaGateway.Service</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.cj.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JDBCClasspath">/opt/mysql/mysql-connector-j-8.0.33/mysql-connector-j-8.0.33.jar</Setting>
    <Setting Target="Host" Name="Query">select idpaciente, nombrecompleto, habitacion, FechaEntrada, Dieta, Acompañante, DietaAcompañante from COCINA.dieta where idpaciente=+?</Setting>
    <Setting Target="Host" Name="InputParameters">*IDPaciente</Setting>
    <Setting Target="Host" Name="RequestClass">Hospital.Msg.DietaRequest</Setting>
    <Setting Target="Host" Name="ResponseClass">Hospital.RMCocina.Record</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="Hospital.WS.Dietas" Category="" ClassName="Hospital.WS.Dietas" PoolSize="1" Enabled="true" Foreground="false" Comment="Web Service (SOAP) para Dietas" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="EnableStandardRequests">1</Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
</Production>
}

}

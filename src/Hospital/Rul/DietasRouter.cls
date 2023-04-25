/// 
Class Hospital.Rul.DietasRouter Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="Hospital.Production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Enviar a Cocina">
<when condition="1" comment="">
<send transform="Hospital.DT.Dietas2Cocina" target="Hospital.Cocina.BO.FileOutput,Hospital.Cocina.BO.SqlInsert"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}

Class AI.Agent.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="AI.Agent.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="AI.Agent.BS.DemoBS" Category="" ClassName="AI.Agent.BS.DemoBS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">AI.Agent.BP.Analysis</Setting>
  </Item>
  <Item Name="AI.Agent.BO.OpenAI" Category="" ClassName="AI.Agent.BO.OpenAI" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="APIKey"></Setting>
    <Setting Target="Host" Name="Model">deepseek-reasoner</Setting>
    <Setting Target="Host" Name="URL">https://api.deepseek.com/v1</Setting>
  </Item>
  <Item Name="AI.Agent.BO.ExecuteSQL" Category="" ClassName="AI.Agent.BO.ExecuteSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AI.Agent.BP.Analysis" Category="" ClassName="AI.Agent.BP.Analysis" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AI.Agent.BO.Embedding" Category="" ClassName="AI.Agent.BO.Embedding" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}

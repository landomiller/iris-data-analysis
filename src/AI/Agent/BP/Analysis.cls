/// 
Class AI.Agent.BP.Analysis Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='sql' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='2500' />
</parameters>
</property>
</context>
<sequence xend='200' yend='650' >
<call name='Embedding' target='AI.Agent.BO.Embedding' async='1' xpos='200' ypos='250' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<call name='SendAI' target='AI.Agent.BO.OpenAI' async='0' xpos='200' ypos='350' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Ens.Response' >
<assign property="context.sql" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<code name='CODE' xpos='200' ypos='450' >
<![CDATA[ $$$LOGINFO("sql"_context.sql)
 Set reqsql = ##class(AI.Agent.MSG.Request).%New()
 Set ressql = ##class(AI.Agent.MSG.Response).%New()
 Set ressql = context.sql
 
 set sql = ressql.MessagesMap.GetAt(1)
 
 $$$LOGINFO("sql"_sql)

 d reqsql.MessagesMap.Insert(sql)
 
 Set context.sql =reqsql
 $$$LOGINFO("sql"_context.sql)]]>
</code>
<call name='SQL ' target='AI.Agent.BO.ExecuteSQL' async='0' xpos='200' ypos='550' >
<request type='Ens.Request' >
<assign property="callrequest" value="context.sql" action="set" languageOverride="" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</sequence>
</process>
}

}

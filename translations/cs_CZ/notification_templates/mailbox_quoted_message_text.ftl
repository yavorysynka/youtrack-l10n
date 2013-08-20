<#ftl attributes={"description":"Represents text consisted of lines as quoted"}>
<#escape x as x?html>
    <br/>
    <#list inReplyToMessageText as line>
        >${line}<br/>
    </#list>
</#escape>
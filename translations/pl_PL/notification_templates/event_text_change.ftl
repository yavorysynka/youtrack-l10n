<#ftl attributes={"description":"Text update (e.g. change in issue summary or description) "}>
<#escape x as x?html>
    <#assign title = event.name>
    <#assign oldText = event.oldValue>
    <#assign newText = event.newValue>
    <#import "styles.ftl" as styles>

<tr>
    <td style="${styles.event_title}">${title}</td>
    <td style="${styles.event_value}">
        <#if oldText?has_content>
            <@diff oldText=oldText
                   newText=newText
                   insStyle="${styles.new_value} word-wrap: break-word;"
                   delStyle="${styles.old_value} word-wrap: break-word;"/>
        <#else>
            <@wiki><#noescape>${newText}</#noescape></@wiki>
        </#if>
    </td>
</tr>
</#escape>
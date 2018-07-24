<#ftl attributes={"description":"Presentation of added time tracking work item"}>
<#escape x as x?html>
    <#assign workItem = event.getWorkItem()>
    <#import "styles.ftl" as styles>

    <tr style="${styles.event_change}">
        <td style="${styles.event_title}">
            <@l10n>Work item</@l10n>
        </td>
        <td style="${styles.event_value}">
            <#if workItem.type?has_content>(${workItem.type})</#if>
            ${workItem.date}<#if workItem.description?has_content>. ${workItem.description}</#if> &mdash; <span style="${styles.new_value}">${workItem.duration}</span>
        </td>
    </tr>
</#escape>
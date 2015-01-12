<#ftl attributes={"description":"Presentaion of issue resolution event"}>
<#escape x as x?html>
    <#import "styles.ftl" as styles>
    <tr style="${styles.event_change}">

        <td style="${styles.event_title}">
            <@l10n>Resolved</@l10n>
        </td>
        <td style="${styles.event_value}">
            <#assign duplicate = Utils.getDuplicate(issue)>
            <#if duplicate?has_content>
                <@l10n>Issue was resolved as duplicate of <a href="${Utils.getUrl(duplicate)}">${duplicate.getId()}</a>.</@l10n>
            <#else>
                <#assign state = issue.state>
                <#if state?has_content && !(state?is_enumerable)>
                    <@l10n>Issue was resolved as: ${state}.</@l10n>
                <#else>
                    <@l10n>Issue was resolved.</@l10n>
                </#if>
            </#if>
        </td>

    </tr>
</#escape>
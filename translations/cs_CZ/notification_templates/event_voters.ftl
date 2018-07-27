<#ftl attributes={"description":"Update of issue votes "}>
<#escape x as x?html>
    <#import "styles.ftl" as styles>

    <tr style="${styles.event_change}">
        <td style="${styles.event_title}"><@l10n>Votes</@l10n></td>
        <td style="${styles.event_value}">
            <#list event.getRemovedValues() as unvoter>
                <#if unvoter == to>
                    <span style="${styles.new_value}">-1</span> (<@l10n>you</@l10n>).
                <#else>
                    <span style="${styles.new_value}">-1</span> (${unvoter.getVisibleName()}).
                </#if>
            </#list>
            <#list event.getAddedValues() as voter>
                <#if voter == to>
                    <span style="${styles.new_value}">+1</span> (<@l10n>you</@l10n>).
                <#else>
                    <span style="${styles.new_value}">+1</span> (${voter.getVisibleName()}).
                </#if>
            </#list>
            <@l10n>Total votes: ${issue.votes}</@l10n>
        </td>
    </tr>
</#escape>
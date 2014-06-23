<#ftl attributes={"description":"Issue id and summary with \"Star\" tag and reporter information"}>
<#escape x as x?html>
    <#import "styles.ftl" as styles>
    <table style="${styles.table} ${styles.event_change}">
        <tr>
            <td style="${styles.td} width: 26px;">
                <#include "issue_star.ftl">
            </td>
            <td style="${styles.td}">
                <#include "issue_id_summary.ftl">
            </td>
            <td style="padding-left: 5px; font-size: 11px; font-family:sans-serif; text-align: right; color: #888888">
                <#if issue.reporter==to>
                    <@l10n>Created by you</@l10n>
                <#else>
                    <@l10n>Created by ${issue.reporter.getVisibleName()}</@l10n>
                </#if>
            </td>
        </tr>
    </table>
</#escape>
<#ftl attributes={"description":"Component switching between full and short issue header"}>
<table style="border-collapse: collapse; width: 100%; table-layout: fixed;">
    <tr>
        <td style="padding:12px 15px; background:#f0f0f0">
            <#if init_notification>
                <#include "issue_full_header.ftl">
            <#else>
                <#include "issue_short_header.ftl">
            </#if>
        </td>
    </tr>
</table>

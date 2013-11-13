<#escape x as x?html>
    <p style="font-size: 14px;
              color: #000000;
              margin: 0.5em 0 0.4em 0;">
        <#assign priority = issue.Priority>
        <#if (!priority?is_enumerable && (priority == "Critical" || priority == "Show-stopper"))>
            <#assign issueTypeStyle = "color: #cc0000">
        <#else>
            <#assign issueTypeStyle = "">
        </#if>
        <#assign type = issue.Type>
        <#if type?has_content>
            <@l10n>New <em style="${issueTypeStyle}">${type}</em> in project <em>${issue.project.name}</em></@l10n>
        <#else>
            <@l10n>New <em style="${issueTypeStyle}">issue</em> in project <em>${issue.project.name}</em></@l10n>
        </#if>
    </p>
    <div style="background-color: #efefef">
        <#include "issue_full_header.ftl">
    </div>
    <#include "issue.ftl">
    <#include "footer.ftl">
</#escape>
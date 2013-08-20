<#escape x as x?html>
    <p style="font-size: 14px;
              color: #000000;
              margin: 0.5em 0 0.4em 0;">
        <#if only_via_duplicate><@l10n>Duplicate of issue(s) you are watching has been changed.</@l10n></#if>
        <#assign priority = issue.Priority>
        <#if (!priority?is_enumerable && (priority == "Critical" || priority == "Show-stopper"))>
            <#assign issueTypeStyle = "color: #cc0000">
        <#else>
            <#assign issueTypeStyle = "">
        </#if>
        <#assign type = issue.Type>
        <#if from == to>
            <#if type?has_content>
                <@l10n>
                    <em style="${issueTypeStyle}">${type}</em> was assigned
                    to yourself in project <em>${issue.project.name}</em>
                </@l10n>
            <#else>
                <@l10n>
                    <em style="${issueTypeStyle}">Issue</em> was assigned
                    to yourself in project <em>${issue.project.name}</em>
                </@l10n>
            </#if>
        <#else>
            <#if type?has_content>
                <@l10n>
                    <em style="${issueTypeStyle}">${type}</em> was assigned to <em>you</em>
                    by ${from.getVisibleName()} in project <em>${issue.project.name}</em>
                </@l10n>
            <#else>
                <@l10n>
                    <em style="${issueTypeStyle}">Issue</em> was assigned to <em>you</em>
                    by ${from.getVisibleName()} in project <em>${issue.project.name}</em>
                </@l10n>
            </#if>
        </#if>
    </p>
    <div style="background-color: #efefef">
        <#include "issue_header.ftl">
    </div>
    <#if change.before?has_content>
        <#include "issue_change.ftl">
    <#else>
        <#include "issue.ftl">
    </#if>
    <#include "footer.ftl">
</#escape>
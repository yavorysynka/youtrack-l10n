<#escape x as x?html>
    <#assign after = change.after>
    <#assign before = change.before>
    <p style="font-size: 14px;
              color: #000000;
              margin: 0.5em 0 0.4em 0;">
        <#if only_via_duplicate><@l10n>Duplicate of issue(s) you are watching has been changed.</@l10n></#if>
        <#assign priority = change.after.Priority>
        <#if (!priority?is_enumerable && (priority == "Critical" || priority == "Show-stopper"))>
            <#assign issueTypeStyle = "color: #cc0000">
        <#else>
            <#assign issueTypeStyle = "">
        </#if>
        <#assign type = after.Type>
        <#if from==to>
            <#if type?has_content>
                <@l10n>
                    <em style="${issueTypeStyle}">${type}</em> was updated by <em>you</em>
                    in project <em>${after.project.name}</em> at ${change.getWhen(to)}.
                </@l10n>
            <#else>
                <@l10n>
                    <em style="${issueTypeStyle}">Issue</em> was updated by <em>you</em>
                    in project <em>${after.project.name}</em> at ${change.getWhen(to)}.
                </@l10n>
            </#if>
        <#else>
            <#if type?has_content>
                <@l10n>
                    <em style="${issueTypeStyle}">${type}</em> was updated by <em>${from.getVisibleName()}</em>
                    in project <em>${after.project.name}</em> at ${change.getWhen(to)}.
                </@l10n>
            <#else>
                <@l10n>
                    <em style="${issueTypeStyle}">Issue</em> was updated by <em>${from.getVisibleName()}</em>
                    in project <em>${after.project.name}</em> at ${change.getWhen(to)}.
                </@l10n>
            </#if>
        </#if>
        <#if after.isResolved() && before?has_content && !before.isResolved()>
            <#assign duplicate = Utils.getDuplicate(after)>
            <#if duplicate?has_content>
                <@l10n>Issue was resolved as duplicate of <a href="${Utils.getUrl(duplicate)}">${duplicate.getId()}</a>.</@l10n>
           <#else>
                <#assign state = after.State>
                <#if state?has_content && !(state?is_enumerable)>
                    <@l10n>Issue was resolved as: ${state}.</@l10n>
                <#else>
                    <@l10n>Issue was resolved.</@l10n>
                </#if>
            </#if>
        </#if>
    </p>
    <div style="background-color: #efefef">
        <#include "issue_header.ftl">
    </div>
    <#include "issue_change.ftl">
    <#include "footer.ftl">
</#escape>
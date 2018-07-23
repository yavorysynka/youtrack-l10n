<p>
    <#if from == to>
        <@l10n>You changed duplicates cluster:</@l10n>
    <#else>
        <@l10n>User ${from.getVisibleName()} changed duplicates cluster:</@l10n>
    </#if>
</p>
<#assign rootId = issue.id>
<p>${rootId} ${issue.summary}</p>
<p>${Utils.getUrl(issue)}</p>
<#list changes as change>
    <p>--------------------</p>
    <#assign id = change.issue.id>
    <#if id == rootId>
        <p><@l10n>${id} (cluster root issue):</@l10n></p>
    <#else>
        <p><@l10n>${id} (duplicates ${rootId}):</@l10n></p>
    </#if>

    <#list change.events as event>
        <#assign category = event.category>
        <#if category == "VOTERS">
            <#if event.getRemovedValues()?has_content>
                <#assign delta = "-1">
            <#else>
                <#assign delta = "+1">
            </#if>
            <p><@l10n>votes: ${delta} (${from.getVisibleName()}), total: ${change.issue.votes}</@l10n></p>
        <#elseif category == "COMMENT">
            <p>${event.getPresentation()}</p>
            <p>${Utils.getCommentUrl(event.comment)}</p>
        <#else>
            <p>${event.getPresentation()}</p>
        </#if>
    </#list>
</#list>
<p>--------------------</p>
<#include "reason_jabber.ftl">

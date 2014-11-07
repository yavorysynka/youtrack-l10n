<#include "digest_overview_jabber.ftl">
<p>${issue.getId()} ${issue.summary}</p>
<p>${Utils.getUrl(issue)}</p>
<p>--------------------</p>
<#--list of events-->
<#list change.events as event>
    <#assign category = event.category>
    <#if category == "VOTERS">
        <#if event.getRemovedValues()?has_content>
            <#assign delta = "-1">
        <#else>
            <#assign delta = "+1">
        </#if>
        <p><@l10n>votes: ${delta} (${from.getVisibleName()}), total: ${issue.votes}</@l10n></p>
    <#elseif category == "COMMENT">
        <p>${event.getPresentation()}</p>
        <p>${Utils.getCommentUrl(event.comment)}</p>
    <#else>
        <p>${event.getPresentation()}</p>
    </#if>
</#list>
<p>--------------------</p>
<#include "reason_jabber.ftl">

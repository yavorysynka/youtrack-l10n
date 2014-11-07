<#if only_via_duplicate><p><@l10n>Duplicate of issue(s) you are watching has been changed</@l10n></p></#if>
<#if from == to>
    <#if unvote>
        <p><@l10n>Votes changed: -1 by you in</@l10n></p>
    <#else>
        <p><@l10n>Votes changed: +1 by you in</@l10n></p>
    </#if>
<#else>
    <#if unvote>
        <p><@l10n>Votes changed: -1 by ${from.getVisibleName()} in</@l10n></p>
    <#else>
        <p><@l10n>Votes changed: +1 by ${from.getVisibleName()} in</@l10n></p>
    </#if>
</#if>
<p>${issue.getId()} ${issue.summary}</p>
<p>${Utils.getUrl(issue)}</p>
<p>--------------------</p>
<p><@l10n>Total votes: ${votes}</@l10n></p>
<p>--------------------</p>
<p>${reason}</p>

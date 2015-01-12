<#if only_via_duplicate><p><@l10n>Duplicate of issue(s) you are watching has been changed</@l10n></p></#if>
<#assign priority = issue.Priority>
<#assign isShowStopper = (!priority?is_enumerable && priority == "Show-stopper")>
<#if from == to>
    <#if isShowStopper>
        <p><@l10n>Show-stopper was assigned to yourself:</@l10n></p>
    <#else>
        <p><@l10n>Issue was assigned to yourself:</@l10n></p>
    </#if>
<#else>
    <#if isShowStopper>
        <p><@l10n>Show-stopper was assigned to <em>you</em> by ${from.getVisibleName()}:</@l10n></p>
    <#else>
        <p><@l10n>Issue was assigned to <em>you</em> by ${from.getVisibleName()}:</@l10n></p>
    </#if>
</#if>
<p>${issue.getId()} ${issue.summary}</p>
<p>${Utils.getUrl(issue)}</p>
<p>--------------------</p>
<p>${reason}</p>
<#assign priority = issue.Priority>
<#if (!priority?is_enumerable && priority == "Show-stopper")>
    <p><@l10n>Show-stopper noticed by project team member ${from.getVisibleName()}:</@l10n></p>
<#else>
    <p><@l10n>Issue noticed by project team member ${from.getVisibleName()}:</@l10n></p>
</#if>
<p>${issue.getId()} ${issue.summary}</p>
<p>${Utils.getUrl(issue)}</p>
<p>--------------------</p>
<p>${reason}</p>
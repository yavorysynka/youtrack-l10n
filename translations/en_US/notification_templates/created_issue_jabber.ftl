<#assign reporterName = issue.updatedBy.getVisibleName()>
<#assign priority = issue.Priority>
<#if (!priority?is_enumerable && priority == "Show-stopper")>
    <p><@l10n>New show-stopper was reported by ${reporterName}:</@l10n></p>
<#else>
    <p><@l10n>New issue was reported by ${reporterName}:</@l10n></p>
</#if>
<p>${issue.getId()} ${issue.summary}</p>
<p>${Utils.getUrl(issue)}</p>
<p>--------------------</p>
<p>${reason}</p>

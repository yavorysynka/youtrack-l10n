<#if only_via_duplicate><p><@l10n>Duplicate of issue(s) you are watching has been changed</@l10n></p></#if>
<#if from == to>
    <#if untag>
        <p><@l10n>You removed tag ${tag.name} from</@l10n></p>
    <#else>
        <p><@l10n>You added tag ${tag.name} to</@l10n></p>
    </#if>
<#else>
    <#if untag>
        <p><@l10n>User ${from.getVisibleName()} removed tag ${tag.name} from</@l10n></p>
    <#else>
        <p><@l10n>User ${from.getVisibleName()} added tag ${tag.name} to</@l10n></p>
    </#if>
</#if>
<p>${issue.getId()} ${issue.summary}</p>
<p>${Utils.getUrl(issue)}</p>
<p>--------------------</p>
<p>${reason}</p>
<#if only_via_duplicate><p><@l10n>Duplicate of issue(s) you are watching has been changed</@l10n></p></#if>
<#if from == to>
    <#if comment_updated>
        <p><@l10n>Comment was edited by <em>you</em> in</@l10n></p>
    <#else>
        <p><@l10n>New comment was added by <em>you</em> to</@l10n></p>
    </#if>
<#else>
    <#if comment_updated>
        <p><@l10n>Comment was edited by <em>${from.getVisibleName()}</em> in</@l10n></p>
    <#else>
        <p><@l10n>New comment was added by <em>${from.getVisibleName()}</em> to</@l10n></p>
    </#if>
</#if>
<p>${issue.getId()} ${issue.summary}</p>
<p>${Utils.getUrl(issue)}</p>
<p>--------------------</p>
<p><@wiki>${comment.text}</@wiki></p>
<p>${Utils.getCommentUrl(comment)}</p>
<p>--------------------</p>
<p>${reason}</p>

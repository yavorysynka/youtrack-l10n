<#if only_via_duplicate><p><@l10n>Duplicate of issue(s) you are watching has been changed</@l10n></p></#if>
<#assign after = change.after>
<#assign before = change.before>
<#assign priority = after.Priority>
<#assign isShowStopper = (!priority?is_enumerable && priority == "Show-stopper")>
<#if from == to>
    <#if isShowStopper>
        <p><@l10n>You changed show-stopper:</@l10n></p>
    <#else>
        <p><@l10n>You changed issue:</@l10n></p>
    </#if>
<#else>
    <#if isShowStopper>
        <p><@l10n>User ${from.getVisibleName()} changed show-stopper:</@l10n></p>
    <#else>
        <p><@l10n>User ${from.getVisibleName()} changed issue:</@l10n></p>
    </#if>
</#if>
<p>${after.getId()} ${after.summary}</p>
<p>${Utils.getUrl(after)}</p>
<#if after.isResolved() && before?has_content && !before.isResolved()>
    <#assign duplicate = Utils.getDuplicate(after)>
    <#if duplicate?has_content>
        <p><@l10n>Issue was resolved as duplicate of ${duplicate.getId()}</@l10n></p>
        <p>${duplicate.getUrl()}</p>
    <#else>
        <#assign state = after.State>
        <#if state?has_content && !(state?is_enumerable)>
            <p><@l10n>Issue was resolved as: ${state}</@l10n></p>
        <#else>
            <p><@l10n>Issue was resolved</@l10n></p>
        </#if>
    </#if>
</#if>
<p>--------------------</p>

<#--project change-->
<#if before.project != after.project>
    <p><@l10n>Project: ${before.project.name} -> ${after.project.name}</@l10n></p>
</#if>

<#--permitted group change-->
<#if before.permittedGroup != after.permittedGroup>
    <p><@l10n>Visible to Group: ${Utils.getGroupVisibleName(before.permittedGroup)} -> ${Utils.getGroupVisibleName(after.permittedGroup)}</@l10n></p>
</#if>

<#--summary change-->
<#if before.summary != after.summary>
    <p><@l10n>Summary changed</@l10n></p>
</#if>

<#--description change-->
<#if before.description != after.description>
    <p><@l10n>Description changed</@l10n></p>
</#if>

<#--attachments change-->
<#list change.getRemovedAttachments() as removed>
    <p><@l10n>-Attachment <a href="${Utils.getAttachmentUrl(removed)}">${removed.name}</a></@l10n></p>
</#list>
<#list change.getAddedAttachments() as added>
    <p><@l10n>+Attachment <a href="${Utils.getAttachmentUrl(added)}">${added.name}</a></@l10n></p>
</#list>

<#--links change-->
<#list change.getRemovedLinks() as removedLink>
    <#assign oppositeIssue = removedLink.to>
    <#assign linkName = removedLink.capitalizedRole>
    <p>-${linkName} <a href="${Utils.getUrl(oppositeIssue)}">${oppositeIssue.getId()}: ${oppositeIssue.summary}</a></p>
</#list>
<#list change.getAddedLinks() as addedLink>
    <#assign oppositeIssue = addedLink.to>
    <#assign linkName = addedLink.capitalizedRole>
    <p>+${linkName} <a href="${Utils.getUrl(oppositeIssue)}">${oppositeIssue.getId()}: ${oppositeIssue.summary}</a></p>
</#list>

<#--custom fields change-->
<#list change.getCustomFieldChanges() as fieldChange>
    <#assign fieldName = fieldChange.field.prototype.getNamePresentation()>
    <p>${fieldName}: ${fieldChange.prevPresentation} -> ${fieldChange.nextPresentation}</p>
</#list>

<p>--------------------</p>
<p>${reason}</p>

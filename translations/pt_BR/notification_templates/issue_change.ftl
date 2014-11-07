<#ftl attributes={"description":"List of last changes applied to an issue"}>
<#escape x as x?html>
    <table style="border: 0;
                  border-collapse: collapse;
                  border-spacing: 0;
                  margin: 0 0 1em;
                  padding-left: 44px;;
                  margin-top: 1em;
                  color: #000000;
                  font-size: 14px;">

        <#assign title_style = "float:left; margin-right:5px; color:#888888; padding-right: 10px;">
        <#assign value_style = "">
        <#assign changeLineThrough_style= "text-decoration: line-through;">
        <#--project change-->
        <#if change.before.project != change.after.project>
            <tr>
                <td style="${title_style}"><@l10n>Project</@l10n></td>
                <td style="${value_style}">
                    <span style="${changeLineThrough_style}">
                        ${change.before.project.name}, ${change.before.getId()}
                    </span>
                        ${change.after.project.name}, ${change.after.getId()}
                </td>
            </tr>
        </#if>
        <#--permitted group change-->
        <#if change.before.permittedGroup != change.after.permittedGroup>
            <tr>
                <td style="${title_style}"><@l10n>Visible to Group</@l10n></td>
                <td style="${value_style}">
                    <span style="${changeLineThrough_style}">
                        ${Utils.getGroupVisibleName(change.before.permittedGroup)}
                    </span>
                        ${Utils.getGroupVisibleName(change.after.permittedGroup)}
                </td>
            </tr>
        </#if>
        <#--summary change-->
        <#if change.before.summary != change.after.summary>
            <tr>
                <td style="${title_style}"><@l10n>Summary</@l10n></td>
                <td colspan="2"  style="${value_style}">
                    <@diff oldText=change.before.summary
                           newText=change.after.summary
                           insStyle="background: #E6FFE6;"
                           delStyle="background: #FFE6E6;"/>
                </td>
            </tr>
        </#if>
        <#--description change-->
        <#if change.before.description != change.after.description>
            <tr>
                <td style="${title_style}"><@l10n>Description</@l10n></td>
                <td colspan="2"  style="${value_style}">
                    <#function nullSafe description>
                        <#if description?has_content>
                            <#return description>
                        <#else>
                            <#return "">
                        </#if>
                    </#function>
                    <@diff oldText=nullSafe(change.before.description)
                           newText=nullSafe(change.after.description)
                           insStyle="background: #E6FFE6;"
                           delStyle="background: #FFE6E6;"/>
                </td>
            </tr>
        </#if>
        <#--attachments change-->
        <#list change.getRemovedAttachments() as removedAttachment>
            <tr>
                <td style="${title_style}"><@l10n>Attachment</@l10n></td>
                <td style="${value_style}">
                    <span style="${changeLineThrough_style}">
                        <a href="${Utils.getAttachmentUrl(removedAttachment)}"
                           title="<@l10n>Removed by ${removedAttachment.author.fullName},
                                  visible for ${Utils.getGroupVisibleName(removedAttachment.permittedGroup)}</@l10n>"
                           style="color: #084B96;
                           text-decoration: none">
                            ${removedAttachment.name}
                        </a>
                    </span>
                </td>
            </tr>
        </#list>
        <#list change.getAddedAttachments() as addedAttachment>
            <tr>
                <td style="${title_style}"><@l10n>Attachment</@l10n></td>
                <td style="${value_style}">
                    <span style="margin: 0;">
                        <a href="${Utils.getAttachmentUrl(addedAttachment)}"
                           title="<@l10n>Added by ${addedAttachment.author.fullName},
                                  visible for ${Utils.getGroupVisibleName(addedAttachment.permittedGroup)}</@l10n>"
                           style="color: #084B96;
                           text-decoration: none">
                            ${addedAttachment.name}
                        </a>
                    </span>
                </td>
            </tr>
        </#list>
        <#--links change-->
        <#list change.getRemovedLinks() as removedLink>
            <tr>
                <td style="${title_style}">
                    ${removedLink.capitalizedRole}
                </td>
                <td style="${value_style}">
                    <span style="${changeLineThrough_style}">
                        <#assign linkedIssue = removedLink.to>
                        <a href="${Utils.getUrl(linkedIssue)}">${linkedIssue.getId()}: ${linkedIssue.summary}</a>
                    </span>
                </td>
            </tr>
        </#list>
        <#list change.getAddedLinks() as addedLink>
            <tr>
                <td style="${title_style}">
                    ${addedLink.capitalizedRole}
                </td>
                <td style="${value_style}">
                    <span style="margin: 0;">
                        <#assign linkedIssue = addedLink.to>
                        <a href="${Utils.getUrl(linkedIssue)}">${linkedIssue.getId()}: ${linkedIssue.summary}</a>
                    </span>
                </td>
            </tr>
        </#list>
        <#--custom fields change-->
        <#list change.getCustomFieldChanges() as customFieldChange>
            <tr>
                <td style="${title_style}">${customFieldChange.field.prototype.getNamePresentation()}</td>
                <td style="${value_style}">
                    <div style="${changeLineThrough_style}">${customFieldChange.prevPresentation}</div>
                    <div style="margin: 0;">${customFieldChange.nextPresentation}</div>
                </td>
            </tr>
        </#list>

    </table>
</#escape>
<#ftl attributes={"description":"List of last changes applied to an issue"}>
<#escape x as x?html>
    <table style="border: 0;
                  border-collapse: collapse;
                  border-spacing: 0;
                  margin: 0 0 1em;
                  padding: 0;
                  margin-top: 1em;
                  color: #000000;">
        <tbody attr>
        <#assign th_style = "vertical-align: top; text-align: left; padding-right: 15px; padding-bottom: 1em; font-size: 14px; font-weight: normal;">
        <#assign td_style = "font-size: 14px; padding-bottom: 1em; font-weight: bold;">
        <#assign change_p_style_lithrough_style= "margin: 0; text-decoration: line-through;">
        <#--project change-->
        <#if change.before.project != change.after.project>
            <tr attr>
                <th style="${th_style}"><@l10n>Project</@l10n></th>
                <td style="${td_style}">
                    <p style="${change_p_style_lithrough_style}">
                        ${change.before.project.name}, ${change.before.getId()}
                    </p>
                        ${change.after.project.name}, ${change.after.getId()}
                </td>
            </tr>
        </#if>
        <#--permitted group change-->
        <#if change.before.permittedGroup != change.after.permittedGroup>
            <tr attr>
                <th style="${th_style}"><@l10n>Visible to Group</@l10n></th>
                <td style="${td_style}">
                    <p style="${change_p_style_lithrough_style}">
                        ${Utils.getGroupVisibleName(change.before.permittedGroup)}
                    </p>
                        ${Utils.getGroupVisibleName(change.after.permittedGroup)}
                </td>
            </tr>
        </#if>
        <#--summary change-->
        <#if change.before.summary != change.after.summary>
            <tr attr>
                <th style="${th_style}"><@l10n>Summary</@l10n></th>
                <td colspan="2"  style="${td_style}">
                    <@diff oldText=change.before.summary
                           newText=change.after.summary
                           insStyle="background-color: #E6FFE6;"
                           delStyle="background-color: #FFE6E6;"/>
                </td>
            </tr>
        </#if>
        <#--description change-->
        <#if change.before.description != change.after.description>
            <tr attr>
                <th style="${th_style}"><@l10n>Description</@l10n></th>
                <td colspan="2"  style="${td_style}">
                    <#function nullSafe description>
                        <#if description?has_content>
                            <#return description>
                        <#else>
                            <#return "">
                        </#if>
                    </#function>
                    <@diff oldText=nullSafe(change.before.description)
                           newText=nullSafe(change.after.description)
                           insStyle="background-color: #E6FFE6;"
                           delStyle="background-color: #FFE6E6;"/>
                </td>
            </tr>
        </#if>
        <#--attachments change-->
        <#list change.getRemovedAttachments() as removedAttachment>
            <tr attr>
                <th style="${th_style}"><@l10n>Attachment</@l10n></th>
                <td style="${td_style}">
                <p style="${change_p_style_lithrough_style}">
                    <a href="${Utils.getAttachmentUrl(removedAttachment)}"
                       title="<@l10n>Removed by ${removedAttachment.author.fullName},
                              visible for ${Utils.getGroupVisibleName(removedAttachment.permittedGroup)}</@l10n>"
                       style="color: #084B96;
                       text-decoration: none">
                        ${removedAttachment.name}
                    </a>
                </p>
                </td>
            </tr>
        </#list>
        <#list change.getAddedAttachments() as addedAttachment>
            <tr attr>
                <th style="${th_style}"><@l10n>Attachment</@l10n></th>
                <td style="${td_style}">
                    <p style="margin: 0;">
                        <a href="${Utils.getAttachmentUrl(addedAttachment)}"
                           title="<@l10n>Added by ${addedAttachment.author.fullName},
                                  visible for ${Utils.getGroupVisibleName(addedAttachment.permittedGroup)}</@l10n>"
                           style="color: #084B96;
                           text-decoration: none">
                            ${addedAttachment.name}
                        </a>
                    </p>
                </td>
            </tr>
        </#list>
        <#--links change-->
        <#list change.getRemovedLinks() as removedLink>
            <tr attr>
                <th style="${th_style + "white-space: nowrap;"}">
                    ${removedLink.capitalizedRole}
                </th>
                <td style="${td_style}">
                <p style="${change_p_style_lithrough_style}">
                    <#assign linkedIssue = removedLink.to>
                    <a href="${Utils.getUrl(linkedIssue)}">${linkedIssue.getId()}: ${linkedIssue.summary}</a>
                </p>
                </td>
            </tr>
        </#list>
        <#list change.getAddedLinks() as addedLink>
            <tr attr>
                <th style="${th_style + "white-space: nowrap;"}">
                    ${addedLink.capitalizedRole}
                </th>
                <td style="${td_style}">
                <p style="margin: 0;">
                    <#assign linkedIssue = addedLink.to>
                    <a href="${Utils.getUrl(linkedIssue)}">${linkedIssue.getId()}: ${linkedIssue.summary}</a>
                </p>
                </td>
            </tr>
        </#list>
        <#--custom fields change-->
        <#list change.getCustomFieldChanges() as customFieldChange>
            <tr attr>
                <th style="${th_style}">${customFieldChange.field.prototype.getNamePresentation()}</th>
                <td style="${td_style}">
                    <p style="${change_p_style_lithrough_style}">${customFieldChange.prevPresentation}</p>
                    <p style="margin: 0;">${customFieldChange.nextPresentation}</p>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</#escape>
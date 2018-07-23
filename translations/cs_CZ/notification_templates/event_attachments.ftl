<#ftl attributes={"description":"Change of issue attachments"}>
<#escape x as x?html>
    <#assign addedAttachments = event.getAddedValues()>
    <#assign removedAttachments = event.getRemovedValues()>
    <#import "styles.ftl" as styles>
    <tr>

            <#list removedAttachments as removedAttachment>

                <td style="${styles.event_title}">
                    <@l10n>Attachment</@l10n>
                </td>
                <td style="${styles.event_value}">

                    <a href="${Utils.getAttachmentUrl(removedAttachment)}"
                       style="${styles.old_value}"
                    <#if removedAttachment.permittedGroup?has_content>
                       title="<@l10n>Removed by ${removedAttachment.author.fullName}, visible for ${removedAttachment.permittedGroup.name}</@l10n>"
                    <#else>
                       title="<@l10n>Removed by ${removedAttachment.author.fullName}</@l10n>"
                    </#if>>
                        ${removedAttachment.name}
                    </a>

                </td>

            </#list>
            <#list addedAttachments as addedAttachment>

                    <td style="${styles.event_title}">
                        <@l10n>Attachment</@l10n>
                    </td>
                    <td style="${styles.event_value}">

                            <a href="${Utils.getAttachmentUrl(addedAttachment)}"
                               style="${styles.new_value}"
                            <#if addedAttachment.permittedGroup?has_content>
                               title="<@l10n>Added by ${addedAttachment.author.fullName}, visible for ${addedAttachment.permittedGroup.name}</@l10n>"
                            <#else>
                               title="<@l10n>Added by ${addedAttachment.author.fullName}</@l10n>"
                            </#if>>
                                ${addedAttachment.name}
                            </a>

                    </td>

            </#list>

    </tr>
</#escape>
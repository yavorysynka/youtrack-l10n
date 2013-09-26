<#ftl attributes={"description":"List of added and removed attachments"}>
<#escape x as x?html>
    <#assign attachments = Utils.getVisibleAttachments(issue)>
    <#if attachments?has_content>
    <ul style="margin: 1em 0 0 0 !important;
               padding: 0 !important">
        <#list attachments as attachment>
            <li style="display: inline-block;
                       font-size: 90%;
                       list-style: none;
                       padding: 0 !important;
                       margin: 0 !important;">
                <a href="${Utils.getAttachmentUrl(attachment)}"
                   title="<#if attachment.permittedGroup?has_content>
                                <@l10n>Added by ${attachment.author.getVisibleName()} for ${attachment.permittedGroup.name}</@l10n>
                          <#else>
                                <@l10n>Added by ${attachment.author.getVisibleName()}</@l10n>
                          </#if>">
                    <span style="color: #105CB6;
                                 text-decoration: none;">
                        ${attachment.name}
                    </span>
                </a>
                <span style="color: #9EA1A5;">
                    <#if attachment.size?has_content>
                        <#assign size = attachment.size>
                        <#if (size < 1024)>
                            (<@l10n>${size}&nbsp;B</@l10n>)
                        <#else>
                            <#if (1024 <= size && size < 1024*1024) >
                                (<@l10n>${size/1024}&nbsp;KB</@l10n>)
                            <#else>
                                (<@l10n>${size/(1024*1024)}&nbsp;MB</@l10n>)
                            </#if>
                        </#if>
                    <#else>
                        (<@l10n>0&nbsp;B</@l10n>)
                    </#if>
                </span>
            </li>
        </#list>
    </ul>
    </#if>
    <#assign invisibleCount = Utils.getInvisibleAttachmentsCount(issue)>
    <#if (invisibleCount > 0)>
        <div>
            <#if (invisibleCount == 1)>
                <@l10n>You don't have permissions to view 1 more attachment to this issue</@l10n>
            <#else >
                <@l10n>You don't have permissions to view ${invisibleCount} more attachments to this issue</@l10n>
            </#if>
        </div>
    </#if>
</#escape>
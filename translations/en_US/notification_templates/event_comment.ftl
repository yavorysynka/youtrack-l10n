<#ftl attributes={"description":"Presentation of a change in comments (new comment or comment text update)"}>
<#escape x as x?html>
    <#assign comment = event.comment>
    <#assign oldCommentText = event.oldValue>
    <#assign newCommentText  = event.newValue>
    <#import "styles.ftl" as styles>
<tr>
    <td style="${styles.event_title} background:#f0f0f0; border-top: 8px solid #ffffff; width: 103px;">
        <img src="${Utils.getAvatarUrl(comment.author)}"
             alt="${comment.author.getVisibleName()}"
             width="24"
             height="24"/>
    </td>
    <td style="${styles.event_value} background:#f0f0f0; border-top: 8px solid #ffffff;">
        <#if oldCommentText?has_content>
            <@diff oldText=oldCommentText
            newText=newCommentText
            insStyle="${styles.new_value}"
            delStyle="${styles.old_value}"/>
        <#else>
            <@wiki><#noescape>${newCommentText}</#noescape></@wiki>
        </#if>

        <#if comment.permittedGroup?has_content>
            <div style="color: #8c8c8c;font-size: 85%; margin-top: 5px;">
                <@l10n>visible to: ${comment.permittedGroup.name}</@l10n>
            </div>
        </#if>

        <div style="display: inline-block; font-size: 85%;margin-top: 5px;">
             <a style="color: #105CB6;" href="${Utils.getCommentUrl(comment)}">
                 <@l10n>View</@l10n></a>
                <#assign replyLink = Utils.getCommentReplyUrl(comment)>
                <#if replyLink?has_content>
                    <a style="color: #105CB6; margin-left: 5px;" href="${replyLink}">Reply</a>
                </#if>
        </div>
    </td>
</tr>
</#escape>
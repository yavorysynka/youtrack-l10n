<#escape x as x?html>
    <#include "mailbox_hello.ftl">
    <p>
        <@l10n>
            From your message we automatically created <a href="${Utils.getCommentUrl(comment)}">a comment</a>
            for the issue <a href="${Utils.getUrl(comment.issue)}">${comment.issue.getId()}</a>
        </@l10n>
    </p>
    <#if newUser??>
        <#include "mailbox_new_account_info.ftl">
    </#if>
    <p>
        <@l10n>
            As a <b>commenter</b> of the issue, you will receive further notifications about any updates for your issue.
            All notifications will be sent to your e-mail address registered for the account. If you do not want to receive
            notifications, you can disable them in your user <a href="${Utils.getSettingUrl(to)}">profile</a>.
        </@l10n>
    </p>
    <#if inReplyToMessageText??>
        <#include "mailbox_quoted_message_text.ftl">
    </#if>
    <#include "mailbox_rule_maintainer.ftl">
</#escape>

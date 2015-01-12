<#escape x as x?html>
    <p style="font-size: 14px;
              color: #000000;
              margin: 0.5em 0 0.4em 0;">
        <#if only_via_duplicate><@l10n>Duplicate of issue(s) you are watching has been changed.</@l10n></#if>
        <#if from == to>
            <#if comment_updated>
                <@l10n>Comment was edited by <em>you</em> in</@l10n>
            <#else>
                <@l10n>New comment was added by <em>you</em> to</@l10n>
            </#if>
        <#else>
            <#if comment_updated>
                <@l10n>Comment was edited by <em>${from.getVisibleName()}</em> in</@l10n>
            <#else>
                <@l10n>New comment was added by <em>${from.getVisibleName()}</em> to</@l10n>
            </#if>
        </#if>
    </p>
    <#include "issue_header.ftl">
    <#include "issue_comment.ftl">
    <#include "footer.ftl">
</#escape>

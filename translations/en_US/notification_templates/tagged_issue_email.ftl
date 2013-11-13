<#escape x as x?html>
    <p style="font-size: 14px;
              color: #000000;
              margin: 0.5em 0 0.4em 0;">
        <#if only_via_duplicate><@l10n>Duplicate of issue(s) you are watching has been changed.</@l10n></#if>
        <#if from == to>
            <#if untag>
                <@l10n><em>You</em> removed tag from</@l10n>
            <#else>
                <@l10n><em>You</em> added tag to</@l10n>
            </#if>
        <#else>
            <#if untag>
                <@l10n>User <em>${from.getVisibleName()}</em> removed tag from</@l10n>
            <#else>
                <@l10n>User <em>${from.getVisibleName()}</em> added tag to</@l10n>
            </#if>
        </#if>
    </p>
    <#include "issue_header.ftl">
    <div style="color: #000000;
                margin-top: .5em;
                padding: 5px;
                background-color: #efefef;">
        <#if untag>
            <@l10n>Tag <b>${Utils.getTrimmedTagName(tag)}</b> removed</@l10n>
        <#else>
            <@l10n>Tag <b>${Utils.getTrimmedTagName(tag)}</b> added</@l10n>
        </#if>
    </div>
    <#include "footer.ftl">
</#escape>
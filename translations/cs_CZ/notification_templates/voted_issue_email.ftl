<#escape x as x?html>
    <p style="font-size: 14px;
              color: #000000;
              margin: 0.5em 0 0.4em 0;">
        <#if only_via_duplicate><@l10n>Duplicate of issue(s) you are watching has been changed.</@l10n></#if>
        <#if from == to>
            <#if unvote>
                <@l10n><em>You</em> took vote back from</@l10n>
            <#else>
                <@l10n><em>You</em> voted for</@l10n>
            </#if>
        <#else>
            <#if unvote>
                <@l10n>User <em>${from.getVisibleName()}</em> took vote back from</@l10n>
            <#else>
                <@l10n>User <em>${from.getVisibleName()}</em> voted for</@l10n>
            </#if>
        </#if>
    </p>
    <#include "issue_header.ftl">
    <div style="font-size: 110%;
                margin-top: .5em;
                padding: 5px;
                color: #000000;
                background-color: #efefef;">
        <b><@l10n>Total votes: ${votes}</@l10n></b>
    </div>
    <#include "footer.ftl">
</#escape>
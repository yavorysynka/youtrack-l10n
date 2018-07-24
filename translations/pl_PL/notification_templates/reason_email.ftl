<#ftl attributes={"description":"Detailed reason for sending email notification to user (HTML)"}>
<#escape x as x?html>

        <#if reason.message?has_content>
            <@l10n>You (<b>${to.login}</b>) received this message because ${reason.message}.</@l10n>
        <#else>
            <#if only_via_duplicate>
                <@l10n>
                    You (<b>${to.login}</b>) received this message because you have enabled the option
                    <b>Receive notifications on changes in duplicates cluster</b> and the following notification rule(s):
                </@l10n>
            <#else>
                <@l10n>
                    You (<b>${to.login}</b>) received this message because you have enabled notifications for
                </@l10n>
            </#if>

            <#assign tagsCount = reason.tags?size>
            <#assign savedSearchesCount = reason.savedSearches?size>

            <#list reason.savedSearchReasons as subreason>
                <#if subreason_has_next>
                    <b>${subreason.name}<#if only_via_duplicate> (${subreason.issueId})</#if></b>,
                <#else>
                    <b>${subreason.name}<#if only_via_duplicate> (${subreason.issueId})</#if></b>
                    <#if (savedSearchesCount > 1)>
                        <#if (tagsCount > 0)>
                            <@l10n>saved searches;</@l10n>
                        <#else>
                            <@l10n>saved searches.</@l10n>
                        </#if>
                    <#else>
                        <#if (tagsCount > 0)>
                            <@l10n>saved search;</@l10n>
                        <#else>
                            <@l10n>saved search.</@l10n>
                        </#if>
                    </#if>
                </#if>
            </#list>

            <#list reason.tagReasons as subreason>
                <#if subreason_has_next>
                    <b>${subreason.name}<#if only_via_duplicate> (${subreason.issueId})</#if></b>,
                <#else>
                    <b>${subreason.name}<#if only_via_duplicate> (${subreason.issueId})</#if></b>
                    <#if (tagsCount > 1)>
                        <@l10n>tags.</@l10n>
                    <#else>
                        <@l10n>tag.</@l10n>
                    </#if>
                </#if>
            </#list>
        </#if>
        <a href="${Utils.getSettingUrl(to)}"><@l10n>Notification settings</@l10n>.</a>

</#escape>
<#ftl attributes={"description":"Brief reason for sending jabber notification to user (plain text)"}>
<#escape x as x?html>
    <#if reason.message?has_content>
        <@l10n>You received this message because ${reason.message}.</@l10n>
    <#else>
        <p>
            <#if only_via_duplicate>
                <#assign reasonsCount  = reason.reasons?size>
                <#assign firstSingleReason  = reason.reasons[0]>
                <#if (reasonsCount > 1)>
                    <@l10n>You received this message because you have enabled notifications for "${firstSingleReason.name}"(${firstSingleReason.issueId}) and etc.</@l10n>
                <#else>
                    <@l10n>You received this message because you have enabled notifications for "${firstSingleReason.name}"(${firstSingleReason.issueId}).</@l10n>
                </#if>
            <#else>
                <#assign sssCount  = reason.savedSearches?size>
                <#assign total  = sssCount + reason.tags?size>
                <#if (sssCount > 0)>
                    <#assign firstSavedSearch = reason.savedSearches[0].name>
                    <#if (total > 1)>
                        <@l10n>You received this message because you have enabled notifications for "${firstSavedSearch}" saved search and etc.</@l10n>
                    <#else>
                        <@l10n>You received this message because you have enabled notifications for "${firstSavedSearch}" saved search.</@l10n>
                    </#if>
                <#else>
                    <#assign firstTag = reason.tags[0].name>
                    <#if (total > 1)>
                        <@l10n>You received this message because you have enabled notifications for "${firstTag}" tag and etc.</@l10n>
                    <#else>
                        <@l10n>You received this message because you have enabled notifications for "${firstTag}" tag.</@l10n>
                    </#if>
                </#if>
            </#if>
        </p>
    </#if>
</#escape>
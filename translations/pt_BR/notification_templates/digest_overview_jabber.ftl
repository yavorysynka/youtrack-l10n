<#ftl attributes={"description":"Overview of the issue update in jabber notification"}>
<#escape x as x?html>
<p>
    <#assign priority = issue.Priority>
    <#assign isShowStopper = (!priority?is_enumerable && priority == "Show-stopper")>
    <#if change.hasEvent("CREATED")>
        <#if (!priority?is_enumerable && priority == "Show-stopper")>
            <@l10n>New show-stopper was reported by ${issue.reporter.getVisibleName()}:</@l10n>
        <#else>
            <@l10n>New issue was reported by ${issue.reporter.getVisibleName()}:</@l10n>
        </#if>
    <#else>
        <#if from == to>
            <#if isShowStopper>
                <@l10n>You changed show-stopper:</@l10n>
            <#else>
                <@l10n>You changed issue:</@l10n>
            </#if>
        <#else>
            <#if isShowStopper>
                <@l10n>User ${from.getVisibleName()} changed show-stopper:</@l10n>
            <#else>
                <@l10n>User ${from.getVisibleName()} changed issue:</@l10n>
            </#if>
        </#if>
    </#if>
</p>
</#escape>
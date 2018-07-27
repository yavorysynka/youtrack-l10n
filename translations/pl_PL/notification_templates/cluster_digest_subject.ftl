<#if changes?size == 1>
    <#assign change=changes[0]>
    <#if change.hasEvent("CREATED")>
        <#assign header = "Created">
    <#elseif change.hasEvent("CUSTOM_FIELD", "Assignee") && change.issue.Assignee == to.login>
        <#assign header = "Assigned">
    <#elseif change.hasEvent("RESOLVED")>
        <#assign header = "Resolved">
    <#elseif change.hasEvent("COMMENT")>
        <#assign header = "Commented">
    <#elseif change.hasEvent("VOTERS")>
        <#assign header = "Voted">
    <#else>
        <#assign header = "Updated">
    </#if>
</#if>
[${application.name}, ${header}] <@l10n>Cluster ${issue.getId()}: ${issue.summary}</@l10n>
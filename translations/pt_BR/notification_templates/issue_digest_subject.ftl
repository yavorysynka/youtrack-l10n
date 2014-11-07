<#if change.hasEvent("CREATED")>
    <#assign header = "Created">
<#elseif change.hasEvent("CUSTOM_FIELD", "Assignee") && issue.Assignee == to.login>
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
[${application.name}, ${header}] <@l10n>Issue ${issue.getId()}: ${issue.summary}</@l10n>
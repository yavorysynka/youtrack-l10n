<#ftl attributes={"description":"Overview of the issue update in email notification"}>
<#escape x as x?html>
    <p style="font-size:14px;
              font-family: sans-serif;
              color:#000000;
              margin:14px 0 19px 44px">
        <#assign priority = issue.Priority>
        <#if (!priority?is_enumerable && (priority == "Critical" || priority == "Show-stopper"))>
            <#assign issueTypeStyle = "color: #cc0000;font-weight:bold">
        <#else>
            <#assign issueTypeStyle = "font-weight:bold">
        </#if>
        <#assign type = issue.Type>
        <#assign time = change.getWhen()>
        <#if type?has_content>
            <#assign issueName = type>
        <#else>
            <#assign issueName = "Issue">
        </#if>
        <#if change.hasEvent("CREATED")>
            <#if type?has_content>
                <@l10n>New <span style="${issueTypeStyle}">${type}</span> in project <span style="font-weight:bold">${issue.project.name}</span></@l10n>
            <#else>
                <@l10n>New <span style="${issueTypeStyle}">issue</span> in project <span style="font-weight:bold">${issue.project.name}</span></@l10n>
            </#if>
        <#else>
            <#if from==to>
                <#if type?has_content>
                    <@l10n>
                        <span style="${issueTypeStyle}">${type}</span> was updated by <span style="font-weight:bold">you</span>
                        in project ${issue.project.name} at ${time}.
                    </@l10n>
                <#else>
                    <@l10n>
                        <span style="${issueTypeStyle}">Issue</span> was updated by <span style="font-weight:bold">you</span>
                        in project ${issue.project.name} at ${time}.
                    </@l10n>
                </#if>
            <#else>
                <#if type?has_content>
                    <@l10n>
                        <span style="${issueTypeStyle}">${type}</span> was updated by <span style="font-weight:bold">${from.getVisibleName()}</span>
                        in project ${issue.project.name} at ${time}.
                    </@l10n>
                <#else>
                    <@l10n>
                        <span style="${issueTypeStyle}">Issue</span> was updated by <span style="font-weight:bold">${from.getVisibleName()}</span>
                        in project ${issue.project.name} at ${time}.
                    </@l10n>
                </#if>
            </#if>
        </#if>
    </p>
</#escape>
<#escape x as x?html>
    <@l10n>Database backup status report from ${application.url}</@l10n><br/>
    <#if exception?has_content>
        <@l10n>Exception while performing database backup:</@l10n>
        ${exception.getMessage()}<br/>
        <div><pre><@stacktrace throwable=exception/></pre></div>
    <#else>
        <@l10n>Database backup completed successfuly.</@l10n>
    </#if>
</#escape>
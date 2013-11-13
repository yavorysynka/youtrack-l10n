<#escape x as x?html>
    <#assign projectView = "${project.shortName} (${project.name})">
    <#if exception?has_content>
        <@l10n>
            Exception while importing project
            <a style="color: #105CB6; text-decoration: none; font-weight: bold;"
               href="${Utils.getJiraIntegrationUrl()}">
                ${projectView}
            </a>
        </@l10n><br/>
        <@l10n>Last progress message: ${message}</@l10n><br/>
        <@l10n>Exception: ${exception.getMessage()}</@l10n>
        <div><pre><@stacktrace throwable=exception/></pre></div>
    <#else>
        <@l10n>Importing project <b>${projectView}</b> completed successfully.</@l10n>
        <a href="${Utils.getIssuesUrl(project)}"><@l10n>List of issues</@l10n></a>
        <a style="margin-left: 5px; padding-left: 5px; border-left: 1px solid #ccc;" href="${Utils.getEditProjectUrl(project)}"><@l10n>Project administration</@l10n></a>
    </#if>
</#escape>
<#ftl attributes={"description":"Issue id and summary with link to the issue in YouTrack"}>
<#escape x as x?html>
    <#assign url = Utils.getUrl(issue)>
    <a title="${issue.project.name}"
       style="margin-left: 5px;
              font-size: 15px;
              color: #105CB6;
              text-decoration: none;
              <#if issue.isResolved()>
                  color: #676E75;
                  text-decoration: line-through;
              </#if>"
       href="${url}">
        ${issue.getId()}
    </a>
    <a title="<#if issue.reporter==to>
                    <@l10n>Issue created by you</@l10n>
              <#else>
                    <@l10n>Issue created by ${issue.reporter.getVisibleName()}</@l10n>
              </#if>"
       style="line-height: 18px;
              margin-left: 5px;
              font-size: 15px;
              color: #105CB6;
              text-decoration: none;"
       href="${url}">
        ${issue.summary}
    </a>
</#escape>
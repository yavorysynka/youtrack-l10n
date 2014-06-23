<#ftl attributes={"description":"Issue id and summary with link to the issue in YouTrack"}>
<#escape x as x?html>
    <#assign url = Utils.getUrl(issue)>
    <a title="${issue.project.name}"
       style="float:left;
              margin-right:6px;
              font-size: 15px;
              <#if issue.isResolved()>
                  color: #676E75;
                  text-decoration: line-through;
              <#else>
                  color: #1466c6;
                  text-decoration: none;
              </#if>"
       href="${url}">
        ${issue.getId()}
    </a>
    <a title="<#if issue.reporter==to><@l10n>Issue created by you</@l10n><#else><@l10n>Issue created by ${issue.reporter.getVisibleName()}</@l10n></#if>"
       style="font-size: 15px;
              color: #1466c6;
              text-decoration: none;"
       href="${url}">
        ${issue.summary}
    </a>
</#escape>
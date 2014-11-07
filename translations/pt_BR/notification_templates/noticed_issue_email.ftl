<#escape x as x?html>
    <p style="font-size: 14px;
              color: #000000;
              margin: 0.5em 0 0.4em 0;">
        <@l10n>The member of the project team (${from.getVisibleName()}) has looked at</@l10n>
    </p>
    <div style="background-color: #efefef">
        <#include "issue_header.ftl">
    </div>
    <#include "footer.ftl">
</#escape>

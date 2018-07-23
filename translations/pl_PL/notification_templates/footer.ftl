<#ftl attributes={"description":"Default footer which is used in all types of notification"}>
<#escape x as x?html>
    <div style="color: #777777;
              font-size: 11px;
              font-family: sans-serif;
              margin: 20px 0;
              padding: 8px 0;
              border-top: 1px solid #D4D5D6;">
        <#include "reason_email.ftl">
        <@l10n>Sincerely yours, ${application.name} ${application.version} (build #${application.build})</@l10n>
    </div>
</#escape>
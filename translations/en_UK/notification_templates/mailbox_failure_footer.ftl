<#ftl attributes={"description":"Email footer common in all mailbox failure notifications"}>
<#escape x as x?html>
    <p style="color: gray; font-size: 12px;">
        <@l10n>Sincerely yours, ${application.name} ${application.version} (build #${application.build})</@l10n>
    </p>
</#escape>
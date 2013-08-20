<#ftl attributes={"description":"Message warning about futher notifications"}>
<#escape x as x?html>
    <p>
        <@l10n>
            As a <b>${role}</b> of the issue, you will receive further notifications about any updates for your issue.
            All notifications will be sent to your e-mail address registered for the account. If do not want to receive
            notifications, you can disable them in your user <a href="${Utils.getSettingUrl(to)}">profile</a>.
        </@l10n>
    </p>
</#escape>
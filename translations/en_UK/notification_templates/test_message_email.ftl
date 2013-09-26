<#escape x as x?html>
    <@l10n>${to.getVisibleName()}, greetings from ${application.name}!</@l10n><br/>
    <br/>
    <p><@l10n>If you are reading this message, it means that you are able to receive notifications into this mailbox.</@l10n></p>
    <p><@l10n>Notification settings can be configured in your profile page using
        <a href="${Utils.getSettingUrl(to)}">"Filters and Notifications"</a> tab.</@l10n></p>
    <p><@l10n>Good luck!</@l10n></p>
</#escape>
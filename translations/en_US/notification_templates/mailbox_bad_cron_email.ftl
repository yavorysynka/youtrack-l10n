<#escape x as x?html>
    <#include "mailbox_failure_header.ftl">
    <p><@l10n>The minimal fetching interval is less than ${minFetchingInterval} minutes.</@l10n></p>
    <p><@l10n>Please change cron expression in Common Settings of Mailbox Integration.</@l10n></p>
    <#include "mailbox_failure_footer.ftl">
</#escape>


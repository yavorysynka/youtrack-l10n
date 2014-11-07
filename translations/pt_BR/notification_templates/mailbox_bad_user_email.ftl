<#escape x as x?html>
    <#include "mailbox_failure_header.ftl">
    <p><@l10n>Couldn't resolve user with email ${fromEmail}</@l10n></p>
    <#include "mailbox_failure_footer.ftl">
</#escape>
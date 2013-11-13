<#ftl attributes={"description":"Greetings with warning message about problems in mailbox integration"}>
<#escape x as x?html>
    <#include "mailbox_hello.ftl">
    <p><@l10n>A following problem occured while processing email from mailbox:</@l10n></p>
</#escape>
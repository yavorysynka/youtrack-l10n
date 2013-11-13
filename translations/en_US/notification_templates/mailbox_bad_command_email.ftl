<#escape x as x?html>
    <#include "mailbox_failure_header.ftl">
    <p><@l10n>Failed to apply command "${commandList.getText()}" to issue created from email from  ${fromEmail}.</@l10n></p>
    <ol>
        <#list commandList.getBadCommands() as command>
            <li <#if command.isError()>style="color: red;"</#if>>
                 ${command.getPresentation()}
            </li>
        </#list>
    </ol>
    <#include "mailbox_failure_footer.ftl">
</#escape>
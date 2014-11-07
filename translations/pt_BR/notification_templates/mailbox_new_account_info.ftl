<#ftl attributes={"description":"Information about user created by mailbox integration"}>
<#escape x as x?html>
    <p><@l10n>So we have also created a user account for you:</@l10n></p>
    <p>
        <@l10n>Username: ${newUser.login}</@l10n><br/>
        <@l10n>Password: ${password}</@l10n><br/>
        <#if newUser.fullName?has_content>
            <@l10n>Full name:  ${newUser.fullName}</@l10n><br/>
        </#if>
        <br/>
    </p>
    <p><@l10n>You can change any of the above credentials in your user <a href="${Utils.getSettingUrl(newUser)}">profile</a></@l10n></p>
</#escape>
<#ftl attributes={"description":"Presentation of an issue with all significant properties: id, description, summary, values of fields etc."}>
<#escape x as x?html>
    <#if issue.permittedGroup?has_content>
        <div style="margin-top: .5em;">
            <span style="color: #777777;">
                ${issue.permittedGroup.name}
            </span>
        </div>
    </#if>
    <#include "tags_panel.ftl">
    <#include "links_panel.ftl">
    <#include "attachments_panel.ftl">
    <hr style = "height: 1px;
                 max-height: 1px;
                 border: 0;
                 background-color: #999999;
                 margin-top: 1em;"/>
    <#include "fields_panel.ftl">
    <#if issue.comments?has_content>
        <div>
            <hr style="height: 1px;
                       max-height: 1px;
                       border: 0;
                       background-color: #999999;"/>
            <#assign count = issue.comments?size>
            <#if count == 1>
                <@l10n>1 comment</@l10n>
            <#else>
                <@l10n>${count} comments</@l10n>
            </#if>
        </div>
    </#if>
</#escape>
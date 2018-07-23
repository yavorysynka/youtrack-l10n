<#ftl attributes={"description":"Issue id, summary and description with \"Star\" tag and reporter information"}>
<#escape x as x?html>
    <div style="padding: 5px;
                font-family: arial, Helvetica, sans-serif;">
        <#include "issue_short_header.ftl">
        <div style="margin-top: .7em;">
            <#if issue.description?has_content>
                <@wiki><#noescape>${issue.description}</#noescape></@wiki>
             <#else>
                <span style="color: #777777;">
                    <@l10n>No description</@l10n>
                </span>
            </#if>
        </div>
    </div>
</#escape>
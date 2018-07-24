<#ftl attributes={"description":"Issue id, summary and description with \"Star\" tag and reporter information"}>
<#escape x as x?html>
    <#include "issue_short_header.ftl">
    <div style="margin:14px 0 14px 29px;">
        <#if issue.description?has_content>
            <@wiki><#noescape>${issue.description}</#noescape></@wiki>
         <#else>
            <span style="color: #888888;">
                <@l10n>No description</@l10n>
            </span>
        </#if>
    </div>
</#escape>
<#ftl attributes={"description":"Issue id and summary with \"Star\" tag and reporter information"}>
<#escape x as x?html>
    <div style="padding: 5px;
                font-family: arial, Helvetica, sans-serif;">
        <div style="max-width: 160px;
                    word-wrap: break-word;
                    color: #777777;
                    text-align: right;
                    float: right;
                    margin-left: 5px;
                    font-size: 11px;">
            <#if issue.reporter==to>
                <@l10n>(created by you)</@l10n>
            <#else>
                <@l10n>(created by ${issue.reporter.getVisibleName()})</@l10n>
            </#if>
        </div>
        <#include "issue_star.ftl">
        <#include "issue_id_summary.ftl">
    </div>
</#escape>
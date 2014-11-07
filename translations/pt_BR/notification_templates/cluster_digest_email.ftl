<#escape x as x?html>
    <div style="font-size:14px;
              font-family: sans-serif;
              color:#000000;
              margin:14px 0 19px 44px">
        <#if from==to>
            <@l10n>
                Duplicate cluster was updated by <span style="font-weight:bold">you</span>
                in project ${issue.project.name}.
            </@l10n>
        <#else>
            <@l10n>
                Duplicate cluster was updated by <span style="font-weight:bold">${from.getVisibleName()}</span>
                in project ${issue.project.name}.
            </@l10n>
        </#if>
    </div>
    <#include "issue_header.ftl">
    <#list changes as change>
        <div style="font-family: sans-serif; margin: 18px 20px 0 45px;padding-bottom: 4px; border-bottom: 1px solid #D4D5D6;">
                <#assign duplicate = change.issue>

                <a title="${duplicate.summary}"
                   style="float:left;
                           margin-right:6px;
                           font-size: 15px;
                           text-decoration: none;
                       <#if duplicate.isResolved()>
                           color: #676E75;
                           text-decoration: line-through;
                       <#else>
                           color: #105CB6;
                       </#if>"
                   href="${Utils.getUrl(duplicate)}">
                    ${duplicate.getId()}
                </a>

                <span style="padding-left: 5px; font-size: 11px; font-family:sans-serif; text-align: right; color: #888888">
                    <#if duplicate.reporter==to>
                        <@l10n>(Created by you)</@l10n>
                    <#else>
                        <@l10n>(Created by ${duplicate.reporter.getVisibleName()})</@l10n>
                    </#if>
                </span>
            </div>
            <#include "events.ftl">
    </#list>
    <div style="margin-left: 44px; padding: 4px 0 8px;">
        <#include "footer.ftl">
    </div>
</#escape>
<#ftl attributes={"description":"Presentation for a list of all events included in an issue change "}>
<#escape x as x?html>
    <#import "styles.ftl" as styles>
    <#--list of events-->
    <table style="${styles.event_change} ${styles.table}">
        <#list change.events as event>
                    <#assign category = event.category>
                    <#if category == "CREATED">
                        <#include "event_new_issue.ftl">
                    <#elseif category == "PROJECT" || category == "CUSTOM_FIELD">
                        <#include "event_default_change.ftl">
                    <#elseif category == "SUMMARY" || category == "DESCRIPTION">
                        <#include "event_text_change.ftl">
                    <#elseif category == "COMMENT">
                        <#include "event_comment.ftl">
                    <#elseif category == "LINKS">
                        <#include "event_links.ftl">
                    <#elseif category == "TAGS">
                        <#include "event_tags.ftl">
                    <#elseif category == "ATTACHMENTS">
                        <#include "event_attachments.ftl">
                    <#elseif category == "VOTERS">
                        <#include "event_voters.ftl">
                    <#elseif category == "RESOLVED">
                        <#include "event_resolved.ftl">
                    <#elseif category == "TIME_TRACKING">
                        <#include "event_work_item.ftl">
                    <#else>
                        <#include "event_default_change.ftl">
                    </#if>

        </#list>
    </table>
</#escape>
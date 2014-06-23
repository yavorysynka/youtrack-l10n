<#ftl attributes={"description":"Change of issue links"}>
<#escape x as x?html>
    <#assign linkName = event.name>
    <#assign linkedIssues = event.getAddedValues()>
    <#assign unlinkedIssues = event.getRemovedValues()>
    <#import "styles.ftl" as styles>
    <tr>
        <td style="${styles.event_title}">
            ${linkName}
        </td>
        <td style="${styles.event_value}">
            <#if unlinkedIssues?has_content>
                <#list unlinkedIssues as unlinked>
                    <a style="${styles.old_value}" href="${Utils.getUrl(unlinked)}">${unlinked.getId()} ${unlinked.summary}</a><#if unlinked_has_next || linkedIssues?has_content>,</#if>
                </#list>
            </#if>
            <#if linkedIssues?has_content>
                <#list linkedIssues as linked>
                    <a style="${styles.new_value + "background:none;"} "href="${Utils.getUrl(linked)}">
                        <span <#if linked.isResolved()>style="text-decoration: line-through; color: #888888;" </#if>>${linked.getId()}</span> ${linked.summary}
                    </a><#if linked_has_next>,</#if>
                </#list>
            </#if>
        </td>
    </tr>
</#escape>
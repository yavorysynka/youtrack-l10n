<#ftl attributes={"description":"List of all linked issues sorted by the link name"}>
<#escape x as x?html>
    <#if Utils.hasLinks(issue)>
    <ul style="margin: 1em 0 0 0 !important;
               padding: 0 !important;">
        <#list Utils.getLinkRoles(issue) as role>
            <li style="display: inline-block;
                       font-size: 90%;
                       list-style: none;
                       padding: 0!important;
                       margin: 0!important;
                       color: #777777;">
                ${role}
            </li>
            <#list Utils.getLinkedIssues(issue, role) as linked_issue>
                <li style="display: inline-block;
                           font-size: 90%;
                           list-style: none;
                           padding: 0!important;
                           margin: 0!important;
                           margin-right: 5px!important;">
                    <a style="
                        <#if linked_issue.isResolved()>
                            color: #084b96; text-decoration: line-through;
                        <#else>
                            color: #676E75; text-decoration: none;
                        </#if>"
                       href="${Utils.getUrl(linked_issue)}">
                       ${linked_issue.getId()}
                    </a>
                </li>
            </#list>
        </#list>
    </ul>
    </#if>
</#escape>
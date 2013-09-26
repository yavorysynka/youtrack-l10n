<#ftl attributes={"description":"List of issue tags (except \"Star\")"}>
<#escape x as x?html>
    <#assign tags = Utils.getExplicitTags(issue)>
    <#if tags?has_content>
    <ul style="margin: 1em 0 0 0 !important;
               padding: 0 !important;">
    <#list tags as tag>
        <li style="display: inline-block;
                   font-size: 11px;
                   list-style: none;
                   padding: 0 2px;
                   border: 1px solid #999999;
                   white-space: nowrap;
                   margin-left: 0 !important;">
            <a style="color: #105CB6;
                      text-decoration: none;"
               title="${tag.name}"
               href="${Utils.getTaggedIssuesUrl(tag)}">
                ${Utils.getTrimmedTagName(tag)}
            </a>
        </li>
    </#list>
    </ul>
    </#if>
</#escape>
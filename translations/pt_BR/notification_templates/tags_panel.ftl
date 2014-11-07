<#ftl attributes={"description":"List of issue tags (except \"Star\")"}>
<#escape x as x?html>
    <#assign tags = Utils.getExplicitTags(issue)>
    <#if tags?has_content>

        <#import "styles.ftl" as styles>
        <div style="margin: 13px 0 0 0; padding: 0;">
            <#list tags as tag>
                <a style="${styles.tag_bar} ${styles.tag_colors[Utils.getCssClass(tag)]}"
                   title="${tag.name}"
                   href ="${Utils.getTaggedIssuesUrl(tag)}">
                    ${Utils.getTrimmedTagName(tag)}
                </a>
            </#list>
        </div>
    </#if>
</#escape>
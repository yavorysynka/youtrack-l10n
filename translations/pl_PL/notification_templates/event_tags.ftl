<#ftl attributes={"description":"Change of issue tags"}>

<#escape x as x?html>
    <#assign addedTags = event.getAddedValues()>
    <#assign removedTags = event.getRemovedValues()>
    <#import "styles.ftl" as styles>
        <tr style="${styles.event_change}">
            <td style="${styles.event_title}">
                <@l10n>Tags</@l10n>
            </td>
            <td style="${styles.event_value}">
                <#list addedTags as tag>
                    <a style="${styles.tag_bar} ${styles.tag_colors[Utils.getCssClass(tag)]}"
                       title="${tag.name}"
                       href ="${Utils.getTaggedIssuesUrl(tag)}">
                        ${Utils.getTrimmedTagName(tag)}
                    </a>&nbsp;
                </#list>
                <#list removedTags as tag>
                    <a style="${styles.tag_bar} ${styles.tag_colors[Utils.getCssClass(tag)]} text-decoration:line-through!important;"
                       title="${tag.name}"
                       href ="${Utils.getTaggedIssuesUrl(tag)}">
                        ${Utils.getTrimmedTagName(tag)}
                    </a>&nbsp;
                </#list>
            </td>
        </tr>
</#escape>
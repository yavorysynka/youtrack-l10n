<#ftl attributes={"description":"Default presentation of an event from issue change"}>
<#escape x as x?html>
    <#import "styles.ftl" as styles>
    <tr>
        <td style="${styles.event_title}">${event.name}</td>
        <td style="${styles.event_value}">
            <#if event.isMultiValue()>
                <#assign removedValues = event.getRemovedValues()>
                <#assign addedValues = event.getAddedValues()>
                <#if removedValues?has_content>
                    <#list removedValues as removedValue>
                        <span style="${styles.old_value}">${removedValue}</span><#if removedValue_has_next || addedValues?has_content>,</#if>
                    </#list>
                </#if>
                <#if addedValues?has_content>
                    <#list addedValues as addedValue>
                        <span style="${styles.new_value}">${addedValue}</span><#if addedValue_has_next>,</#if>
                    </#list>
                </#if>
            <#else>
                <span>${event.oldValue}</span>
                <span style="margin-left: 5px;">
                    &rarr;
                </span>
                <span style="${styles.new_value}">${event.newValue}</span>
            </#if>
        </td>
    </tr>
</#escape>
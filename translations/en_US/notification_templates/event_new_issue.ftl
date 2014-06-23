<#ftl attributes={"description":"Presentation of an issue with all significant properties: id, description, summary, values of fields etc."}>
<#escape x as x?html>
    <#import "styles.ftl" as styles>
    <tr>
        <td colspan="2" style="${styles.event_title}">
            <#if issue.permittedGroup?has_content>
                <table style="${styles.table}">
                    <tr>
                        <td style="${styles.event_title}"><@l10n>Visible to Group</@l10n></td>
                        <td style="${styles.event_value}">${issue.permittedGroup.name}</td>
                    </tr>
                </table>
            </#if>
            <#assign tags = Utils.getExplicitTags(issue)>
            <#include "tags_panel.ftl">
            <#include "links_panel.ftl">
            <#include "attachments_panel.ftl">
            <hr style = "height: 1px;
                         max-height: 1px;
                         border: 0;
                         background: #d9d9d9;
                         margin: 19px 0 15px;"/>
            <table>
                <#list Utils.getCustomFields(issue) as field>
                    <tr>
                        <td style="width: 116px;
                                   vertical-align: top;
                                   padding: 5px 5px 5px 0;
                                   padding-right: 10px;
                                   font-family: sans-serif;
                                   font-size: 13px;
                                   color: #888888;">
                            ${field.prototype.getNamePresentation()}
                        </td>
                        <td style="vertical-align: top;
                                   padding: 5px;
                                   font-family: sans-serif;
                                   font-size: 13px;">
                            <#assign background = field.getBackgroundColor(issue)>
                            <#assign foreground = field.getForegroundColor(issue)>
                            <div style="padding: 2px 4px; font-size: 90%;
                                <#if background?has_content>
                                        background-color: ${background} !important;
                                </#if>">
                                <div style="word-wrap: break-word; overflow: hidden;
                                    <#if foreground?has_content>
                                            color: ${foreground} !important;
                                    </#if>">
                                    ${field.getValuePresentation(issue)}
                                </div>
                            </div>
                        </td>
                    </tr>
                </#list>
            </table>
        </td>
    </tr>
</#escape>
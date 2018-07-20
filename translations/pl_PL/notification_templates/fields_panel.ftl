<#ftl attributes={"description":"Presentation of custom field values"}>
<#escape x as x?html>
    <table>
        <#list Utils.getCustomFields(issue) as field>
            <tr>
                <td style="vertical-align: top;
                           padding: 5px 5px 5px 0;
                           padding-right: 10px;
                           font-family: sans-serif;
                           font-size: 13px;
                           color: #000000;">
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
</#escape>

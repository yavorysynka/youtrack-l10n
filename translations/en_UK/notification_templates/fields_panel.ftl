<#ftl attributes={"description":"Presentation of custom field values"}>
<#escape x as x?html>
    <table>
        <#list Utils.getCustomFields(issue) as field>
            <tr>
                <td style="vertical-align: top;
                           padding: 5px;
                           margin-right: 10px;
                           text-align: right;">
                    ${field.prototype.getNamePresentation()} :
                </td>
                <td style="vertical-align: top;
                           padding: 5px;">
                    <#assign background = field.getBackgroundColor(issue)>
                    <#assign foreground = field.getForegroundColor(issue)>
                    <div style="padding: 1px; font-size: 90%;
                            <#if background?has_content>
                                background-color: ${background} !important;
                            <#else>
                                background-color: #F9F9FA;
                            </#if>">
                        <div style="word-wrap: break-word; overflow: hidden;
                                <#if foreground?has_content>
                                    foreground-color: ${foreground} !important;
                                </#if>">
                            ${field.getValuePresentation(issue)}
                        </div>
                    </div>
                </td>
            </tr>
        </#list>
    </table>
</#escape>

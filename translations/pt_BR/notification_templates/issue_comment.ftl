<#ftl attributes={"description":"Presentation of issue comment with information about its author and comment text"}>
<#escape x as x?html>
    <table style="border: 0;
                  border-collapse: collapse;
                  border-spacing: 0;
                  margin: 0  0  1em;
                  padding: 0;
                  width:100%;
                  font-family: arial, helvetics, sans-serif;
                  color: #000000;">
        <tbody>
        <tr>
            <td style="vertical-align: top;
                       padding: 5px;
                       background-color: #efefef;
                       width: 40px;">
                <img src="${Utils.getAvatarUrl(comment.author)}"
                     alt="${comment.author.getVisibleName()}"
                     style="margin-right: 3px; border: 1px solid #d2d2d2;"
                     width="40"
                     height="40">
            </td>
            <td style="vertical-align: top;
                       padding: 5px;
                       background-color: #e8e8e8;">
                <@wiki><#noescape>${comment.text}</#noescape></@wiki>
                <#if comment.permittedGroup?has_content>
                    <div style="color: #666666;
                                margin-top: .7em;
                                font-size: 90%;
                                font-style: italic;">
                        <@l10n>comment is visible to: ${Utils.getGroupVisibleName(comment.permittedGroup)}</@l10n>
                    </div>
                </#if>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="vertical-align: top;
                                   padding: 5px;
                                   font-size: 11px;
                                   margin-top: 1em;
                                   color: #999;">
                <div style="color: #777777;
                            font-size: 11px;
                            float: right;">
                    ${Utils.inUserTimeZone(comment.created)}
                </div>
                <a style="color: #105CB6;
                          margin-left: 5px;"
                   href="${Utils.getCommentUrl(comment)}"><@l10n>View</@l10n></a>
                <#assign replyLink = Utils.getCommentReplyUrl(comment)>
                <#if replyLink?has_content>
                    <a style="color: #105CB6;
                              margin-left: 5px;"
                       href="${replyLink}"><@l10n>Reply</@l10n></a>
                </#if>
            </td>
        </tr>
        </tbody>
    </table>
</#escape>
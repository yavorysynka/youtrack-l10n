<#ftl attributes={"description":"Tag \"Star\" representation with the icon and link to the starred issue"}>
<#escape x as x?html>
    <a style="text-decoration: none; border: 0;" href="${Utils.getUrl(issue)}">
        <img src="${Utils.getStarSrc(issue)}" width="16" height="16" alt="">
    </a>
</#escape>
<#ftl attributes={"description":"Tag \"Star\" representation with the icon and link to the starred issue"}>
<#escape x as x?html>
        <img style="border: 0;" src="${Utils.getStarSrc(issue)}" width="16" height="16" alt="">
</#escape>
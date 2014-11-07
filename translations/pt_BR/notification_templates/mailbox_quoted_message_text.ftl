<#ftl attributes={"description":"Represents text consisted of lines as quoted"}>
<#escape x as x?html>
    <br/>
    <blockquote style="border-left: 1px solid blue; padding-left: 1em">
        <@wiki><#noescape>${inReplyToMessageText}</#noescape></@wiki>
    </blockquote>
</#escape>
<#ftl attributes={"description":"Component switching between full and short issue header"}>
<#if init_notification>
    <#include "issue_full_header.ftl">
<#else>
    <#include "issue_short_header.ftl">
</#if>


<%@ page import="arb.Bet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bet.label', default: 'Bet')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bet.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: betInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bet.start.label" default="Start" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${betInstance?.start}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bet.end.label" default="End" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${betInstance?.end}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bet.winningLeg.label" default="Winning Leg" /></td>
                            
                            <td valign="top" class="value"><g:link controller="betLeg" action="show" id="${betInstance?.winningLeg?.id}">${betInstance?.winningLeg?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bet.lega.label" default="Lega" /></td>
                            
                            <td valign="top" class="value"><g:link controller="betLeg" action="show" id="${betInstance?.lega?.id}">${betInstance?.lega?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bet.legb.label" default="Legb" /></td>
                            
                            <td valign="top" class="value"><g:link controller="betLeg" action="show" id="${betInstance?.legb?.id}">${betInstance?.legb?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bet.totalProfit.label" default="Total Profit" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: betInstance, field: "totalProfit")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${betInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

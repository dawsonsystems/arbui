
<%@ page import="arb.BetLeg" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'betLeg.label', default: 'BetLeg')}" />
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
                            <td valign="top" class="name"><g:message code="betLeg.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: betLegInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="betLeg.output.label" default="Output" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: betLegInstance, field: "output")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="betLeg.profit.label" default="Profit" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: betLegInstance, field: "profit")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="betLeg.totalReturn.label" default="Total Return" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: betLegInstance, field: "totalReturn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="betLeg.endProfit.label" default="End Profit" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: betLegInstance, field: "endProfit")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="betLeg.bet.label" default="Bet" /></td>
                            
                            <td valign="top" class="value"><g:link controller="bet" action="show" id="${betLegInstance?.bet?.id}">${betLegInstance?.bet?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="betLeg.bookie.label" default="Bookie" /></td>
                            
                            <td valign="top" class="value"><g:link controller="bookie" action="show" id="${betLegInstance?.bookie?.id}">${betLegInstance?.bookie?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="betLeg.input.label" default="Input" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: betLegInstance, field: "input")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${betLegInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

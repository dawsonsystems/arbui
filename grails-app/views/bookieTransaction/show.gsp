
<%@ page import="arb.BookieTransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bookieTransaction.label', default: 'BookieTransaction')}" />
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
                            <td valign="top" class="name"><g:message code="bookieTransaction.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookieTransactionInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookieTransaction.betLeg.label" default="Bet Leg" /></td>
                            
                            <td valign="top" class="value"><g:link controller="betLeg" action="show" id="${bookieTransactionInstance?.betLeg?.id}">${bookieTransactionInstance?.betLeg?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookieTransaction.bookie.label" default="Bookie" /></td>
                            
                            <td valign="top" class="value"><g:link controller="bookie" action="show" id="${bookieTransactionInstance?.bookie?.id}">${bookieTransactionInstance?.bookie?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookieTransaction.bookieBalance.label" default="Bookie Balance" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookieTransactionInstance, field: "bookieBalance")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookieTransaction.moneyIn.label" default="Money In" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookieTransactionInstance, field: "moneyIn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookieTransaction.moneyOut.label" default="Money Out" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookieTransactionInstance, field: "moneyOut")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${bookieTransactionInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

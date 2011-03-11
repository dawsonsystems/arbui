
<%@ page import="arb.MoneyBookersTransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction')}" />
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
                            <td valign="top" class="name"><g:message code="moneyBookersTransaction.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: moneyBookersTransactionInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="moneyBookersTransaction.bookieTransaction.label" default="Bookie Transaction" /></td>
                            
                            <td valign="top" class="value"><g:link controller="bookieTransaction" action="show" id="${moneyBookersTransactionInstance?.bookieTransaction?.id}">${moneyBookersTransactionInstance?.bookieTransaction?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="moneyBookersTransaction.balance.label" default="Balance" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: moneyBookersTransactionInstance, field: "balance")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="moneyBookersTransaction.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${moneyBookersTransactionInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="moneyBookersTransaction.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${moneyBookersTransactionInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="moneyBookersTransaction.moneyIn.label" default="Money In" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: moneyBookersTransactionInstance, field: "moneyIn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="moneyBookersTransaction.moneyOut.label" default="Money Out" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: moneyBookersTransactionInstance, field: "moneyOut")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${moneyBookersTransactionInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

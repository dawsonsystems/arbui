

<%@ page import="arb.MoneyBookersTransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${moneyBookersTransactionInstance}">
            <div class="errors">
                <g:renderErrors bean="${moneyBookersTransactionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${moneyBookersTransactionInstance?.id}" />
                <g:hiddenField name="version" value="${moneyBookersTransactionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bookieTransaction"><g:message code="moneyBookersTransaction.bookieTransaction.label" default="Bookie Transaction" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moneyBookersTransactionInstance, field: 'bookieTransaction', 'errors')}">
                                    <g:select name="bookieTransaction.id" from="${arb.BookieTransaction.list()}" optionKey="id" value="${moneyBookersTransactionInstance?.bookieTransaction?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="balance"><g:message code="moneyBookersTransaction.balance.label" default="Balance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moneyBookersTransactionInstance, field: 'balance', 'errors')}">
                                    <g:textField name="balance" value="${fieldValue(bean: moneyBookersTransactionInstance, field: 'balance')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="moneyIn"><g:message code="moneyBookersTransaction.moneyIn.label" default="Money In" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moneyBookersTransactionInstance, field: 'moneyIn', 'errors')}">
                                    <g:textField name="moneyIn" value="${fieldValue(bean: moneyBookersTransactionInstance, field: 'moneyIn')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="moneyOut"><g:message code="moneyBookersTransaction.moneyOut.label" default="Money Out" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moneyBookersTransactionInstance, field: 'moneyOut', 'errors')}">
                                    <g:textField name="moneyOut" value="${fieldValue(bean: moneyBookersTransactionInstance, field: 'moneyOut')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

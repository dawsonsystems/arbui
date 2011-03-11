

<%@ page import="arb.MoneyBookersTransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${moneyBookersTransactionInstance}">
            <div class="errors">
                <g:renderErrors bean="${moneyBookersTransactionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="doCreate" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bookie">Bookie (optional)</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moneyBookersTransactionInstance, field: 'bookieTransaction', 'errors')}">
                                    <g:select name="bookie.id" from="${arb.Bookie.list()}" optionKey="id" optionValue="name" value="${moneyBookersTransactionInstance?.bookie?.id}" noSelection="['null': 'None (Pot TX)']" />
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>



<%@ page import="arb.BookieTransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bookieTransaction.label', default: 'BookieTransaction')}" />
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
            <g:hasErrors bean="${bookieTransactionInstance}">
            <div class="errors">
                <g:renderErrors bean="${bookieTransactionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="betLeg"><g:message code="bookieTransaction.betLeg.label" default="Bet Leg" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookieTransactionInstance, field: 'betLeg', 'errors')}">
                                    <g:select name="betLeg.id" from="${arb.BetLeg.list()}" optionKey="id" value="${bookieTransactionInstance?.betLeg?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bookie"><g:message code="bookieTransaction.bookie.label" default="Bookie" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookieTransactionInstance, field: 'bookie', 'errors')}">
                                    <g:select name="bookie.id" from="${arb.Bookie.list()}" optionKey="id" value="${bookieTransactionInstance?.bookie?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bookieBalance"><g:message code="bookieTransaction.bookieBalance.label" default="Bookie Balance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookieTransactionInstance, field: 'bookieBalance', 'errors')}">
                                    <g:textField name="bookieBalance" value="${fieldValue(bean: bookieTransactionInstance, field: 'bookieBalance')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="moneyIn"><g:message code="bookieTransaction.moneyIn.label" default="Money In" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookieTransactionInstance, field: 'moneyIn', 'errors')}">
                                    <g:textField name="moneyIn" value="${fieldValue(bean: bookieTransactionInstance, field: 'moneyIn')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="moneyOut"><g:message code="bookieTransaction.moneyOut.label" default="Money Out" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookieTransactionInstance, field: 'moneyOut', 'errors')}">
                                    <g:textField name="moneyOut" value="${fieldValue(bean: bookieTransactionInstance, field: 'moneyOut')}" />
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

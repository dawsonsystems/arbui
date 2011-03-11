
<%@ page import="arb.MoneyBookersTransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'moneyBookersTransaction.id.label', default: 'Id')}" />
                            <g:sortableColumn property="balance" title="${message(code: 'moneyBookersTransaction.balance.label', default: 'Balance')}" />
                            <g:sortableColumn property="moneyIn" title="${message(code: 'moneyBookersTransaction.moneyIn.label', default: 'Money In')}" />
                            <g:sortableColumn property="moneyOut" title="${message(code: 'moneyBookersTransaction.moneyIn.label', default: 'Money Out')}" />
                            <th><g:message code="moneyBookersTransaction.bookieTransaction.label" default="Bookie Transaction" /></th>
                            <g:sortableColumn property="dateCreated" title="${message(code: 'moneyBookersTransaction.dateCreated.label', default: 'Date Created')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${moneyBookersTransactionInstanceList}" status="i" var="moneyBookersTransactionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${moneyBookersTransactionInstance.id}">${fieldValue(bean: moneyBookersTransactionInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: moneyBookersTransactionInstance, field: "balance")}</td>
                            <td>${fieldValue(bean: moneyBookersTransactionInstance, field: "moneyIn")}</td>
                            <td>${fieldValue(bean: moneyBookersTransactionInstance, field: "moneyOut")}</td>
                            <td>${moneyBookersTransactionInstance.bookieTransaction?.bookie?.name}</td>
                            <td><g:formatDate date="${moneyBookersTransactionInstance.dateCreated}" /></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${moneyBookersTransactionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

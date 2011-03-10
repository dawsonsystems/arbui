
<%@ page import="arb.BookieTransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bookieTransaction.label', default: 'BookieTransaction')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'bookieTransaction.id.label', default: 'Id')}" />
                        
                            <th><g:message code="bookieTransaction.betLeg.label" default="Bet Leg" /></th>
                        
                            <th><g:message code="bookieTransaction.bookie.label" default="Bookie" /></th>
                        
                            <g:sortableColumn property="bookieBalance" title="${message(code: 'bookieTransaction.bookieBalance.label', default: 'Bookie Balance')}" />
                        
                            <g:sortableColumn property="moneyIn" title="${message(code: 'bookieTransaction.moneyIn.label', default: 'Money In')}" />
                        
                            <g:sortableColumn property="moneyOut" title="${message(code: 'bookieTransaction.moneyOut.label', default: 'Money Out')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bookieTransactionInstanceList}" status="i" var="bookieTransactionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bookieTransactionInstance.id}">${fieldValue(bean: bookieTransactionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bookieTransactionInstance, field: "betLeg")}</td>
                        
                            <td>${fieldValue(bean: bookieTransactionInstance, field: "bookie")}</td>
                        
                            <td>${fieldValue(bean: bookieTransactionInstance, field: "bookieBalance")}</td>
                        
                            <td>${fieldValue(bean: bookieTransactionInstance, field: "moneyIn")}</td>
                        
                            <td>${fieldValue(bean: bookieTransactionInstance, field: "moneyOut")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bookieTransactionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

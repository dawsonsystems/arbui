
<%@ page import="arb.BetLeg" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'betLeg.label', default: 'BetLeg')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'betLeg.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="output" title="${message(code: 'betLeg.output.label', default: 'Output')}" />
                        
                            <g:sortableColumn property="profit" title="${message(code: 'betLeg.profit.label', default: 'Profit')}" />
                        
                            <g:sortableColumn property="totalReturn" title="${message(code: 'betLeg.totalReturn.label', default: 'Total Return')}" />
                        
                            <g:sortableColumn property="endProfit" title="${message(code: 'betLeg.endProfit.label', default: 'End Profit')}" />
                        
                            <th><g:message code="betLeg.bet.label" default="Bet" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${betLegInstanceList}" status="i" var="betLegInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${betLegInstance.id}">${fieldValue(bean: betLegInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: betLegInstance, field: "output")}</td>
                        
                            <td>${fieldValue(bean: betLegInstance, field: "profit")}</td>
                        
                            <td>${fieldValue(bean: betLegInstance, field: "totalReturn")}</td>
                        
                            <td>${fieldValue(bean: betLegInstance, field: "endProfit")}</td>
                        
                            <td>${fieldValue(bean: betLegInstance, field: "bet")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${betLegInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

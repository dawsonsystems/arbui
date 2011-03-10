
<%@ page import="arb.Bet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bet.label', default: 'Bet')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'bet.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="start" title="${message(code: 'bet.start.label', default: 'Start')}" />
                        
                            <g:sortableColumn property="end" title="${message(code: 'bet.end.label', default: 'End')}" />
                        
                            <th><g:message code="bet.winningLeg.label" default="Winning Leg" /></th>
                        
                            <th><g:message code="bet.lega.label" default="Lega" /></th>
                        
                            <th><g:message code="bet.legb.label" default="Legb" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${betInstanceList}" status="i" var="betInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${betInstance.id}">${fieldValue(bean: betInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${betInstance.start}" /></td>
                        
                            <td><g:formatDate date="${betInstance.end}" /></td>
                        
                            <td>${fieldValue(bean: betInstance, field: "winningLeg")}</td>
                        
                            <td>${fieldValue(bean: betInstance, field: "lega")}</td>
                        
                            <td>${fieldValue(bean: betInstance, field: "legb")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${betInstanceTotal}" />
            </div>
        </div>
    </body>
</html>


<%@ page import="arb.Bookie" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bookie.label', default: 'Bookie')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'bookie.id.label', default: 'Id')}" />
                        
                            <th><g:message code="bookie.lastTransaction.label" default="Last Transaction" /></th>
                        
                            <g:sortableColumn property="login" title="${message(code: 'bookie.login.label', default: 'Login')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'bookie.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="securityAnswer" title="${message(code: 'bookie.securityAnswer.label', default: 'Security Answer')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bookieInstanceList}" status="i" var="bookieInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bookieInstance.id}">${fieldValue(bean: bookieInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bookieInstance, field: "lastTransaction")}</td>
                        
                            <td>${fieldValue(bean: bookieInstance, field: "login")}</td>
                        
                            <td>${fieldValue(bean: bookieInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: bookieInstance, field: "securityAnswer")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bookieInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

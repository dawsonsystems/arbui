

<%@ page import="arb.Bookie" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bookie.label', default: 'Bookie')}" />
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
            <g:hasErrors bean="${bookieInstance}">
            <div class="errors">
                <g:renderErrors bean="${bookieInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastTransaction"><g:message code="bookie.lastTransaction.label" default="Last Transaction" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookieInstance, field: 'lastTransaction', 'errors')}">
                                    <g:select name="lastTransaction.id" from="${arb.BookieTransaction.list()}" optionKey="id" value="${bookieInstance?.lastTransaction?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="login"><g:message code="bookie.login.label" default="Login" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookieInstance, field: 'login', 'errors')}">
                                    <g:textField name="login" value="${bookieInstance?.login}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="bookie.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookieInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${bookieInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="securityAnswer"><g:message code="bookie.securityAnswer.label" default="Security Answer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookieInstance, field: 'securityAnswer', 'errors')}">
                                    <g:textField name="securityAnswer" value="${bookieInstance?.securityAnswer}" />
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



<%@ page import="arb.Bookie" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bookie.label', default: 'Bookie')}" />
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
            <g:hasErrors bean="${bookieInstance}">
            <div class="errors">
                <g:renderErrors bean="${bookieInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${bookieInstance?.id}" />
                <g:hiddenField name="version" value="${bookieInstance?.version}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="transactions"><g:message code="bookie.transactions.label" default="Transactions" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookieInstance, field: 'transactions', 'errors')}">
                                    
<ul>
<g:each in="${bookieInstance?.transactions?}" var="t">
    <li><g:link controller="bookieTransaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="bookieTransaction" action="create" params="['bookie.id': bookieInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'bookieTransaction.label', default: 'BookieTransaction')])}</g:link>

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

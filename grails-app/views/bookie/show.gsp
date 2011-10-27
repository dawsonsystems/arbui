
<%@ page import="arb.Bookie" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bookie.label', default: 'Bookie')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookie.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookieInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookie.lastTransaction.label" default="Last Transaction" /></td>
                            
                            <td valign="top" class="value"><g:link controller="bookieTransaction" action="show" id="${bookieInstance?.lastTransaction?.id}">${bookieInstance?.lastTransaction?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookie.login.label" default="Login" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookieInstance, field: "login")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookie.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookieInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookie.securityAnswer.label" default="Security Answer" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookieInstance, field: "securityAnswer")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bookie.transactions.label" default="Transactions" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${bookieInstance.transactions}" var="t">
                                    <li><g:link controller="bookieTransaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${bookieInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
            <div class="dialog">
                <g:form method="get" action="addBonus">
                    <g:hiddenField name="id" value="${bookieInstance?.id}" />
                    <label>Add Bonus Amount <input type="text" name="amount"></label>
                    <input type="submit" value="Add"/>
                </g:form>
            </div>
        </div>
    </body>
</html>

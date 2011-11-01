
<%@ page import="arb.BookieTransaction; arb.Bookie" %>
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
        <div id="txList" style="clear:left; padding-top:30px;">
            <h2 style="margin-bottom:10px">Transaction List</h2>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Type</th>
                    <th>In</th>
                    <th>Out</th>
                    <th>Balance</th>
                </tr>
                <g:each in="${BookieTransaction.findAllByBookie(bookieInstance, [sort:'dateCreated', order:'desc'])}">
                <tr>
                    <td>${it.dateCreated}</td>
                    <td>
                        <g:if test="${it.moneyBookersTransaction}">
                            MoneyBookers Transfer
                        </g:if>
                        <g:elseif test="${it.betLeg}">
                            Arb
                        </g:elseif>
                        <g:else>
                            Bonus
                        </g:else>
                    </td>
                    <td><g:formatNumber type="currency" currencyCode="GBP" number="${it.moneyIn}"/></td>
                    <td><g:formatNumber type="currency" currencyCode="GBP" number="${it.moneyOut}"/></td>
                    <td><g:formatNumber type="currency" currencyCode="GBP" number="${it.bookieBalance}"/></td>

                </tr>
                </g:each>
            </table>
        </div>
    </body>
</html>

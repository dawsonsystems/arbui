

<%@ page import="arb.BetLeg" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'betLeg.label', default: 'BetLeg')}" />
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
            <g:hasErrors bean="${betLegInstance}">
            <div class="errors">
                <g:renderErrors bean="${betLegInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${betLegInstance?.id}" />
                <g:hiddenField name="version" value="${betLegInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="output"><g:message code="betLeg.output.label" default="Output" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betLegInstance, field: 'output', 'errors')}">
                                    <g:textField name="output" value="${fieldValue(bean: betLegInstance, field: 'output')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="profit"><g:message code="betLeg.profit.label" default="Profit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betLegInstance, field: 'profit', 'errors')}">
                                    <g:textField name="profit" value="${fieldValue(bean: betLegInstance, field: 'profit')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="totalReturn"><g:message code="betLeg.totalReturn.label" default="Total Return" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betLegInstance, field: 'totalReturn', 'errors')}">
                                    <g:textField name="totalReturn" value="${fieldValue(bean: betLegInstance, field: 'totalReturn')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endProfit"><g:message code="betLeg.endProfit.label" default="End Profit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betLegInstance, field: 'endProfit', 'errors')}">
                                    <g:textField name="endProfit" value="${fieldValue(bean: betLegInstance, field: 'endProfit')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bet"><g:message code="betLeg.bet.label" default="Bet" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betLegInstance, field: 'bet', 'errors')}">
                                    <g:select name="bet.id" from="${arb.Bet.list()}" optionKey="id" value="${betLegInstance?.bet?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bookie"><g:message code="betLeg.bookie.label" default="Bookie" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betLegInstance, field: 'bookie', 'errors')}">
                                    <g:select name="bookie.id" from="${arb.Bookie.list()}" optionKey="id" value="${betLegInstance?.bookie?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="input"><g:message code="betLeg.input.label" default="Input" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betLegInstance, field: 'input', 'errors')}">
                                    <g:textField name="input" value="${fieldValue(bean: betLegInstance, field: 'input')}" />
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

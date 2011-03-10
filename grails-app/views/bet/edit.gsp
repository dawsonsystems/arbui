

<%@ page import="arb.Bet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bet.label', default: 'Bet')}" />
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
            <g:hasErrors bean="${betInstance}">
            <div class="errors">
                <g:renderErrors bean="${betInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${betInstance?.id}" />
                <g:hiddenField name="version" value="${betInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="start"><g:message code="bet.start.label" default="Start" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betInstance, field: 'start', 'errors')}">
                                    <g:datePicker name="start" precision="day" value="${betInstance?.start}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="end"><g:message code="bet.end.label" default="End" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betInstance, field: 'end', 'errors')}">
                                    <g:datePicker name="end" precision="day" value="${betInstance?.end}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="winningLeg"><g:message code="bet.winningLeg.label" default="Winning Leg" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betInstance, field: 'winningLeg', 'errors')}">
                                    <g:select name="winningLeg.id" from="${arb.BetLeg.list()}" optionKey="id" value="${betInstance?.winningLeg?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lega"><g:message code="bet.lega.label" default="Lega" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betInstance, field: 'lega', 'errors')}">
                                    <g:select name="lega.id" from="${arb.BetLeg.list()}" optionKey="id" value="${betInstance?.lega?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="legb"><g:message code="bet.legb.label" default="Legb" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betInstance, field: 'legb', 'errors')}">
                                    <g:select name="legb.id" from="${arb.BetLeg.list()}" optionKey="id" value="${betInstance?.legb?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="totalProfit"><g:message code="bet.totalProfit.label" default="Total Profit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: betInstance, field: 'totalProfit', 'errors')}">
                                    <g:textField name="totalProfit" value="${fieldValue(bean: betInstance, field: 'totalProfit')}" />
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

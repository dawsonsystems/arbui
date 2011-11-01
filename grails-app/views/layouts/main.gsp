<%@ page import="arb.Bookie" %>
<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <style>
          input {
              color:black;
              border: 1px solid black;
          }
          select {
              color:black;
              border: 1px solid black;
          }
        </style>
    </head>
    <body style="color:black">
        <div id="header" style="height:60px; font-size:3em; padding-left:20px;">Arbui</div>
        <div id="menu" style="background: #3a3; color:#fff; font-weight:bolder;  padding: 8px;float:left; width:250px">
            <h3>Totals</h3>
            <table>
                <tr><th>Total Pot Size</th><td><g:formatNumber type="currency" currencyCode="GBP" number="${potSize}"/></td></tr>
                <tr><th>Money Bookers</th><td><g:formatNumber type="currency" currencyCode="GBP" number="${moneybookersTotal}"/></td></tr>
                <tr><th>Current liability</th><td><g:formatNumber type="currency" currencyCode="GBP" number="${liabilities}"/></td></tr>
                <tr><th>1 day profit</th><td><g:formatNumber type="currency" currencyCode="GBP" number="${profit1}"/></td></tr>
                <tr><th>7 day profit</th><td><g:formatNumber type="currency" currencyCode="GBP" number="${profit7}"/></td></tr>
                <tr><th>14 day profit</th><td><g:formatNumber type="currency" currencyCode="GBP" number="${profit14}"/></td></tr>
                <tr><th>30 day profit</th><td><g:formatNumber type="currency" currencyCode="GBP" number="${profit30}"/></td></tr>
            </table>
            <g:link controller="moneyBookersTransaction" action="create" class="create">MoneyBookers TX</g:link>
            <h3 style="margin-top:8px">Bookies</h3>
            <table>
            <g:each in="${Bookie.findAll()}" var="bookie">
                <tr><th><g:link controller="bookie" action="show" id="${bookie.id}">${bookie.name}</g:link></th><td><span style="font-weight: bold"><g:formatNumber type="currency" currencyCode="GBP" number="${bookie.availableBalance}"/></span> <span style="font-size: 0.7em">(<g:formatNumber type="currency" currencyCode="GBP" number="${bookie.lastTransaction?.bookieBalance}"/>)</span></td></tr>
            </g:each>
            </table>
            <g:link controller="bookie" action="create" class="create">Add Bookie</g:link>
        </div>

        <div id="body" style="float:left; margin-left:10px">

            <g:layoutBody />

        </div>
    </body>
</html>
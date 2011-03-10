<%@ page import="arb.Bookie" %>
<html>
<head>
  <title>Welcome to Arbitration Accounts</title>
  <meta name="layout" content="main"/>
</head>
<body>
<div>
  <g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
  </g:if>
  <g:form controller="bet" action="save">
    <h1>Create Arb</h1>
    <table>
    <tr><th></th><th></th><th colspan="3">Leg 1</th><th colspan="3">Leg 2</th></tr>
    <tr><th>Close Date</th><th>Event</th><th>Bookie</th><th>Input</th><th>Profit</th><th>Bookie</th><th>Input</th><th>Profit</th></tr>
    <tr>
      <td><calendar:datePicker name="end" showTime="true" defaultValue="${new Date()}"/></td>
      <td><input type="text" name="event"/></td>
      <td><g:select from="${Bookie.list()}" name="lega.bookie.id" optionKey="id" optionValue="name"/></td>
      <td><input type="text" name="lega.input"/></td>
      <td><input type="text" name="lega.profit"/></td>

      <td><g:select from="${Bookie.list()}" name="legb.bookie.id" optionKey="id" optionValue="name"/></td>
      <td><input type="text" name="legb.input"/></td>
      <td><input type="text" name="legb.profit"/></td>
      <td><input type="submit" value="Record"></td> </tr>
  </table>
  </g:form>
</div>
<hr/>
<br/><br/>
<g:render template="/bet/betList" model="[title:'Arbs To Close', bets:expiredArbs]"/>
<br/><br/>
<g:render template="/bet/betList" model="[title:'Active Arbs', bets:activeArbs]"/>

</body>
</html>

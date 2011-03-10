<fieldset>
  <legend>${title}</legend>
  <table>
    <tr><th colspan="2"></th><th colspan="4">Leg 1</th><th colspan="4">Leg 2</th></tr>
    <tr><th>Close Date</th><th>Event</th><th>Bookie</th><th>Input</th><th>Potential Profit</th><th></th><th>Bookie</th><th>Input</th><th>Potential Profit</th></tr>
    <g:each in="${bets}" var="bet">
      <tr>
        <td>${bet.end}</td><td>${bet.event}</td>
        <td>${bet.lega.bookie.name}</td><td>${bet.lega.input}</td><td>${bet.lega.profit}</td><td><g:form controller="bet" action="legWon" id="${bet.lega.id}"><input type="submit" value="Leg Won"></g:form></td>
        <td>${bet.legb.bookie.name}</td><td>${bet.legb.input}</td><td>${bet.legb.profit}</td><td><g:form controller="bet" action="legWon" id="${bet.legb.id}"><input type="submit" value="Leg Won"></g:form></td>
      </tr>
    </g:each>
  </table>
</fieldset>

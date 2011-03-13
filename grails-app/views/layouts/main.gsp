<html>
<head>
  <title><g:layoutTitle default="Grails"/></title>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <style type="text/css">

  #nav {
    margin-top: 20px;
    margin-left: 30px;
    width: 228px;
    float: left;

  }

  .homePagePanel * {
    margin: 0px;
  }

  .homePagePanel .panelBody ul {
    list-style-type: none;
    margin-bottom: 10px;
  }

  .homePagePanel .panelBody h1 {
    text-transform: uppercase;
    font-size: 1.1em;
    margin-bottom: 10px;
  }

  .homePagePanel .panelBody {
    background: url(/arb/images/leftnav_midstretch.png) repeat-y top;
    margin: 0px;
    padding: 15px;
  }

  .homePagePanel .panelBtm {
    background: url(/arb/images/leftnav_btm.png) no-repeat top;
    height: 20px;
    margin: 0px;
  }

  .homePagePanel .panelTop {
    background: url(/arb/images/leftnav_top.png) no-repeat top;
    height: 11px;
    margin: 0px;
  }

  h2 {
    margin-top: 15px;
    margin-bottom: 15px;
    font-size: 1.2em;
  }

  #pageBody {
    margin-left: 280px;
    margin-right: 20px;
  }
  </style>
  <g:layoutHead/>
  <g:javascript library="application"/>
  <calendar:resources lang="en" theme="tiger"/>
</head>
<body>
<div id="nav" style="position:absolute; top:10px; left:10px">
  <div class="homePagePanel">
    <div class="panelTop"></div>
    <div class="panelBody">
      <h1>Totals</h1>
      <table>
        <tr><th>Moneybookers</th><td>&pound;${moneybookersTotal}</td></tr>
        <tr><th>Pot Size</th><td>&pound;${potSize}</td></tr>
        <tr><th>Current Liabilities</th><td>&pound;${liabilities}</td></tr>
        <tr><th>30 day profit</th><td>&pound;${profit30}</td></tr>
        <tr><th>2 week profit</th><td>&pound;${profit14}</td></tr>
        <tr><th>Week profit</th><td>&pound;${profit7}</td></tr>
      </table>

      <br/><h1>Bookie Totals</h1>
      <table>
        <g:each in="${arb.Bookie.list().sort{ it.name }}">
          <tr><th>${it.name}</th><td>&pound;${it.lastTransaction?.bookieBalance}</td></tr>
        </g:each>
      </table>
      
      <hr style="margin-top:15px; margin-bottom:6px;"/>
      <h1>Actions</h1>
      <hr/>
      <span class="menuButton"><g:link class="list" controller="moneyBookersTransaction" action="create">Moneybookers TX</g:link></span>
      <hr style="margin-top:5px;margin-bottom:5px;"/>
      <span class="menuButton"><g:link class="create" controller="bookie" action="create">Create new Bookie</g:link></span>
    </div>
    <div class="panelBtm"></div>
  </div>
</div>
<div style="position:absolute; left:320px; top:50px; width:1000px;">
<g:layoutBody/>
</div>
</body>
</html>

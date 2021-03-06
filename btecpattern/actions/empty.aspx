<%@ Page Language="C#" ContentType="text/html" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.IO" %>
<html>
  <head>
    <title>Pearson Content Management</title>
    <!--<link rel="stylesheet" type="text/css" href="../css/common.css"/>-->

    <%  if (File.Exists(Server.MapPath("/Xopus/xopus/xopus.js"))) {  %>
      <script type="text/javascript" src="/Xopus/xopus/xopus.js"></script>
    <% } else { %>
      <script type="text/javascript" src="/Xopus/opus/xopus.js"></script>
    <% } %>
    <script type="text/javascript">
      function doload()
      {
        //tell xopus what to do when exiting
        if(parent.Editor)
          parent.Editor.setExitFunction(exitFunction);

        function exitFunction()
        {
          if(confirm("Are you sure you want to quit?"))
            parent.parent.document.location.href = parent.parent.document.location.href.replace("actions/frame","actions/frame");         }
      }
    </script>
  </head>
  <body onload="doload()">
    <div style="margin-top:8em;color:#888888;">
      <center>
        <h1 style="color:#888888;">Xopus is loaded</h1>
        <p>There is currently no document loaded in Xopus however.</p>
        <p>To start editing choose from the Document menu to create or open documents.</p>
      </center>
    </div>
  </body>
</html>

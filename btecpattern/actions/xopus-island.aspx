<%@ Page Language="C#" ValidateRequest="false" %>
<%
  String changeTracking = "true";
  if (Request["changetracking"] != null)
    changeTracking = Request["changetracking"];

  String username = HttpContext.Current.User.Identity.Name;
	if (username == null) {
		username = "Anonymous";
	} 
%>
  
<%--
	if (Request["username"] == null {
		username = "Anonymous";
	} else {
		username = Request["username"];
	}
--%>
<html>
  <head>
	<title>Pearson Content</title>
    <!--<link rel="stylesheet" type="text/css" href="../css/common.css"/>-->
	
    <!-- Start Xopus -->
    <link rel="stylesheet" type="text/css" href="../css/wysiwyg.css"/>
    <link rel="stylesheet" type="text/css" href="../css/tagson.css"/>
    <!-- Start Xopus (only needed when Xopus is not started directly) -->
    <script type="text/javascript" src="../../Xopus/xopus/xopus.js"></script>
  </head>
  <body>
    <!-- The Xopus Canvas -->
    <div xopus="true" autostart="true">
      <xml>
        <x:config version="1.0" xmlns:x="http://www.xopus.com/xmlns/config">
          <!-- Register the save.js script. -->
          <x:javascript src="../js/save.js"/>
          
		  <x:javascript>Editor.SpellChecking.addPersonalWords("en-gb", ["Xopus", "wysiwyg"]);</x:javascript>

          <!-- Register the editing.js script. -->
          <x:javascript src="../js/editing.js"/>

          <!-- Here we pass the fileId parameter to LoadXml.aspx. -->
          <x:pipeline xml="load-xml.aspx?fileId=<%= Request["fileId"] %>" xsd="../xsd/btec_schema.xsd">
            <x:view name="WYSIWYG View">
              <x:transform xsl="../xsl/btec_stylesheet.xsl" />
            </x:view>
            <x:view name="Tags On View">
              <x:transform xsl="../xsl/tagson.xsl"/>
            </x:view>			
            <x:view name="Xml View">
              <x:treeTransform />
            </x:view>
          </x:pipeline>
          <% if (changeTracking == "true"){ %>
          <x:javascript>Editor.ChangeTracking.setUserName("<%= username %>");</x:javascript>
          <%} %>          
          <!-- import a configuration file -->
          <x:import src="../config/config.xml"/>
          <!-- import a toolbar configuration file -->
          <x:import src="../config/toolbar.xml"/>
          <!-- Register the toolbar commands.js script. -->
          <x:javascript src="../config/commands.js"/>
          
        </x:config>		
      </xml>
    </div>
  </body>
</html>

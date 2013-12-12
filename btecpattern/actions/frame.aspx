<%@ Page Language="C#" ContentType="text/html" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Xml" %>

<%
  String username = HttpContext.Current.User.Identity.Name;
  if (username == null)
    username = "Anonymous";

   String authtoken = "";
   if (Request.Cookies["pearsonCMS"] != null)
   {
      if (Request.Cookies["pearsonCMS"]["alf_ticket"] != null)
      { 
        authtoken = Request.Cookies["pearsonCMS"]["alf_ticket"]; 
      }
   }
%>

<%
    String path = HttpContext.Current.Server.MapPath("..") +"/xml/";
    DirectoryInfo documentationInfo = new DirectoryInfo(path);
    FileInfo[] files = documentationInfo.GetFiles(); 
%>  

<html>
<head>
    <title>Pearson Content Management</title>
    <style type="text/css">
        .linearBg {
          /* fallback */
          background-color: #007D54;
          background-repeat: repeat-y;

          /* Safari 4-5, Chrome 1-9 */
          background: -webkit-gradient(linear, left top, right top, from(#007D54), to(#F8F8F8));

          /* Safari 5.1, Chrome 10+ */
          background: -webkit-linear-gradient(left, #007D54, #F8F8F8);

          /* Firefox 3.6+ */
          background: -moz-linear-gradient(left, #007D54, #F8F8F8);

          /* IE 10 */
          background: -ms-linear-gradient(left, #007D54, #F8F8F8);

          /* Opera 11.10+ */
          background: -o-linear-gradient(left, #007D54, #F8F8F8);
        }

        .navbar-override {
        position: relative;
        z-index: 1000;
        min-height: 50px;
        margin-bottom: 0px;
        border: 0px solid transparent;
        }

        nav.navbar-default .navbar-nav li.logoff a {
          color: #333 ;
        }

        nav.navbar-default .navbar-nav > li > a {
          color: #ffffff;
        }
        nav.navbar-default .navbar-nav > li > a i {
        font-size: 14px;
        }

        nav.navbar-default .navbar-nav > .dropdown > a .caret {
          border-bottom-color: #FFFFFF;
          border-top-color: #FFFFFF;
        }

    </style>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" type="text/css" href="../css/font-awesome/css/font-awesome.min.css">	
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-multiselect.css">	
	<script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/frame.js"></script>
	<script type="text/javascript" src="../js/bootstrap-multiselect.js"></script>
</head>
<body>

	
        <!-- New Document Modal -->
      <!-- #include file ="frame_newFileModal.aspx" -->


        <!-- SaveAs Document Modal -->
      <!-- #include file ="frame_saveAsFileModal.aspx" -->

		
        <!-- Open File Modal -->
      <!-- #include file ="frame_openFileModal.aspx" -->

		

        <!-- Open Document Modal -->
      <!-- #include file ="frame_openDocumentModal.aspx" -->



    <nav class="navbar-override navbar-default linearBg" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">        
            <img src="../css/logo.png" height="50" />
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar">New</span>
                <span class="icon-bar">Open</span>
                <span class="icon-bar">Save</span>
            </button>
        </div>



        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-folder-close"></i> Document <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" data-toggle="modal" data-target="#newFileModal" data-id="Create New Document">New</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#openFileModal">Open File</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#openDocumentModal">Open Document</a></li>
<!--                         <li><a href="#" data-toggle="modal" data-target="#newFileModal" data-id="Save">Save</a></li>                        
                        <li><a href="#" data-toggle="modal" data-target="#saveAsFileModal" data-id="Save As Document">Save As</a></li> -->
                        <li><a href="#" onclick="closeDocument()">Close</a></li>
                        <li role="presentation" class="divider"></li>
                        <li><a href="#">Edit</a></li>
                        <li><a href="#">Duplicate</a></li>
                        <li><a href="#">Unlock</a></li>
                        <li><a href="#">Delete</a></li>
                        <li role="presentation" class="divider"></li>
						<li role="presentation"><a onclick="return setView('Print preview');" role="menuitem" tabindex="-1" href="#"><i class="icon-print"></i> Print preview</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="icon-download-alt"></i> Download</a></li>
                    </ul>
                </li>
                <li><a href="#" onclick="return setView('WYSIWYG View');"><i class="icon-picture"></i> WYSIWYG View</a></li>
                <li><a href="#" onclick="return setView('Xml View');"><i class="icon-code"></i> XML View</a></li>				
                <li><a href="#" onclick="return setView('Print preview');"><i class="icon-print"></i> Print preview</a></li>				
            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" size="30" class="form-control" placeholder="Enter keywords">
                </div>
                <button type="submit" class="btn btn-default"><i class="icon-search"></i></button>
            </form>
            <ul class="nav navbar-nav navbar-right">

                <% if (authtoken.Equals("FAIL")) { %>
                    <!-- <li class="disabled"><a href="#" style="color:#FF99CC"><i class="icon-exclamation-sign"></i> Alfresco authentication failed</a></li> -->
                <% } else { %>
                    <li class="disabled"><a href="#"> <%= authtoken %></a></li>
                <% } %>

                <li class="logoff"><a href="#"><i class="icon-user"></i> <%= username %></a></li>
                <li class="logoff"><a href="login.aspx?logoff=true">Logoff <i class="icon-signout"></i></a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
    <!--<iframe name="navigation" id="frame" style="border-right: solid 1px gray;" frameborder="0" width="20%" height="100%" src="navigation.aspx"></iframe>-->
    <iframe id="xopusFrame" style="position: absolute; width: 100%; border-left: solid 1px lightgrey;" frameborder="0" width="80%" height="100%" src="empty.aspx"></iframe>
</body>
</html>

    <%--<iframe name="navigation" id="Iframe1" style="border-right: solid 1px gray;" frameborder="0" width="20%" height="100%" src="http://localhost:8080/alfresco/service/folder/Company%20Home/Sites/btec/documentLibrary"></iframe>--%>

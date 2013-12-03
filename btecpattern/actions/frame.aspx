<%@ Page Language="C#" ContentType="text/html" %>

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
        border: 1px solid transparent;
        }

        nav.navbar-default .navbar-nav li.logoff a {
          color: #333 ;
          font-weight: bold;
        }

        nav.navbar-default .navbar-nav > li > a {
          color: #ffffff;
          font-weight: bold;
        }
        nav.navbar-default .navbar-nav > li > a i {
        font-size: 20px;
        }

        nav.navbar-default .navbar-nav > .dropdown > a .caret {
          border-bottom-color: #FFFFFF;
          border-top-color: #FFFFFF;
        }

    </style>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="../css/font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  <script type="text/javascript" src="../js/frame.js"></script>
</head>
<body>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>


        <!-- Modal -->
        <div class="modal fade" id="newFileModal" tabindex="-1" role="dialog" aria-labelledby="newFileModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Create New Document</h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                    <label for="newFileName">Document Name</label>
                    <input type="email" class="form-control" id="newFileName" placeholder="Enter document name">
                </div>      
            </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="newDocument();">OK</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->



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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Document <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" data-toggle="modal" data-target="#newFileModal">New</a></li>
                        <li><a href="#">Open</a></li>
                        <li role="presentation" class="divider"></li>
                        <li><a href="#">Edit</a></li>
                        <li><a href="#">Duplicate</a></li>
                        <li><a href="#">Unlock</a></li>
                        <li><a href="#">Delete</a></li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Download</a></li>
                    </ul>
                </li>
                <li><a href="#" onclick="return setView('WYSIWYG View');"><i class="icon-file-text"></i> WYSIWYG View</a></li>
                <li><a href="#" onclick="return setView('Xml View');"><i class="icon-code"></i> XML View</a></li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">

                <% if (authtoken.Equals("FAIL")) { %>
                    <!-- <li class="disabled"><a href="#" style="color:#FF99CC"><i class="icon-exclamation-sign"></i> Alfresco authentication failed</a></li> -->
                <% } else { %>
                    <li class="disabled"><a href="#"> <%= authtoken %></a></li>
                <% } %>

                <li class="active"><a href="#"><i class="icon-user"></i> <%= username %></a></li>
                <li class="logoff"><a href="login.aspx?logoff=true">Logoff <i class="icon-signout"></i></a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
    <iframe name="navigation" id="frame" style="border-right: solid 1px gray;" frameborder="0" width="20%" height="100%" src="navigation.aspx"></iframe>
    <iframe id="xopusFrame" style="position: absolute; width: 80%; border-left: solid 1px lightgrey;" frameborder="0" width="80%" height="100%" src="empty.aspx"></iframe>
</body>
</html>

    <%--<iframe name="navigation" id="Iframe1" style="border-right: solid 1px gray;" frameborder="0" width="20%" height="100%" src="http://localhost:8080/alfresco/service/folder/Company%20Home/Sites/btec/documentLibrary"></iframe>--%>

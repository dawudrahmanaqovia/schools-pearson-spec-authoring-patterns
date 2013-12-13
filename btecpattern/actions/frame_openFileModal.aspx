        <div class="modal fade" id="openFileModal" tabindex="-1" role="dialog" aria-labelledby="openFileModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="openFileModalLabel">Open File</h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                    <label for="openFileInputTextbox">Filename</label>
                    <input type="text" class="form-control" id="openFileInputTextbox">
		
<!-- <table class="table table-bordered" id="openFileTable"> -->
  <select id="openFileSelect" size="10" class="form-control"> 
  <!-- <tr><th>Filename</th></tr> -->
<% 
	foreach (FileInfo file in files)
	{
	XmlDocument doc = new XmlDocument();
	doc.Load(Server.MapPath("..")+"/xml/" + file.Name);
	String title = file.Name; //"<span style='color:gray;'>(New Document)</span>";
	//if (doc.SelectSingleNode("//meta/unit_title[1]").InnerText != "")
	  //title = doc.SelectSingleNode("//meta/unit_title[1]").InnerText;
%>
	 <!--  <tr><td><a href="#" id="<%= file.Name %>"><%= file.Name %></a></td><tr> -->
    <option value="<%= file.Name %>"><%= file.Name %></option>
<%
	} 
%>					
<!-- </table> -->
</select>

					
                </div> 
            </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="openFileButton" onclick="openFile();">OK</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->		
        <!-- Open Document Modal -->
        <div class="modal fade" id="openDocumentModal" tabindex="-1" role="dialog" aria-labelledby="openDocumentModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="openDocumentModalLabel">Open Document</h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                    <label for="openDocumentName">Document Name</label>
                    <input type="text" class="form-control" id="openDocumentName" placeholder="Select document ">

<div class="well"> 
          <select id="documentlist" multiple="multiple" class="form-control">
<% 
  foreach (FileInfo file in files)
  {
  XmlDocument doc = new XmlDocument();
  doc.Load(Server.MapPath("..")+"/xml/" + file.Name);
  String title = file.Name; //"<span style='color:gray;'>(New Document)</span>";
  //if (doc.SelectSingleNode("//meta/unit_title[1]").InnerText != "")
    //title = doc.SelectSingleNode("//meta/unit_title[1]").InnerText;

    Response.Write("<option>" + file.Name + "</option>");
  } 
%>          
          </select> 
</div>  
          
                </div>      
            </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="openDocument();">OK</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->   
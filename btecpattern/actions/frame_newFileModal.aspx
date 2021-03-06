        <!-- New Document Modal -->
        <div class="modal fade" id="newFileModal" tabindex="-1" role="dialog" aria-labelledby="newFileModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="newFileModalLabel">Create New Document</h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                    <label for="newFileInputTextbox">New Document</label>
                    <input type="text" class="form-control" id="newFileInputTextbox" placeholder="Enter document name">
                </div>      
            </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="newFileButton" onclick="newDocument();">OK</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
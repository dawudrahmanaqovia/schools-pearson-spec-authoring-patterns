
function newDocument(url)
{
  //test if the editor is loaded
  var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
  if(editor)  
  {
    //create and load the new document
    editor.setURL(url);
    //reload navigation
    document.location.reload();
  }
  return false;
}

function deleteDocument()
{
  //test if the editor is loaded
  var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
  if(editor)  
  {
    //delete document
    var uri = editor.getActiveDocument().getDocumentURI();
    uri = uri.substring(0,uri.indexOf("actions"));
    editor.setURL(uri + "actions/empty.aspx");
    //reload navigation
    document.location.reload();
  }
  return false;
}


function exitFromNavigation()
{
  //test if the editor is loaded
  var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
  if(editor)
  {
    //exit xopus
    editor.exit();    
  }
  return false;
}


function openDocument(url)
{
  //test if the editor is loaded
  var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
  if(editor)
  {
    //open another file
    editor.setURL(url);
  }
  return false;
}

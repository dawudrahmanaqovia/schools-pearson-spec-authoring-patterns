function newDocument() {
	var newfilename = document.getElementById("newFileName").value;
	console.log(newfilename);
	$('#newFileModal').modal('hide');
	//window.location.href("new-document.aspx?id="+newfilename);

	//test if the editor is loaded
	var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
	if(editor)  
	{
	//create and load the new document
	editor.setURL("new-document.aspx?id="+newfilename);
	//reload navigation
	document.location.reload();
	}
	return false;	
};

function setView(name)
{
  var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
  if(editor)
  {
    //get the canvas 
    var canvas = editor.Canvas.getCanvasCollection()[0];
    //change the view 
    if(canvas)
      canvas.setActiveView(name);
  }
  return false;
}
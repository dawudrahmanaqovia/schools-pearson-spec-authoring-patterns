$(document).ready(function() {
	$('#documentlist').multiselect({
		includeSelectAllOption: false,
		enableFiltering: true,
		maxHeight: 350,
		buttonClass: 'btn-primary btn-lg',
		buttonContainer: '<div class="form-group">',
		onChange: function(options, select) {
		    var label = '';
		    options.each(function() {
		      var label = ($(this).attr('label') !== undefined) ? $(this).attr('label') : $(this).html();
				console.log(label);
				$('#openFileName').val(label);
		    });
		}
	});
});

function newDocument() {
	var newfilename = document.getElementById("newFileName").value;
	console.log(newfilename);
	$('#newFileModal').modal('hide');
	
	//test if the editor is loaded
	var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
	if(editor)  
	{
	//create and load the new document
	editor.setURL("/actions/new-document.aspx?fileId="+newfilename);
	//reload navigation
	//document.location.reload();
	}
	return false;	
};

function openDocument()
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

$(document).ready(function() {


/*
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
*/	
	$('#newFileButton').attr('disabled',true);
    $('#newFileInputTextbox').keyup(function(){
        if($(this).val().length !=0){
            $('#newFileButton').attr('disabled', false);
        }
        else
        {
            $('#newFileButton').attr('disabled', true);        
        }
    });	

/*	
    $('#saveAsFileInputTextbox').keyup(function(){
        if($(this).val().length !=0){
            $('#saveAsFileButton').attr('disabled', false);
        }
        else
        {
            $('#saveAsFileButton').attr('disabled', true);        
        }
    });	
*/

    $('#openFileButton').attr('disabled',true);
    $('#openFileInputTextbox').keyup(function(){
        if($(this).val().length !=0){
            $('#openFileButton').attr('disabled', false);
        }
        else
        {
            $('#openFileButton').attr('disabled', true);        
        }
    });
	$('#openFileSelect').change(function(){
		$('#openFileButton').attr('disabled', false);
		var val = $("#openFileSelect option:selected").val();
		$('#openFileInputTextbox').val(val);
	});
	
	
	// This is for Select input filters
	jQuery.fn.filterByText = function(textbox) {
		return this.each(function() {
			var select = this;
			var options; //= [];
			$(select).find('option').each(function() {
				options.push({value: $(this).val(), text: $(this).text()});
			});
			$(select).data('options', options);

			$(textbox).bind('change keyup', function() {
				var options = $(select).empty().data('options');
				var search = $.trim($(this).val());
				var regex = new RegExp(search,"gi");

				$.each(options, function(i) {
					var option = options[i];
					if(option.text.match(regex) !== null) {
						$(select).append(
							$('<option>').text(option.text).val(option.value)
						);
					}
				});
			});
		});
	};

    $('select').filterByText($('input'));

	
});


function newDocument() {
	var newfilename = document.getElementById("newFileInputTextbox").value;
	console.log(newfilename);
	$('#newFileModal').modal('hide');
	
	//test if the editor is loaded
	var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
	if(editor)  
	{
	//create and load the new document
	editor.setURL("/actions/new-document.aspx?fileId="+newfilename);	
	$(document).attr("title", newfilename);
	}
	return false;	
};


function saveAsDocument() {
	var newfilename = document.getElementById("saveAsFileInputTextbox").value;
	console.log(newfilename);
	$('#saveAsFileModal').modal('hide');
	
	//test if the editor is loaded
	var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
	if(editor)  
	{
	//create the new document
	editor.setURL("/actions/save-xml.aspx?fileId="+newfilename);
	}
	return false;	
};


function openFile()
{
	var filename = document.getElementById("openFileInputTextbox").value;
	console.log(filename);
	$('#openFileModal').modal('hide');
	
	//test if the editor is loaded
	var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
	if(editor)  
	{
	//create and load the new document
	editor.setURL("/actions/xopus-island.aspx?fileId="+filename);
	$(document).attr("title", filename);
	}
	return false;	
}


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


function closeDocument()
{
  //test if the editor is loaded
  var editor = parent.document.getElementById('xopusFrame').contentWindow.Editor
  if(editor)
  {
    //exit xopus
    //reload navigation
    document.location.reload()	
    //editor.exit();    
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

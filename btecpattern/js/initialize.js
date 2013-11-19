$(document).ready(function () {
    $(".icon-question-sign").popover({
        placement : 'auto right',
		container: 'body'
    });
});

function add_button(element, node)
{

//alert(node.getFirstChild().getNodeName() + " - " + element);

var document = node.getOwnerDocument();
var newnode = document.createElement(node.getFirstChild().getNodeName());
//document.getDocumentElement().appendChild(newnode);


var firstChild = document.getDocumentElement().getFirstChild();

//document.getDocumentElement().insertNear(newnode, node.getParentNode());

alert(node);
node.insertNear(newnode, node.getParentNode());
alert(node);
}

function remove_button(element, node)
{

alert(node.getNodeName());

}

function insert_menu(element, node) 
{
  //container is the div from the XSL, we will be using it as a container
  var container = element.parentNode;  
  
  //hide the button that was clicked to show this menu
  container.className = "dontShowMenuButton";

      alert(node.getNodeName());

  //get a list of allowed children for the node that was passed
  var childNodeTypes = node.getAllowedChildren();
  if (childNodeTypes.getLength() < 1) 
  {
    alert("No allowed children!");
    return false; 
  }

  //create a menu
  var menu = document.createElement("div");
  for (i=0; i < childNodeTypes.getLength(); i++) 
  {
    var buttonElement = document.createElement("button");

    //get the name of the allowed Node
    var nodeName = childNodeTypes.getName(i);
    
    //assign a function to onclick 
    buttonElement.onclick = get_insert_node_function(buttonElement, node, nodeName);
    
    buttonElement.setAttribute("align", "left");
    
    //create a label for the button
    var label = document.createTextNode("Insert "+nodeName)
    buttonElement.appendChild(label);
    
    menu.appendChild(buttonElement); 
  }
    
  //insert the menu div to the container, making it visible
  container.appendChild(menu);

  return true; 
}

//this function returns a function, 
//thus allowing the scope of each of the parameters to be correct when the button
//is clicked
function get_insert_node_function(buttonElement, xopusNode, nodeName) 
{
   return function(){insert_node(buttonElement, xopusNode, nodeName)}; 
}


function insert_node(element, node, nodename) 
{
  var xopusDoc = node.getOwnerDocument();
  var newNode = xopusDoc.createElement(nodename);
  var result = node.appendChild(newNode);
  node.makeComplete();
  
  // find the container again
  var container = element.parentNode.parentNode;
  
  //show the original button
  container.className = "showMenuButton";

  //remove the menu
  container.removeChild(element.parentNode);
  return true ; 
}

//wrap the insert_node function, it will be executed asynchronously
insert_node = Editor.wrapInTransaction(insert_node); 



function lookup(type, node)
{
  var parent = document.getElementById('thingsarelookingup');
  
  parent.style.display = 'block';
  
  var xml = HTTPTools.getXML("/inlinelookup/"+type);
  
  var things = xml.documentElement.childNodes;
  for (var i=0; i<things.length; i++) 
  {
    var el = document.createElement("li");
    var value = things[i].text;
    el.attachEvent("onclick",createClickHandler(node, value)); 
    parent.appendChild(el);
  }
}

function createClickHandler(node, value)
{
  return function(){node.setAttribute('id',value);}
}
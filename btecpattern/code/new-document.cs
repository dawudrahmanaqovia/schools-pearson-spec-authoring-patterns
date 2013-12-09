using System;
using System.Web;
using System.Xml;

public partial class LoadXml : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        XmlDocument newDoc = new XmlDocument();
        newDoc.Load(Server.MapPath("..") + "/xml/template.xml");		
        //newDoc.LoadXml("<article xml:lang=\"en-us\"><title></title><paragraph></paragraph></article>");
        
        //figure out a number for the file
        //Int32 lastId = Int32.Parse(Request.QueryString["id"].ToString());
        //lastId = lastId+1;
		//String fileId = (Request.QueryString["id"].ToString()) + ".xml";
		//string fileId = (Request.QueryString["fileId"].ToString()) + ".xml";
		string fileId = Request["fileId"] + ".xml";

        //String fileId = "doc_" + string.Format("{0:yyMMddHHmmss}",DateTime.Now) +".xml";  	

        //save the xml document
        newDoc.Save(Server.MapPath("../xml/" +fileId));
        
        //redirect to the island to start editing the file
        Response.Redirect("xopus-island.aspx?fileId="+fileId);
		
        // Load and send the XML. .NET will handle Unicode transcoding for us.
        // This code would typically interact with some sort of database.
        XmlDocument documentToLoad = new XmlDocument();
        documentToLoad.Load(Server.MapPath("../xml/" + fileId));
        Response.Write(documentToLoad.OuterXml);		
    }
}

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
		String name = (Request.QueryString["id"].ToString()) + ".xml";

        //String name = "doc_" + string.Format("{0:yyMMddHHmmss}",DateTime.Now) +".xml";  	

        //save the xml document
        newDoc.Save(Server.MapPath("")+"/../xml/"+name);
        
        //redirect to the island to start editing the file
        Response.Redirect("xopus-island.aspx?fileId="+name);
    }
}

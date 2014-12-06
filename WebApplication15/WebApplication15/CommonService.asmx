<%@ WebService Language="C#" Class="CommonService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script;
using System.Data;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Text;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.IO;

[WebService(Namespace = "http:www.itdoseinfo.com/2012/11/17")]
[WebServiceBinding(ConformsTo = WsiProfiles.None)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
[ScriptService]
public class CommonService : System.Web.Services.WebService
{

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public string GetData()
    {
        MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"]);
        MySqlDataAdapter da = new MySqlDataAdapter(" SELECT Investigation_ID,NAME FROM investigation_master limit 25 ", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return Newtonsoft.Json.JsonConvert.SerializeObject(dt);
    }
    [WebMethod]
    public string GetDataTempData()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("name");
        dt.Columns.Add("category");
        dt.Columns.Add("price");
        DataRow drow = dt.NewRow();
        drow["name"] = "Pankaj";
        drow["category"] = "Rawat";
        drow["price"] = "10000000";
        dt.Rows.Add(drow);
        return Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        //return "[{'name':'Pankaj','category':'Rawat','price':100},{'name':'Plum','category':'Fruits','price':0.75},{'name':'Donut','category':'Bread','price':1.5},{'name':'Milk','category':'Dairy','price':4.50}]";
    }
    
    [WebMethod]
    public string SaveData(List<Investigation> Inv)
    {
        int length = Inv.Count;
        return "1";
    }
    
    
    
}
public class Investigation
{
    public string Itemid { get; set; }
    public string Itemname { get; set; }
    public string Rate { get; set; }
    public string Qty { get; set; }
    public string Amount { get; set; }
}
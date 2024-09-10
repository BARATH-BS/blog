using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Web.UI.HtmlControls;

namespace blog
{
	public partial class edidgrid : System.Web.UI.Page
	{
		string SqlConn = ConfigurationManager.ConnectionStrings["blog"].ConnectionString;


		protected void Page_Load(object sender, EventArgs e)
		{

		}


		protected void btnlogin_Click(object sender, EventArgs e)
		{
			HtmlInputText user = (HtmlInputText)FindControl("user");
			HtmlInputText pass = (HtmlInputText)FindControl("pass");


			string usertext = user.Value;
			string passtext = pass.Value;
			if (!usertext.Equals("") && !passtext.Equals(""))
			{
				SqlConnection con = new SqlConnection(SqlConn);

				con.Open();
				string que = "select * from Register where id='" + usertext + "' and password='" + passtext + "'";
				SqlCommand cmd = new SqlCommand(que, con);
				SqlDataAdapter adapter = new SqlDataAdapter(cmd);
				DataTable ds = new DataTable();
				adapter.Fill(ds);
				string result = ds.Rows.ToString();
				if (ds.Rows.Count != 0)
				{
					Session["idsd"] = usertext;
					Response.Redirect("blog.aspx");

				}
				else
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Username and Password...!')", true);
					pass.Value = string.Empty;
				}
			}
			else
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter all fields...!')", true);
			}

		}

		protected void reg_Click(object sender, EventArgs e)
		{

			HtmlInputText username = (HtmlInputText)FindControl("Username");
			HtmlInputText useid = (HtmlInputText)FindControl("Userid");
			HtmlInputText pass = (HtmlInputText)FindControl("Password");
			HtmlInputText dept = (HtmlInputText)FindControl("Department");
			HtmlInputText moblno = (HtmlInputText)FindControl("moblnum");
			HtmlInputText mail = (HtmlInputText)FindControl("email");


			string username1 = username.Value;
			string useid1 = useid.Value;
			string pass1 = pass.Value;
			string dept1 = dept.Value;
			string moblno1 = moblno.Value;
			string email1 = mail.Value;

			if (!username1.Equals("") && !useid1.Equals("") && !pass1.Equals("") && !dept1.Equals("") && !moblno1.Equals("") && !email1.Equals(""))
			{
				SqlConnection con = new SqlConnection(SqlConn);
				con.Open();
				string que = "select * from Register where id='" + useid1 + "'";
				SqlCommand cmd = new SqlCommand(que, con);
				SqlDataAdapter adapter = new SqlDataAdapter(cmd);
				DataTable ds = new DataTable();
				adapter.Fill(ds);
				string result = ds.Rows.ToString();
				if (ds.Rows.Count == 0)
				{

					SqlConnection con1 = new SqlConnection(SqlConn);
					con1.Open();
					string que1 = "insert into Register(name,id,password,dept,mobilenumber,email) values('" + username1 + "','" + useid1 + "','" + pass1 + "','" + dept1 + "' ,'" + moblno1 + "','" + email1 + "')";
					SqlCommand cmd1 = new SqlCommand(que1, con1);
					cmd1.ExecuteNonQuery();
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Register sucess...!')", true);
					username.Value = string.Empty;
					useid.Value = string.Empty;
					pass.Value = string.Empty;
					dept.Value = string.Empty;
					moblno.Value = string.Empty;
					mail.Value = string.Empty;

				}
				else
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Already exits id please try agin...!')", true);
					
				}



				
			}
			else
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter all fields...!')", true);
			}

		}
	}
}
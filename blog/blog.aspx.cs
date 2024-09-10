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
	public partial class WebForm1 : System.Web.UI.Page
	{
		string empid = "";
		string SqlConn = ConfigurationManager.ConnectionStrings["blog"].ConnectionString;
		protected void Page_Load(object sender, EventArgs e)
		{
			string id = Request.QueryString["id"];
			string name = Request.QueryString["name"];
			if (!IsPostBack)
			{

				DateTime currentdate = DateTime.Now;
				date.Text = currentdate.ToString("dd-MM-yyyy");
				if (!string.IsNullOrEmpty(id) && !string.IsNullOrEmpty(name))
				{
					using (SqlConnection con1 = new SqlConnection(SqlConn))
					{
						con1.Open();
						string que1 = "SELECT * FROM createblog WHERE title = @name";
						SqlCommand cmd1 = new SqlCommand(que1, con1);
						cmd1.Parameters.AddWithValue("@name", name);

						using (SqlDataReader reader = cmd1.ExecuteReader())
						{
							if (reader.Read())
							{
								string titleid = reader["title"].ToString();
								string datesid = reader["dates"].ToString();
								string contentid = reader["contents"].ToString();

								title.Text = titleid;
								date.Text = datesid;
								content.Text = contentid;
								Button3.Visible = false;
							}
							else
							{
								// Handle the case when no matching record is found
							}
						}
					}
				}
			}
			empid = (string)Session["idsd"];

			

			


		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			if (!title.Equals("") || !content.Equals(""))
			{


				string id = Request.QueryString["id"];
				string name = Request.QueryString["name"];

				if (!string.IsNullOrEmpty(id) && !string.IsNullOrEmpty(name))
				{
					SqlConnection con1 = new SqlConnection(SqlConn);
					con1.Open();

					string que1 = "UPDATE createblog SET dates = '" + date.Text + "', title = '" + title.Text + "', contents = '" + content.Text + "' WHERE title = '" + name + "'";
					SqlCommand cmd1 = new SqlCommand(que1, con1);
					cmd1.ExecuteNonQuery();

					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('modify sucess...!')", true);
					title.Text = "";
					content.Text = "";

				}
				else
				{
					SqlConnection con1 = new SqlConnection(SqlConn);
					con1.Open();

					string que1 = "insert into createblog(dates,title,contents,id) values('" + date.Text + "','" + title.Text + "','" + content.Text + "','" + empid + "')";
					SqlCommand cmd1 = new SqlCommand(que1, con1);
					cmd1.ExecuteNonQuery();

					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('submited sucess...!')", true);
					title.Text = "";
					content.Text = "";
				}

			}
			else
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter fields...!')", true);
			}
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			Response.Redirect("afterlogin.aspx");
		}

		protected void Button3_Click(object sender, EventArgs e)
		{
			Response.Redirect("modify.aspx");
		}
	}
}
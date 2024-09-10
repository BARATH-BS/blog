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

namespace blog
{
	public partial class modify : System.Web.UI.Page
	{
		string SqlConn = ConfigurationManager.ConnectionStrings["blog"].ConnectionString;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				fillGrid();
			}
		}
		protected void fillGrid()
		{
			SqlConnection con = new SqlConnection(SqlConn);
			con.Open();

			string q1 = "select * from createblog where id='"+Session["idsd"] +"'";
			SqlCommand cmd = new SqlCommand(q1, con);
			SqlDataAdapter data = new SqlDataAdapter(q1, con);
			DataTable ds = new DataTable();
			data.Fill(ds);
			if (ds.Rows.Count > 0)
			{
				TDG.DataSource = ds;
				TDG.DataMember = "Blog Info";
				TDG.DataBind();
				con.Close();

				Label1.Visible = false;

			}
			else
			{
				TDG.Visible = false;
				Label2.Text = "No data Available..!";
			}



		}

		protected void TDG_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "Select")
			{
				if (e.CommandName == "Select")
				{
					// Get the row index from CommandArgument
					int rowIndex = Convert.ToInt32(e.CommandArgument);

					// Get the GridViewRow by index
					GridViewRow row = TDG.Rows[rowIndex];

					// Extract the data you need from the row
					string id = (row.FindControl("datebll") as Label).Text; // or any other control where ID is stored
					string name = (row.FindControl("titlelbl") as LinkButton).Text; // or any other control where name is stored

					// Redirect with query string
					Response.Redirect($"blog.aspx?id={id}&name={name}");
				}
			}
		}
	}
}
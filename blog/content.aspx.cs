using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace blog
{
	public partial class content : System.Web.UI.Page
	{
		string SqlConn = ConfigurationManager.ConnectionStrings["blog"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				string id = Request.QueryString["id"];
				string name = Request.QueryString["name"];

				using (SqlConnection con1 = new SqlConnection(SqlConn))
				{
					con1.Open();
					string que1 = "SELECT contents FROM createblog WHERE title = @name";
					SqlCommand cmd1 = new SqlCommand(que1, con1);
					cmd1.Parameters.AddWithValue("@name", name);

					using (SqlDataReader reader = cmd1.ExecuteReader())
					{
						if (reader.Read())
						{
							string sst = reader["contents"].ToString();
							con.Text = sst;
						}
						else
						{
							con.Text = "No content found for this blog title.";
						}
					}
				}

			}
		}
	}
}
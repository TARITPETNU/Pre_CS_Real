using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace test1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindData();
        }
        protected void bindData() {
            string mycon = "server =localhost; Uid=root; password = ; persistsecurityinfo = True; database =aboutProduct; SslMode = none";
            MySqlConnection con = new MySqlConnection(mycon);
            DataTable dt = new DataTable();
            MySqlCommand cmd = null;
            try
            {
                cmd = new MySqlCommand("Select * from product", con);
                con.Open();
                dt.Load(cmd.ExecuteReader());
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                con.Close();
            }
            GD.DataSource = dt;
            GD.DataBind();
        }
        protected void GD_OnRowDataBound(object sender, GridViewRowEventArgs e) {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //*** Picture ***//
                Image imgPicture = (Image)e.Row.FindControl("imgPicture");
                if ((imgPicture != null))
                {
                    imgPicture.ImageUrl = "img/" + (string)DataBinder.Eval(e.Row.DataItem, "Picture") + ".jpg";
                }

                //*** ProductID ***//
                Label lblProductID = (Label)e.Row.FindControl("lblProductID");
                if ((lblProductID != null))
                {
                    lblProductID.Text = DataBinder.Eval(e.Row.DataItem, "ProductID").ToString();
                }

                //*** ProductName ***//
                Label lblProductName = (Label)e.Row.FindControl("lblProductName");
                if ((lblProductName != null))
                {
                    lblProductName.Text = (string)DataBinder.Eval(e.Row.DataItem, "ProductName");
                }

                //*** Price ***//
                Label lblPrice = (Label)e.Row.FindControl("lblPrice");
                if ((lblPrice != null))
                {
                    lblPrice.Text = DataBinder.Eval(e.Row.DataItem, "Price").ToString();
                }

                //*** AddToCart ***//
                LinkButton lnkAddToCart = (LinkButton)e.Row.FindControl("lnkAddToCart");
                if ((lnkAddToCart != null))
                {
                    lnkAddToCart.Text = "Add";
                    lnkAddToCart.CommandName = "Add2Cart";
                    lnkAddToCart.CommandArgument = DataBinder.Eval(e.Row.DataItem, "ProductID").ToString();
                }

            }
        }
        protected void GD_OnRowCommand(object sender, GridViewCommandEventArgs e) {
            if (e.CommandName == "Add2Cart")
            {
                string strProductID = e.CommandArgument.ToString();
                DataTable dt = null;
                DataRow dr = null;

                if ((Session["myCart"] == null))
                {
                    dt = new DataTable();
                    dt.Columns.Add("ProductID");
                    dt.Columns.Add("Qty");
                    Session["myCart"] = dt;
                }

                dt = (DataTable)Session["myCart"];
                DataRow[] foundRows = null;
                foundRows = dt.Select("ProductID = '" + strProductID + "'");
                if (foundRows.Length == 0)
                {
                    dr = dt.NewRow();
                    dr["ProductID"] = strProductID;
                    dr["Qty"] = 1;
                    dt.Rows.Add(dr);
                }
                else
                {
                    DataRow[] updateRow = null;
                    updateRow = dt.Select("ProductID = '" + strProductID + "'");
                    updateRow[0]["Qty"] = Convert.ToInt32(updateRow[0]["Qty"]) + 1;
                }

                Session["myCart"] = dt;
                //Response.Write(Session["myCart"]);
                Response.Redirect("ViewCart.aspx");
            }
        }
    }
}
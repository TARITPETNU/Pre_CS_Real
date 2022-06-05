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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected double strTotal = 0;
        protected double strSumTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Console.WriteLine("test");
            BindGird();
            this.lblSumTotal.Text = "Total Amount : " + strSumTotal.ToString("#,###.00");
        }

        protected void BindGird()
        {
            DataTable dt = (DataTable)Session["myCart"];
            this.myGridView.DataSource = dt;
            this.myGridView.DataBind();
        }

        protected void myGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int RowsID = Convert.ToInt32(e.CommandArgument);
                DataTable dt = null;

                dt = (DataTable)Session["myCart"];

                dt.Rows[RowsID].Delete();

                Session["myCart"] = dt;

                Response.Redirect("ViewCart.aspx");

            }
        }

        protected DataTable getProductDet(string strProductID)
        {
            string mycon = "server =localhost; Uid=root; password = ; persistsecurityinfo = True; database =aboutProduct; SslMode = none";
            MySqlConnection con = new MySqlConnection(mycon);
            DataTable dt = new DataTable();
            MySqlDataAdapter dtAdapter = new MySqlDataAdapter();
            MySqlCommand cmd = null;
            string command = "Select * from product WHERE ProductID = " + strProductID + " ";
            try
            {
                cmd = new MySqlCommand(command, con);
                con.Open();
                dtAdapter = new MySqlDataAdapter(command, con);
                //dt.Load(cmd.ExecuteReader());
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                con.Close();
            }
            
            //myGridView.DataSource = dt;
            //myGridView.DataBind();
            dtAdapter.Fill(dt);
            //Response.Write(dt);
            return dt;
        }

        protected void myGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //*** ProductID ***//
                Label lblProductID = (Label)e.Row.FindControl("lblProductID");
                if ((lblProductID != null))
                {
                    lblProductID.Text = DataBinder.Eval(e.Row.DataItem, "ProductID").ToString();
                }

                DataTable dt = getProductDet(DataBinder.Eval(e.Row.DataItem, "ProductID").ToString());

                //*** ProductName ***//
                Label lblProductName = (Label)e.Row.FindControl("lblProductName");
                if ((lblProductName != null))
                {
                    lblProductName.Text = dt.Rows[0]["ProductName"].ToString();
                }

                //*** Price ***//
                Label lblPrice = (Label)e.Row.FindControl("lblPrice");
                if ((lblPrice != null))
                {
                    lblPrice.Text = dt.Rows[0]["Price"].ToString();
                }

                //*** Qty ***//
                Label lblQty = (Label)e.Row.FindControl("lblQty");
                if ((lblQty != null))
                {
                    lblQty.Text = DataBinder.Eval(e.Row.DataItem, "Qty").ToString();
                }

                //*** Total ***//
                Label lblTotal = (Label)e.Row.FindControl("lblTotal");
                if ((lblTotal != null))
                {
                    strTotal = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Qty")) * Convert.ToDouble(dt.Rows[0]["Price"]);
                    strSumTotal = Convert.ToDouble(strSumTotal) + strTotal;
                    lblTotal.Text = strTotal.ToString("#,###.00");
                }

                //*** Delete ***//
                LinkButton lnkDelete = (LinkButton)e.Row.FindControl("lnkDelete");
                if ((lnkDelete != null))
                {
                    lnkDelete.Text = "Delete";
                    lnkDelete.CommandName = "Del";
                    lnkDelete.CommandArgument = e.Row.RowIndex.ToString();
                    lnkDelete.Attributes.Add("OnClick", "return confirm('Delete this row?');");
                }

            }
        }

        protected void lnkClearCart_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("ViewCart.aspx");
        }

        protected void lnkCheckOut_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["myCart"];

            if (Session["myCart"] != null)
            {
                if (dt.Rows.Count > 0)
                {
                    this.pnlCheckOut.Visible = true;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //string name = Request.Form.Get("name");
            //string eml = Request.Form.Get("mail");
            string mycon = "server =localhost; Uid=root; password = ; persistsecurityinfo = True; database =aboutProduct; SslMode = none";
            //string mycon = "Server=localhost;Database=test1;Uid=root;Password= ;";
            MySqlConnection con = new MySqlConnection(mycon);
            MySqlCommand cmd = null;
            try
            {
                cmd = new MySqlCommand("INSERT INTO orders (OrderDate,Name,Address,Tel,Email) " + " VALUES " + " (@sOrderDate,@sName,@sAddress,@sTel,@sEmail)", con);
                cmd.Parameters.AddWithValue("@sOrderDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@sName", this.txtName.Text);
                cmd.Parameters.AddWithValue("@sAddress", this.txtAddress.Text);
                cmd.Parameters.AddWithValue("@sTel", this.txtTel.Text);
                cmd.Parameters.AddWithValue("@sEmail", this.txtEmail.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                con.Close();
                return;
            }
            Response.Write("<script>alert('Data Saved Successfully')</script>");

            //***Select OrderID***//
            string command = "SELECT Max(OrderID) As sOrderID FROM orders ";
            DataTable dt1 = new DataTable();
            MySqlDataAdapter dtAdapter = new MySqlDataAdapter();
            dtAdapter = new MySqlDataAdapter(command, con);
            string strOrderID = "0";
            DataTable dt2 = null;
            int i = 0;
            dtAdapter.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                strOrderID = dt1.Rows[0]["sOrderID"].ToString();
            }

            //*** Insert to orders_detail ***//
            dt2 = (DataTable)Session["myCart"];
            for (i = 0; i <= dt2.Rows.Count - 1; i++)
            {
                cmd = new MySqlCommand("INSERT INTO orders_detail (OrderID,ProductID,Qty) " + " VALUES " + " (@sOrderID"+i+",@sProductID"+i+",@sQty"+i+")", con);
                cmd.Parameters.AddWithValue("@sOrderID"+i, strOrderID);
                cmd.Parameters.AddWithValue("@sProductID"+i, dt2.Rows[i]["ProductID"]);
                cmd.Parameters.AddWithValue("@sQty"+i, dt2.Rows[i]["Qty"]);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            con.Close();
            con = null;

            Session.Abandon();
            Response.Redirect("ViewOrders.aspx?OrderID=" + strOrderID);
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySqlDB;
using System.Data;

namespace NewJMConsume
{
    public partial class testlink : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = MysqlHelper.ExecuteDataTable("select * from tbrole");
        }
    }
}
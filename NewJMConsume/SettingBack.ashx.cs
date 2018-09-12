using MySqlDB;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace NewJMConsume
{
    /// <summary>
    /// SettingBack 的摘要说明
    /// </summary>
    public class SettingBack : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Result = "";
            string types = "";
            bool isExec = false;//是否成功成执行数据库
            int execNum = 0;//执行数据库，受影响行数
            string execStr = "";//执行数据库，返回的统计结果
            DataTable execDt;//执行数据库，返回的datatable
            int recordCount = 0;//数据总量
            string wherestr = "and 1 = 1";//where语句
            JObject resjobj = new JObject();
            try
            {
                string poststr = getpost();
                if (!string.IsNullOrEmpty(poststr))
                {
                    JObject jobj = JObject.Parse(poststr);
                    types = jobject(jobj, "type");//执行哪条命令

                    string role = jobject(jobj, "role");//角色名字
                    string remark = jobject(jobj, "remark");//备注
                    string company = jobject(jobj, "company");//所属公司
                    string keyword = jobject(jobj, "keyword");//关键字
                    string status = jobject(jobj, "status");//是否可用
                    string pc = jobject(jobj, "pc");//当前页数
                    int page = pc != "" ? int.Parse(pc) : 0;//当前页数
                    string id = jobject(jobj, "id");//id
                    string feeplace = jobject(jobj, "feeplace");//就餐地点
                    string eattype = jobject(jobj, "eattype");//就餐餐次
                    string feeresource = jobject(jobj, "feeresource");//消费策略
                    if (types != "")
                    {
                        switch (types)
                        {

                            #region//角色设置的页面
                            case "set_role_addrole"://添加角色
                                #region
                                execStr = MysqlHelper.ExecuteScalar("select count(*) from tbrole where RoName = '" + role + "' and Company = '" + company + "'").ToString();
                                if (execStr == "0")
                                {
                                    execNum = MysqlHelper.ExecuteNonQuery("insert into tbrole (RoName,RoRemark,RoIsModify,RoIsValid,RoNo,Company) values ('" + role + "','" + remark + "','0','1','0','" + company + "')");
                                    if (execNum == 1)
                                    {
                                        resjobj.Add("result", JToken.FromObject("success"));
                                        resjobj.Add("msg", JToken.FromObject("添加成功"));
                                    }
                                    else
                                    {
                                        resjobj.Add("result", JToken.FromObject("fail"));
                                        resjobj.Add("msg", JToken.FromObject("添加失败"));
                                    }
                                }
                                else
                                {
                                    resjobj.Add("result", JToken.FromObject("fail"));
                                    resjobj.Add("msg", JToken.FromObject("添加失败，已有该角色！"));
                                }
                                #endregion
                                break;

                            case "set_role_load"://加载页面
                                #region
                                if (status != "")
                                {
                                    wherestr += "and RoIsValid = '" + status + "'";
                                }
                                if (company != "")
                                {
                                    wherestr += "and Company = '" + company + "'";
                                }
                                if (keyword != "")
                                {
                                    wherestr += "and (RoName  like '%" + keyword + "%' or RoRemark like '%" + keyword + "%' or Company like '%" + keyword + "%')";
                                }
                                execDt = MysqlHelper.getPager(out recordCount, "", "tbrole", wherestr, "RoId", page, 10);
                                resjobj.Add("result", JToken.FromObject("ok"));
                                resjobj.Add("execDt", JToken.FromObject(execDt));
                                resjobj.Add("numcount", JToken.FromObject(recordCount));
                                #endregion
                                break;

                            case "set_role_update"://更新状态
                                #region
                                string nowstatus = status == "1" ? "0" : "1";
                                execNum = MysqlHelper.ExecuteNonQuery("update tbrole set RoIsValid = '" + nowstatus + "' where RoId = '" + id + "'");
                                if (execNum == 1)
                                {
                                    resjobj.Add("result", JToken.FromObject("success"));
                                    resjobj.Add("msg", JToken.FromObject("添加成功"));
                                }
                                else
                                {
                                    resjobj.Add("result", JToken.FromObject("fail"));
                                    resjobj.Add("msg", JToken.FromObject("添加失败"));
                                }
                                #endregion
                                break;

                            #endregion

                            #region//饭堂设置的页面
                            case "set_cant_load"://加载页面
                                #region
                                if(feeplace != "")
                                {
                                    wherestr += " and PlaceType = '" + feeplace + "'";
                                }
                                if (id != "")
                                {
                                    wherestr += " and id = '" + id + "'";
                                }
                                execDt = MysqlHelper.getPager(out recordCount, "", "tk_resource_place", wherestr, "FeeID", page, 10);
                                resjobj.Add("result", JToken.FromObject("ok"));
                                resjobj.Add("execDt", JToken.FromObject(execDt));
                                resjobj.Add("numcount", JToken.FromObject(recordCount));
                                #endregion
                                break;

                            case "set_cant_add"://添加食堂
                                #region

                                execStr = MysqlHelper.ExecuteScalar("select count(*) from tk_resource_place where PlaceType = '" + feeplace + "' and Company = '" + company + "'").ToString();
                                if (execStr == "0")
                                {
                                    execNum = MysqlHelper.ExecuteNonQuery("insert into tk_resource_place (FeeResource,ResourceName,order_price_type,PID,PlaceType,Company) values ('" + feeresource + "','" + feeresource + "','" + eattype + "','5','" + feeplace + "','" + company + "')");
                                    if (execNum == 1)
                                    {
                                        resjobj.Add("result", JToken.FromObject("success"));
                                        resjobj.Add("msg", JToken.FromObject("添加成功"));
                                    }
                                    else
                                    {
                                        resjobj.Add("result", JToken.FromObject("fail"));
                                        resjobj.Add("msg", JToken.FromObject("添加失败"));
                                    }
                                }
                                else
                                {
                                    resjobj.Add("result", JToken.FromObject("fail"));
                                    resjobj.Add("msg", JToken.FromObject("添加失败，此消费地点已存在！"));
                                }
                                #endregion
                                break;

                            case "set_cant_delete"://删除食堂
                                #region
                                execStr = MysqlHelper.ExecuteNonQuery("delete from tk_resource_place where FeeID = '" + id + "'").ToString();
                                if (execStr == "1")
                                {
                                    resjobj.Add("result", JToken.FromObject("success"));
                                    resjobj.Add("msg", JToken.FromObject("删除成功！"));
                                }
                                else
                                {
                                    resjobj.Add("result", JToken.FromObject("fail"));
                                    resjobj.Add("msg", JToken.FromObject("删除失败！"));
                                }
                                #endregion
                                break;

                            case "set_cant_update"://更新饭堂
                                #region

                                #endregion
                                break;

                            #endregion 







                            default:
                                resjobj.Add("result", JToken.FromObject("error"));
                                resjobj.Add("msg", JToken.FromObject("无权限访问"));
                                break;
                        }

                    }
                    else
                    {

                    }
                }

            }
            catch (Exception e)
            {
                resjobj.Add("result", JToken.FromObject("exception"));
                resjobj.Add("msg", JToken.FromObject("异常："+e.Message.ToString()));
            }
            Result = JsonConvert.SerializeObject(resjobj);
            context.Response.Write(Result);
            context.Response.End();

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        //后台通用方法
        #region
        /// <summary>
        /// 这个也是转换为json不过是用系统的
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public string DataTableToJson(DataTable dt)
        {
            string result = "";
            result = JsonConvert.SerializeObject(dt, new DataTableConverter());
            //new DataTableConverter()一般是固定的
            return result;
        }
        /// <summary>     
        /// dataTable转换成Json格式     
        /// </summary>     
        /// <param name="dt"></param>     
        /// <returns></returns>     
        public static string tableToJson(DataTable dt, string tablename)
        {
            StringBuilder jsonBuilder = new StringBuilder();
            jsonBuilder.Append("\"");
            jsonBuilder.Append(tablename);
            jsonBuilder.Append("\":[");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    jsonBuilder.Append("{");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        jsonBuilder.Append("\"");
                        jsonBuilder.Append(dt.Columns[j].ColumnName.ToLower());
                        jsonBuilder.Append("\":\"");
                        if (dt.Columns[j].DataType == typeof(DateTime))
                        {
                            String v = dt.Rows[i][j].ToString().Trim();
                            if (v != "")
                            {
                                DateTime d = DateTime.Now;
                                DateTime.TryParse(v, out d);
                                v = d.ToString("yyyy-MM-dd HH:mm:ss");
                            }
                            jsonBuilder.Append(v);
                        }
                        else
                        {
                            String v = dt.Rows[i][j].ToString().Trim();
                            v = v.Replace("\"", "\\\"").Replace("\r", "").Replace("\n", "").Replace("\\", "\\\\");
                            jsonBuilder.Append(v);
                        }
                        jsonBuilder.Append("\",");
                    }

                    jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
                    jsonBuilder.Append("},");
                }
            }
            else
            {
                jsonBuilder.Append(",");
            }
            jsonBuilder.Remove(jsonBuilder.Length - 1, 1);

            jsonBuilder.Append("]");
            //jsonBuilder.Append("}");
            return jsonBuilder.ToString();
        }

        /// <summary>
        /// 获取数据流
        /// </summary>
        /// <returns></returns>
        public string getpost()
        {
            string g = "";
            if (HttpContext.Current.Request.InputStream != null)
            {
                System.IO.StreamReader sr = new System.IO.StreamReader(HttpContext.Current.Request.InputStream, System.Text.Encoding.UTF8);
                g = sr.ReadToEnd();
            }
            return g;
        }
        /// <summary>
        /// 从jobject中获取相应的数据 
        /// </summary>
        /// <param name="jobj">jobject对象</param>
        /// <param name="key">要获取的值</param>
        /// <returns></returns>
        public string jobject(JObject jobj, string key)
        {
            string hh = "";
            if (jobj[key] != null)
            {
                hh = jobj[key].ToString().Trim();
            }
            return hh;
        }

        #endregion


    }
}
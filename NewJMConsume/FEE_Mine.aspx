<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FEE_Mine.aspx.cs" Inherits="NewJMConsume.FEE_Mine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="#">结算管理</a>
            </li>
            <li class="active">消费明细（个人）</li>
        </ul>
        <!-- /.breadcrumb -->

        <div class="nav-search" id="nav-search">
            <div class="form-search">
                <span class="input-icon">
                    <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                    <i class="ace-icon fa fa-search nav-search-icon"></i>
                </span>
            </div>
        </div>
        <!-- /.nav-search -->
    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>消费明细（个人）
            </h1>
        </div>
        <!-- /.page-header -->

        <div class="row">
            <div class="col-lg-12">
                <%-- 输入行--%>
                <div class="row">
                    <div class="col-lg-12">
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <!--开始日期-->
                                    <td class="form-inline">
                                        <div class="form-group">
                                            <label>开始:</label>
                                        </div>
                                        <div class="form-group">
                                            <div id="sandbox-container" style="margin-left: 5px">
                                                <input type="text" class="form-control" id="btime" style="width: 100px" />
                                            </div>
                                            <script type="text/javascript">
                                                $('#sandbox-container input').datetimepicker({
                                                    minView: "month",
                                                    language: 'zh-CN',
                                                    format: "yyyy-mm-dd"
                                                })
                                            </script>
                                        </div>
                                    </td>
                                    <!--结束日期-->
                                    <td class="form-inline">
                                        <div class="form-group">
                                            <label>结束:</label>
                                        </div>
                                        <div class="form-group">
                                            <div id="sandbox-container02" style="margin-left: 5px">
                                                <input type="text" class="form-control" id="etime" style="width: 100px" />
                                            </div>
                                            <script type="text/javascript">
                                                $('#sandbox-container input').datetimepicker({
                                                    minView: "month",
                                                    language: 'zh-CN',
                                                    format: "yyyy-mm-dd"
                                                })
                                            </script>
                                        </div>
                                    </td>
                                    <!--餐次-->
                                    <td class="form-inline">
                                        <div class="form-group">
                                            <label>餐次</label>
                                            <select class="selectpicker" id="eattype" data-width="auto">
                                                <option value="">全部</option>
                                                <option value="早餐">早餐</option>
                                                <option value="午餐">午餐</option>
                                                <option value="晚餐">晚餐</option>
                                            </select>
                                        </div>
                                    </td>
                                    <!--员工类型-->
                                    <td class="form-inline">
                                        <div class="form-group">
                                            <label>员工类型</label>
                                            <select class="selectpicker" id="people" data-width="auto">
                                                <option value="">全部</option>
                                                <option value="早餐">早餐</option>
                                                <option value="午餐">午餐</option>
                                                <option value="晚餐">晚餐</option>
                                            </select>
                                        </div>
                                    </td>
                                    <!--部门-->
                                    <td class="form-inline">
                                        <div class="form-group">
                                            <label>部门</label>
                                            <select class="selectpicker" id="dep" data-width="auto">
                                                <option value="">全部</option>
                                                <option value="早餐">早餐</option>
                                                <option value="午餐">午餐</option>
                                                <option value="晚餐">晚餐</option>
                                            </select>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <!--结算单位-->
                                    <td class="form-inline">
                                        <div class="form-group">
                                            <label>结算单位</label>
                                            <select class="selectpicker" id="com" data-width="auto">
                                                <option value="">全部</option>
                                                <option value="早餐">早餐</option>
                                                <option value="午餐">午餐</option>
                                                <option value="晚餐">晚餐</option>
                                            </select>
                                        </div>
                                    </td>
                                    <!--付费类型-->
                                    <td class="form-inline">
                                        <div class="form-group">
                                            <label>付费类型</label>
                                            <select class="selectpicker" id="feetype" data-width="auto">
                                                <option value="">全部</option>
                                                <option value="早餐">早餐</option>
                                                <option value="午餐">午餐</option>
                                                <option value="晚餐">晚餐</option>
                                            </select>
                                        </div>
                                    </td>
                                    <!--姓名-->
                                    <td class="form-inline">
                                        <div class="form-group">
                                            <label>姓名</label>
                                            <input type="text" class="form-control" />
                                        </div>
                                    </td>
                                    <!--消费类别-->
                                    <td class="form-inline">
                                        <div class="form-group">
                                            <label>消费类别</label>
                                            <select class="selectpicker" id="paytype" data-width="auto">
                                                <option value="">全部</option>
                                                <option value="早餐">早餐</option>
                                                <option value="午餐">午餐</option>
                                                <option value="晚餐">晚餐</option>
                                            </select>
                                        </div>
                                    </td>
                                    <!--消费地点-->
                                    <td class="form-inline">
                                        <div class="form-group">
                                            <label>消费地点</label>
                                            <select class="selectpicker" id="feeplace" data-width="auto">
                                                <option value="">全部</option>
                                                <option value="早餐">早餐</option>
                                                <option value="午餐">午餐</option>
                                                <option value="晚餐">晚餐</option>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <input type="button" class="btn btn-primary" value="查询" />
                                            <input type="button" class="btn btn-primary" value="导出" />
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>

                <%--表格--%>
                <div class="row" style="margin-top: 1%">
                    <div class="col-lg-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>表头1</th>
                                    <th>表头2</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>单元格1</td>
                                    <td>单元格1</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

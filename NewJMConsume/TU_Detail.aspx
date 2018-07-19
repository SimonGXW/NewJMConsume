<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TU_Detail.aspx.cs" Inherits="NewJMConsume.TU_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="#">充值管理</a>
            </li>
            <li class="active">充值记录查询</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>
    <div class="page-content">
        <div class="page-header">
            <h1>充值记录查询
            </h1>
        </div>
        <!-- /.page-header -->

        <div class="row">
            <div class="col-lg-12">

                <div class="row">
                    <div class="col-lg-12 form-inline">
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
                    </div>
                </div>
                <div class="row" style="margin-top: 1%">
                    <div class="col-lg-12">
                        <%-- 输入行--%>
                        <div class="row">
                            <div class="col-lg-12 form-inline">
                                <div class="form-group">
                                    <label>部门：</label>
                                    <select class="selectpicker" id="dep" data-width="auto">
                                        <option value="">全部</option>
                                        <option value="早餐">早餐</option>
                                        <option value="午餐">午餐</option>
                                        <option value="晚餐">晚餐</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>姓名:</label>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>卡号:</label>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>充值途径</label>
                                    <select class="selectpicker" id="eattype" data-width="auto">
                                        <option value="">全部</option>
                                        <option value="早餐">早餐</option>
                                        <option value="午餐">午餐</option>
                                        <option value="晚餐">晚餐</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>充值人员:</label>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" />
                                </div>

                                <div class="form-group">
                                    <input type="button" class="btn btn-primary" value="查询" />
                                    <input type="button" class="btn btn-primary" value="导出" />
                                </div>
                            </div>
                        </div>
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

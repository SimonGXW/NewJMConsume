<%@ Page Title="" Language="C#" MasterPageFile="~/Setting.Master" AutoEventWireup="true" CodeBehind="Set_Staff.aspx.cs" Inherits="NewJMConsume.Set_Staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs" style="padding-top:0 0 0 0">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="#">设置</a>
            </li>
            <li class="active">人员设置</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>


    <div class="page-content">
        <div class="page-header">
            <h1>人员设置
            </h1>
        </div>
        <!-- /.page-header -->

        <div class="row">
            <div class="col-lg-12">
                <%-- 输入行--%>
                <div class="row">
                    <div class="col-lg-12 form-inline">
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="批量新增" />
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="单个新增" />
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="启用" />
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-danger" value="停用" />
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-info" value="导出" />
                        </div>
                    </div>
                </div>

                <%--表格--%>
                <div class="row" style="margin-top: 2%">
                    <div class="col-lg-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>公司</th>
                                    <th>帐号</th>
                                    <th>姓名</th>
                                    <th>角色</th>
                                    <th>部门</th>
                                    <th>卡号</th>
                                    <th>状态</th>
                                    <th>余额</th>
                                    <th>消费策略</th>
                                    <th>消费地点</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
<%--                                <tr>
                                    <td>单元格1</td>
                                    <td>单元格1</td>
                                </tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

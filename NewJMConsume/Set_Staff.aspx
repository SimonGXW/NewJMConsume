<%@ Page Title="" Language="C#" MasterPageFile="~/Setting.Master" AutoEventWireup="true" CodeBehind="Set_Staff.aspx.cs" Inherits="NewJMConsume.Set_Staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
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
                            <input type="button" class="btn btn-primary" value="停用" />
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="导出" />
                        </div>
                    </div>
                </div>

                <%--表格--%>
                <div class="row" style="margin-top: 2%">
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

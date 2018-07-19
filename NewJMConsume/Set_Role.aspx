<%@ Page Title="" Language="C#" MasterPageFile="~/Setting.Master" AutoEventWireup="true" CodeBehind="Set_Role.aspx.cs" Inherits="NewJMConsume.Set_Role" %>

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
                            <label>状态：</label>
                        </div>
                        <div class="form-group">
                            <label class="radio-inline">
                                <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                全部
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                启用
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                停用
                            </label>
                        </div>
                        <div class="form-group" style="margin-left:2%">
                            <label>所属公司：</label>
                        </div>
                        <div class="form-group">

                            <select class="selectpicker" id="com" data-width="auto">
                                <option value="">全部</option>
                                <option value="早餐">早餐</option>
                                <option value="午餐">午餐</option>
                                <option value="晚餐">晚餐</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="关键字"/>
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="查询" />
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="新增角色" />
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

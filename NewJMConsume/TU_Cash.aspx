<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TU_Cash.aspx.cs" Inherits="NewJMConsume.TU_Cash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="#">充值管理</a>
            </li>
            <li class="active">现金充值</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>个人充值
            </h1>
        </div>
        <!-- /.page-header -->

        <div class="row">
            <div class="col-lg-12">
                <%-- 输入行--%>
                <div class="row">
                    <div class="col-lg-12 form-inline">
                        <div class="form-group">
                            <label>卡号:</label>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>姓名:</label>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>充值类型</label>
                            <select class="selectpicker" id="eattype" data-width="auto">
                                <option value="">全部</option>
                                <option value="早餐">早餐</option>
                                <option value="午餐">午餐</option>
                                <option value="晚餐">晚餐</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>充值金额:</label>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" />
                        </div>

                        <div class="form-group">
                            <label>备注:</label>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="提交" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <hr />
        <div class="page-header">
            <h1>团体充值
            </h1>
        </div>
        <!-- /.page-header -->

                <div class="row">
            <div class="col-lg-12">
                <%-- 输入行--%>
                <div class="row">
                    <div class="col-lg-12 form-inline">
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="下载模版" />
                            <input type="button" class="btn btn-primary" value="上传文件" />
                        </div>
                        <div class="form-group">
                            <label>充值类型</label>
                            <select class="selectpicker" id="tutype" data-width="auto">
                                <option value="">全部</option>
                                <option value="早餐">早餐</option>
                                <option value="午餐">午餐</option>
                                <option value="晚餐">晚餐</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>备注:</label>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="提交" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

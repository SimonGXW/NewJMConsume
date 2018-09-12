<%@ Page Title="" Language="C#" MasterPageFile="~/Setting.Master" AutoEventWireup="true" CodeBehind="Set_Cant.aspx.cs" Inherits="NewJMConsume.Set_Cant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="mysrc/pagejs/Set_Cant.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="#">设置</a>
            </li>
            <li class="active">饭堂设置</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>饭堂设置
            </h1>
        </div>
        <!-- /.page-header -->

        <div class="row">
            <div class="col-lg-12">
                <%-- 输入行--%>
                <div class="row">
                    <div class="col-lg-12 form-inline">
                        <div class="form-group">
                            <label>消费地点：</label>
                        </div>
                        <div class="form-group">

                            <select class="selectpicker" id="feeplace" data-width="auto">
                                <option value="">全部</option>
                                <option value="江门食堂">江门食堂</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="搜索" onclick="load(true, 1);"/>
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="单个新增"  data-toggle="modal" data-target="#myModal"/>
                        </div>
                    </div>
                </div>

                <%--表格--%>
                <div class="row" style="margin-top: 2%">
                    <div class="col-lg-12">
                        <table class="table table-bordered" id="table">

                        </table>
                    </div>
                </div>


                <%--分页--%>
                <div class="row">
                    <div class="col-lg-12">
                         <div id="example" style="text-align: center"> <ul id="pageLimit"></ul> </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


            <%--模态框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <label class="modal-title" id="myModalLabel">新增饭堂</label>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 1%">
                            <label class="col-lg-2">所属公司</label>
                            <select class="selectpicker" id="addcompany">
                                <option value="江门市公司">江门市公司</option>
                                <option value="新会分公司">新会分公司</option>
                            </select>
                        </div>
                        <div class="row form-inline" style="margin-top: 1%">
                            <label class="col-lg-2">消费地点</label>
                            <input type="text" class="form-control col-lg-10" id="addfeeplace"/>
                        </div>
                        <div class="row form-inline" style="margin-top: 1%">
                            <label class="col-lg-2">消费餐次</label>
                            <select class="selectpicker" id="addeattype">
                                <option value="早餐">早餐</option>
                                <option value="午餐">午餐</option>
                                <option value="晚餐">晚餐</option>
                            </select>
                        </div>
                        <div class="row form-inline" style="margin-top: 1%">
                            <label class="col-lg-2">消费策略</label>
                            <select class="selectpicker" id="addfeeresource">
                                <option value="测试">测试</option>
 
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="addRole()" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

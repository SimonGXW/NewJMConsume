<%@ Page Title="" Language="C#" MasterPageFile="~/Setting.Master" AutoEventWireup="true" CodeBehind="Set_Role.aspx.cs" Inherits="NewJMConsume.Set_Role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="mysrc/pagejs/Set_Role.js"></script>
    <script type="text/javascript">

    </script>
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
                                <input type="radio" name="statusRadio" id="inlineRadio1" value="" checked="checked">
                                全部
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="statusRadio" id="inlineRadio2" value="1">
                                启用
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="statusRadio" id="inlineRadio3" value="0">
                                停用
                            </label>
                        </div>
                        <div class="form-group" style="margin-left:2%">
                            <label>所属公司：</label>
                        </div>
                        <div class="form-group">

                            <select class="selectpicker" id="company" data-width="auto">
                                <option value="">全部</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="关键字" id="keyword"/>
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="查询" onclick="load(true, 1);"/>
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary" value="新增角色"  data-toggle="modal" data-target="#myModal"/>
                        </div>
                    </div>
                </div>

                <%--表格--%>
                <div class="row" style="margin-top: 2%">
                    <div class="col-lg-12">
                        <table class="table table-bordered" id="table">
<%--                            <thead>
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
                            </tbody>--%>
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
                    <label class="modal-title" id="myModalLabel">添加角色</label>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 1%">
                            <label class="col-lg-2">所属公司</label>
                            <select class="selectpicker" id="addcompany">
                                <option value="">全部</option>
                                <option value="江门市公司">江门市公司</option>
                                <option value="新会分公司">新会分公司</option>
                                <option value="台山分公司">台山分公司</option>
                                <option value="开平分公司">开平分公司</option>
                                <option value="恩平分公司">恩平分公司</option>
                                <option value="鹤山分公司">鹤山分公司</option>
                            </select>
                        </div>
                        <div class="row form-inline" style="margin-top: 1%">
                            <label class="col-lg-2">角色名称</label>
                            <input type="text" class="form-control col-lg-10" id="addrole"/>
                        </div>
                        <div class="row" style="margin-top: 1%">
                            <label class="col-lg-2">可见模块</label>
                            <div class="col-lg-10">
                                <p>
                                    <label>餐票申请：</label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="我的申请" name="isModel"/>我的申请
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="草稿箱" name="isModel"/>草稿箱
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="去申请" name="isModel"/>去申请
                                    </label>
                                </p>
                                <p>
                                    <label>餐票审批：</label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="待我审批" name="isModel"/>待我审批
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="我已审批" name="isModel"/>我已审批
                                    </label>
                                </p>
                                <p>
                                    <label>餐票汇总：</label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="全量餐票" name="isModel"/>全量餐票
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="明细报表" name="isModel"/>明细报表
                                    </label>
                                </p>
                                <p>
                                    <label>系统设置：</label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="角色设置" name="isModel"/>角色设置
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="帐号设置" name="isModel"/>帐号设置
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="其他设置" name="isModel"/>其他设置
                                    </label>
                                </p>
                            </div>
                        </div>
                        <div class="row form-inline" style="margin-top: 1%">
                            <label class="col-lg-2">角色说明</label>
                            <input type="text" class="form-control" id="addremark"/>
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

﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="WebPages.Dashboard.Admin.Employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="../Styles/bootstrap.css" rel="stylesheet" />
    <link href="../Styles/simple-sidebar.css" rel="stylesheet" />
    <script src="../JavaScript/custom.min.js"></script>
    <link href="../Styles/AdminPanelStyles.css" rel="stylesheet" />
    <link href="../font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="c-title">
        <h4>

            <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Employees%>" /></h4>
    </div>
    <div class="x_content">
        <div class="row">
            <div class="col-md-4 hidden-xs">
                <label style="padding-top: 5px;">
                    نمایش
                                <select name="ctl00$ContentPlaceHolder1$ddlPageSize" onchange="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$ddlPageSize\',\'\')', 0)" id="ContentPlaceHolder1_ddlPageSize" style="font-weight: normal;">
                                    <option selected="selected" value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="75">75</option>
                                    <option value="100">100</option>
                                </select>
                    رکورد
                </label>
            </div>
            <div class="col-md-4 col-xs-12 text-righ">
                <asp:Button ID="btnAddEmployee" name="btnAdd" class="btn btn-primary" runat="server"
                    Text="<%$ Resources:Dashboard,NewEmployee%>" OnClick="btnAddEmployee_Click" />
            </div>
            <div class="col-md-4 col-xs-12 text-righ">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button type="button" id="btnSearch" class="btn btn-primary" runat="server" onserverclick="btnSearch_Click">
                            <span class="fa fa-search"></span>
                        </button>
                    </span>

                    <div id="ContentPlaceHolder1_upSearch">

                        <input name="ctl00$ContentPlaceHolder1$tbxnameSearch" runat="server" placeholder="نام کارمند" type="text" maxlength="50" id="tbxSearch" class="form-control text-right dirRight" />
                        <input name="ctl00$ContentPlaceHolder1$tbxfamilySearch" runat="server" placeholder="نام خانوادگی کارمند" type="text" maxlength="50" id="tbxFamilySearch" class="form-control text-right dirRight" />
                    </div>
                </div>
            </div>
        </div>

        <div id="ContentPlaceHolder1_upGrid">

            <div>

                <asp:GridView ID="gvEmployees" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False"
                    CssClass="dirRight table" HorizontalAlign="Center" OnRowDataBound="gvEmployees_RowDataBound" AllowCustomPaging="True" AllowPaging="True" OnSelectedIndexChanged="gvEmployees_SelectedIndexChanged" OnRowEditing="gvEmployees_RowEditing" OnRowCommand="gvEmployees_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="PersonalCode" HeaderText="کد پرسنلی" />
                        <asp:BoundField DataField="FirstName" HeaderText="نام" />
                        <asp:BoundField DataField="LastName" HeaderText="نام خواندگی" />
                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Justify">
                            <ItemTemplate>
                                <asp:Button ID="Edid" runat="server"
                                    CommandName="Edit"
                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                    Text="ویرایش" />

                                <asp:Button ID="Details" runat="server"
                                    CommandName="Details"
                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                    Text="جزئیات" />

                                <asp:Button OnClientClick="if(!confirm('ایا مطمئن هستید؟')) return false;" ID="Delet" runat="server"
                                    CommandName="Delet"
                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                    Text="حذف" />
                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>

                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </div>
        </div>
        <div class="modal fade" id="modalShowDetails" tabindex="-1" role="dialog" aria-labelledby="modalAskSubmitUpdate-label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="modalAskSubmitUpdate-label">هشدار

                                                    <span class="glyphicon glyphicon-warning-sign"></span>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="c-content">
                            <div id="demo-form2" class="form-horizontal form-label-right">
                                <div class="col-md-6 col-md-offset-3 col-xs-12">

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="lblStudentCode" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,PersonalCode%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">

                                                <span id="tbxPersonalCode" runat="server" class="form-control control-label formLabel"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="ContentPlaceHolder1_lbl_FirstName" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,name%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                                                <span id="tbxFirstName" runat="server" class="form-control control-label formLabel"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="ContentPlaceHolder1_lbl_LastName" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,family%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                                                <span id="tbxLastName" runat="server" class="form-control control-label formLabel" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="ln_solid"></div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="ContentPlaceHolder1_lbl_BirthYear" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,birthday%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                                                <span id="tbxBirthDay" runat="server" class="form-control control-label formLabel"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="ContentPlaceHolder1_lbl_FixTel" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,telephon_sabet%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                                                <span id="tbxFixTel" runat="server" class="form-control control-label formLabel"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="ContentPlaceHolder1_lbl_EmployeeUserName" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,UserName%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                                                <span id="tbxUserName" runat="server" class="form-control control-label formLabel"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="ContentPlaceHolder1_lbl_EmployeePassword" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Password%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                                                <span id="tbxPassword" runat="server" class="form-control control-label formLabel"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="ContentPlaceHolder1_lbl_Mobile" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,mobile%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                                                <span id="tbxMobile" runat="server" class="form-control control-label formLabel"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="ContentPlaceHolder1_lbl_EmpoyeetType" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,EmployeeType%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                                                <span id="tbxEmployeeType" runat="server" class="form-control control-label formLabel"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="ContentPlaceHolder1_lbl_Email" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,email%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                                                <span id="tbxEmail" runat="server" class="form-control control-label formLabel"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                <span id="ContentPlaceHolder1_lbl_Address" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,address%>" />
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                                                <textarea name="ctl00$ContentPlaceHolder1$tbxAddress" rows="2" cols="20" id="tbxAddress" class="form-control text-right dirRight"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-xs-4 text-left">
                                            <a href="http://localhost:4911/Dashboard/Admin/Employees.aspx" class="btn btn-default">
                                                <span class="fa fa-chevron-left"></span>
                                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Back%>" />
                                            </a>
                                        </div>
                                    </div>

                                    <div class="extra" style="height: 100px">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-xs-12 text-center">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">
                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,No%>" />
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-5 col-md-push-7 col-xs-6 col-xs-push-6">
                <button type="button" id="btnViewAll" class="btn btn-auto-h btn-info goRight" runat="server" style="margin-right: 5px;" onserverclick="btnShowAll_Click">
                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,ShowAll%>" />
                    <span class="fa fa-list"></span>
                </button>
            </div>
            <div class="extra" style="height: 100px">
            </div>
        </div>
    </div>
</asp:Content>
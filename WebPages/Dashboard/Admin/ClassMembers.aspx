<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="ClassMembers.aspx.cs" Inherits="WebPages.Dashboard.Admin.Ozviat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="../Styles/bootstrap.css" rel="stylesheet" />
    <link href="../Styles/simple-sidebar.css" rel="stylesheet" />
    <script src="../JavaScript/custom.min.js"></script>

    <link href="../font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Styles/AdminPanelStyles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="c-title">
        <h4>
            <asp:Literal runat="server" Text="<%$ Resources:Dashboard,NewLesson%>" /></h4>
    </div>
    <div class="c-content">
        <div id="demo-form2" class="form-horizontal form-label-right">
            <div class="col-md-12  col-xs-12">
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-12 col-sm-3  text-right dirRight goLeft">
                            <span id="ContentPlaceHolder1_Label2" class="control-label formLabel" style="color: #666666; font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,StuCount%>" /></span>
                            <span class="fa fa-arrow-circle-down"></span>
                            <br />
                            <span runat="server" id="lblStudentsCount" class="control-label formLabel" style="color: #0066CC; font-size: 100%; font-weight: bold;"></span>
                        </div>
                        <div class="col-xs-12 col-sm-3  text-right dirRight goLeft">
                            <span id="ContentPlaceHolder1_Label4" class="control-label formLabel" style="color: #666666; font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,LessonTitle%>" /></span>
                            <span class="fa fa-arrow-circle-down"></span>
                            <br />
                            <span runat="server" id="lblLesson" class="control-label formLabel" style="color: #0066CC; font-size: 100%; font-weight: bold;"></span>
                        </div>
                        <div class="col-xs-12 col-sm-3  text-right dirRight goLeft">
                            <span id="ContentPlaceHolder1_Label3" class="control-label formLabel" style="color: #666666; font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Class%>" /></span>
                            <span class="fa fa-arrow-circle-down"></span>
                            <br />
                            <span runat="server" id="lblClass" class="control-label formLabel" style="color: #0066CC; font-size: 100%; font-weight: bold;"></span>
                        </div>

                        <div class="col-xs-12 col-sm-3 text-right dirRight goLeft">
                            <span id="ContentPlaceHolder1_Label1" class="control-label formLabel" style="color: #666666; font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,TeacherFName%>" /></span>
                            <span class="fa fa-arrow-circle-down"></span>
                            <br />
                            <span runat="server" id="lblTeacherName" class="control-label formLabel" style="color: #0066CC; font-size: 100%; font-weight: bold;"></span>
                        </div>
                    </div>
                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div>
                            <asp:GridView ID="gvSelectedStudents" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" CssClass="dirRight table"
                                HorizontalAlign="Center" OnRowDataBound="gvSelectedStudents_RowDataBound" AllowCustomPaging="True" AllowPaging="True"
                                OnSelectedIndexChanged="gvSelectedStudents_SelectedIndexChanged" OnRowEditing="gvSelectedStudents_RowEditing"
                                OnRowCommand="gvSelectedStudents_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="OzviatID" HeaderText="شناسه " />
                                    <asp:BoundField DataField="StudentCode" HeaderText="شماره دانش آموزی " />
                                    <asp:BoundField DataField="FirstName" HeaderText="نام" />
                                    <asp:BoundField DataField="LastName" HeaderText="نام خانوادگی" />
                                    <asp:BoundField DataField="FatherName" HeaderText="نام پدر" />

                                    <asp:TemplateField>
                                        <ItemTemplate>

                                            <asp:Button ID="Details" runat="server"
                                                CommandName="Details"
                                                CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                Text="<%$ Resources:Dashboard,Details%>" />

                                            <asp:Button OnClientClick="if(!confirm('ایا مطمئن هستید؟')) return false;" ID="Delet" runat="server"
                                                CommandName="Delet"
                                                CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                Text="<%$ Resources:Dashboard,delete%>" />
                                        </ItemTemplate>
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
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="ln_solid"></div>
                <div class="row">
                    <div class="col-md-8 hidden-xs">
                        <label style="padding-top: 5px;">
                            نمایش
                                <select name="ctl00$ContentPlaceHolder1$ddlValidPageSize" onchange="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$ddlValidPageSize\',\'\')', 0)" id="ContentPlaceHolder1_ddlValidPageSize" style="font-weight: normal;">
                                    <option selected="selected" value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="75">75</option>
                                    <option value="100">100</option>
                                </select>
                            رکورد
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-12" style="margin-left: -20px;">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-12 text-right dirRight goRight">
                                    <span class="fa fa-arrow-left"></span>
                                    <span id="ContentPlaceHolder1_Label5" style="color: Green;">
                                        <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Students%>" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ln_solid"></div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div>
                            <asp:GridView ID="gvStudents" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" CssClass="dirRight table"
                                HorizontalAlign="Center" OnRowDataBound="gvStudents_RowDataBound" AllowCustomPaging="True" AllowPaging="True"
                                OnSelectedIndexChanged="gvStudents_SelectedIndexChanged" OnRowEditing="gvStudents_RowEditing"
                                OnRowCommand="gvStudents_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="StudentCode" HeaderText="شماره دانش آموزی " />
                                    <asp:BoundField DataField="FirstName" HeaderText="نام" />
                                    <asp:BoundField DataField="LastName" HeaderText="نام خانوادگی" />
                                    <asp:BoundField DataField="FathersFirstName" HeaderText="نام پدر" />

                                    <asp:TemplateField>
                                        <ItemTemplate>

                                            <asp:Button ID="Details" runat="server"
                                                CommandName="Details"
                                                CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                Text="<%$ Resources:Dashboard,Details%>" />

                                            <asp:Button ID="Add" runat="server"
                                                CommandName="Add"
                                                CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                Text="<%$ Resources:Dashboard,Add%>" />
                                        </ItemTemplate>
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
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>

                        <div class="modal fade" id="modalShowDetails" tabindex="-1" role="dialog" aria-labelledby="modalAskSubmitUpdate-label" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="modalAskSubmitUpdate-label">هشدار

                                                    <span class="glyphicon glyphicon-warning-sign"></span>
                                        </h4>
                                    </div>
                                    <div class="modal-body" id="divtoprint">

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                    <span id="lblStudentCode" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                        <asp:Literal runat="server" Text="<%$ Resources:Dashboard,shomare_daneshamozi%>" />
                                                    </span>
                                                </div>

                                                <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">

                                                    <span id="tbxStudentCode" runat="server" class="form-control control-label formLabel"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                                                    <span id="lblcodemelli" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                                        <asp:Literal runat="server" Text="<%$ Resources:Dashboard,codemelli%>" />
                                                    </span>
                                                </div>

                                                <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">

                                                    <span id="tbxNatinalCode" runat="server" class="form-control control-label formLabel"></span>
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
                                                    <textarea name="ctl00$ContentPlaceHolder1$tbxAddress" rows="2" cols="20" runat="server" id="tbxAddress" class="form-control text-right dirRight"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="row">
                                            <div class="col-xs-12 text-center">
                                                <button type="button" class="btn btn-default " data-dismiss="modal">
                                                    <asp:Literal runat="server" Text="<%$ Resources:Dashboard,back%>" />
                                                </button>
                                                <button type="button" id="btnPrint" class="btn btn-default" onclick=" my()">print</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="form-group">
                    <%-- <div class="col-xs-4 text-left">
                        <a href="http://localhost:4911/Dashboard/Admin/Lessons.aspx" class="btn btn-default">
                            <span class="fa fa-chevron-left"></span>
                            <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Back%>" />
                        </a>
                    </div>
                    <div class="col-xs-8 text-right">

                        <asp:Button ID="btnSabtLesson" name="btnSabt" class="btn btn-primary" runat="server"
                            Text="<%$ Resources:Dashboard,sabt%>" OnClick="btnSabtLesson_Click" />
                    </div>--%>
                </div>

                <div class="extra" style="height: 100px">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
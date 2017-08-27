<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/Dashboard.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="WebPages.Dashboard.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="Styles/bootstrap.css" rel="stylesheet" />
    <link href="Styles/simple-sidebar.css" rel="stylesheet" />
    <link href="Styles/AdminPanelStyles.css" rel="stylesheet" />

    <%--  <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/simple-sidebar.css" rel="stylesheet" />--%>
    <link href="font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="c-title">
        <h4>مشخصات شخصی</h4>
    </div>
    <div class="c-content">
        <div id="demo-form2" class="form-horizontal form-label-right">
            <div class="col-md-6 col-md-offset-3 col-xs-12">
                <%--ssasa--%>
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_StuID" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,shomare_daneshamozi%>" />
                            </span>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <span id="lblStuID" runat="server" class="form-control control-label formLabel"></span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_StudentCode" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,shomare_daneshamozi%>" />
                            </span>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <span id="lblStudentCode" runat="server" class="form-control control-label formLabel"></span>
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
                            <span id="lblFirstName" runat="server" class="form-control control-label formLabel"></span>
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
                            <span id="lblLastName" runat="server" class="form-control control-label formLabel"></span>
                        </div>
                    </div>
                </div>

                <div class="ln_solid"></div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_FatherName" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,father_name%>" />
                            </span>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <input name="ctl00$ContentPlaceHolder1$tbxFatherName" type="text" maxlength="50" id="tbxFatherName" runat="server" class="form-control text-right dirRight" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_BirthYear" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,birthday%>" />
                            </span>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <input name="ctl00$ContentPlaceHolder1$tbxBirthYear" type="text" maxlength="50" id="tbxBirthYear" runat="server" class="form-control text-right dirRight" />
                            <%--<asp:TextBox name="ctl00$ContentPlaceHolder1$tbxBirthYear" ID="tbxBirthYear" class="form-control text-right dirRight" MaxLength="50" runat="server"></asp:TextBox>--%>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_IDNumber" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,codemelli%>" />
                            </span>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <input name="ctl00$ContentPlaceHolder1$tbxIDNumber" type="text" maxlength="50" id="tbxIDNumber" runat="server" class="form-control text-right dirRight" />
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
                            <input name="ctl00$ContentPlaceHolder1$tbxFixTel" type="text" maxlength="15" id="tbxFixTel" runat="server" class="form-control text-right dirRight" />
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
                            <input name="ctl00$ContentPlaceHolder1$tbxMobile" type="text" maxlength="11" id="tbxMobile" runat="server" class="form-control text-right dirRight" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_ZipCode" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,postal_code%>" />
                            </span>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <input name="ctl00$ContentPlaceHolder1$tbxZipCode" type="text" maxlength="10" id="tbxZipCode" runat="server" class="form-control text-right dirRight" />
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
                            <input name="ctl00$ContentPlaceHolder1$tbxEmail" type="text" maxlength="250" id="tbxEmail" runat="server" class="form-control text-right dirRight">
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
                            <textarea name="ctl00$ContentPlaceHolder1$tbxAddress" rows="2" cols="20" id="tbxAddress" runat="server" class="form-control text-right dirRight"></textarea>
                        </div>
                    </div>
                </div>

                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-xs-4 text-left">
                        <a href="http://localhost:4911/Dashboard/Dashboard.aspx" class="btn btn-default">
                            <span class="fa fa-chevron-left">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Back%>" /></span>
                        </a>
                    </div>
                    <div class="col-xs-8 text-right">

                        <asp:Button ID="btnSabtEditProfile" name="btnSabt" class="btn btn-primary" runat="server"
                            Text="<%$ Resources:Dashboard,sabt%>" OnClientClick="if(!confirm('ایا مطمئن هستید؟')) return false;" />
                    </div>
                </div>

                <div class="extra" style="height: 100px">
                </div>
            </div>
        </div>
    </div>
    <script src="JavaScript/JavaScript.js"></script>
</asp:Content>
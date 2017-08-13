﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="AddLessonGroup.aspx.cs" Inherits="WebPages.Dashboard.Admin.AddLessonGroup" %>

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
            <asp:Literal runat="server" Text="<%$ Resources:Dashboard,NewLesson%>" /></h4>
    </div>
    <div class="x_content">
        <div id="demo-form2" class="form-horizontal form-label-right">
            <div class="col-md-6 col-md-offset-3 col-xs-12">

                <div class="form-group ">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_Grade" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,GradeTitle%>" />
                            </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <asp:DropDownList ID="Grade" CssClass="select2_group form-control"
                                runat="server" Height="40px">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group ">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_Field" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Field%>" />
                            </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <asp:DropDownList ID="Field" CssClass="select2_group form-control"
                                runat="server" Height="40px">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group ">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_Class" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Class%>" />
                            </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <asp:DropDownList ID="Class" CssClass="select2_group form-control"
                                runat="server" Height="40px">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group ">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_Day" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Day%>" />
                            </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <asp:DropDownList ID="Day" CssClass="select2_group form-control"
                                runat="server" Height="40px">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group ">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_Time" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Time%>" />
                            </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <asp:DropDownList ID="Time" CssClass="select2_group form-control"
                                runat="server" Height="40px">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group ">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_LessonTitle" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,LessonTitle%>" />
                            </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <asp:DropDownList ID="LessonDrpDList" CssClass="select2_group form-control"
                                runat="server" Height="40px">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group ">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_TeacherFName" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,TeacherFName%>" />
                            </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <asp:DropDownList ID="Teacher" CssClass="select2_group form-control"
                                runat="server" Height="40px">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group ">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_Year" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Year%>" />
                            </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <asp:DropDownList ID="Year" CssClass="select2_group form-control"
                                runat="server" Height="40px">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group AddLesson">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-sm-push-8 text-right">
                            <span id="ContentPlaceHolder1_lbl_tbxYear" class="control-label formLabel" style="font-size: 100%; font-weight: bold;">
                                <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Year%>" />
                            </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-sm-pull-4 text-right">
                            <asp:TextBox ID="tbxYear" runat="server" class="form-control text-right dirRight"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-xs-4 text-left">
                        <a href="http://localhost:4911/Dashboard/Admin/LessonGroups.aspx" class="btn btn-default">
                            <span class="fa fa-chevron-left"></span>
                            <asp:Literal runat="server" Text="<%$ Resources:Dashboard,Back%>" />
                        </a>
                    </div>
                    <div class="col-xs-8 text-right">

                        <button type="button" runat="server" id="asf" class="btn btn-primary" onserverclick="btnSabtLessonGroup_Click">ثبت</button>
                    </div>
                    <div class="extra" style="height: 100px">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
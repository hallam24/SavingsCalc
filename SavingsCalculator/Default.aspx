<%@ Page Title="Savings calculator" Language="C#"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SavingsCalculator._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="Styles/bootstrap.css" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu+Mono" rel="stylesheet" type="text/css"/> 
    <link rel="stylesheet" href="Styles/Styles.css" />
    <script src="Scripts/canvasjs.min.js"></script>
    <script src="Scripts/chartScript.js"></script>
    <title></title>
</head>
    <body>
    <div class="container heading">
        <div class="model text-center">
            <h1>Savings Calculator</h1>
            <h3>Enter your monthly earnings before or after tax and any expenditures (per month) to see how much you can save.
            </h3>
        </div>
    </div>
    <hr class="top"/>
    <form id="form1" runat="server" class="form-horizontal">
        <div class="container content">
            <br />
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div id="chartContainer" style="height: 400px; width: 100%;">
                                <div id="chartPlaceholder"></div>
                                <div id="noDataPlaceholder" class="h1"></div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <asp:label ID="lblChartType" runat="server" Visible="False">Change chart type</asp:label>
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"
                                Font-Size="Medium" ForeColor="Black" Visible="False" CausesValidation="True">
                                <asp:ListItem Value="pie" Selected="True">Pie</asp:ListItem>
                                <asp:ListItem Value="doughnut">Doughnut</asp:ListItem>
                                <asp:ListItem Value="column">Column</asp:ListItem>
                                <asp:ListItem Value="bar">Bar</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <asp:ValidationSummary ID="vs" runat="server" CssClass="alert-danger" HeaderText="Enter only digits in the following fields:" 
                    BorderStyle="Solid" BorderWidth="2px" BorderColor="Red" />
                <br />
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <label class="control-label">Monthly Earnings</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="tbMEarn" runat="server" CssClass="form-control txtBox" Width="100px"></asp:TextBox>
                            <asp:CompareValidator ID="cvMEarn" runat="server" ControlToValidate="tbMEarn" Type="Currency"
                                Operator="DataTypeCheck" Text="*" ErrorMessage="MEarn" Display="Static" CssClass="text-danger"></asp:CompareValidator>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                            <div class="col-md-4 col-md-offset-1">
                            <label class="control-label">Before Tax</label>
                        </div>
                        <div class="col-md-6">
                            <label style="font-size: 2em">
                                <asp:CheckBox ID="BTaxBtn" runat="server" />
                                <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                            </label>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <label class="control-label">Rent</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="tbRent" runat="server" CssClass="form-control txtBox" Width="100px"></asp:TextBox>
                            <asp:CompareValidator ID="cvRent" runat="server" ControlToValidate="tbRent" Type="Currency"
                                Operator="DataTypeCheck" Text="*" ErrorMessage="Rent" Display="Static" CssClass="text-danger"></asp:CompareValidator>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <label class="control-label">Food</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="tbFood" runat="server" CssClass="form-control txtBox" Width="100px"></asp:TextBox>
                            <asp:CompareValidator ID="cvFood" runat="server" ControlToValidate="tbFood" Type="Currency"
                                Operator="DataTypeCheck" Text="*" ErrorMessage="Food" Display="Static" CssClass="text-danger"></asp:CompareValidator>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <label class="control-label">Utilities</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="tbUtil" runat="server" CssClass="form-control txtBox" Width="100px"></asp:TextBox>
                            <asp:CompareValidator ID="cvUtil" runat="server" ControlToValidate="tbUtil" Type="Currency"
                                Operator="DataTypeCheck" Text="*" ErrorMessage="Utilities" Display="Static" CssClass="text-danger"></asp:CompareValidator>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <label class="control-label">Transport</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="tbTransport" runat="server" CssClass="form-control txtBox" Width="100px"></asp:TextBox>
                            <asp:CompareValidator ID="cTransport" runat="server" ControlToValidate="tbTransport" Type="Currency"
                                Operator="DataTypeCheck" Text="*" ErrorMessage="Transport" Display="Static" CssClass="text-danger"></asp:CompareValidator>
                        </div>
                    </div>
                    
                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <label class="control-label">Hobbies</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="tbHobbies" runat="server" CssClass="form-control txtBox" Width="100px"></asp:TextBox>
                            <asp:CompareValidator ID="cvHobbies" runat="server" ControlToValidate="tbHobbies" Type="Currency"
                                Operator="DataTypeCheck" Text="*" ErrorMessage="Hobbies" Display="Static" CssClass="text-danger"></asp:CompareValidator>
                        </div>
                    </div>

                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1"></div>
                        <div class="col-md-6">
                            <asp:Button ID="btnCalculate" runat="server" Text="Calculate" cssclass="btn-primary" OnClick="btnCalculate_Click" />
                        </div>
                    </div>
                    <br />
                </div>
                
            </div>
        </div>
    </form>
</body>
</html>

<%--<br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <label class="control-label">Hotel</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="tbHotelNights" runat="server" CssClass="form-control" Style="display: inline;" Width="50px"></asp:TextBox>
                            <asp:CompareValidator ID="cvHotelNights" runat="server" ControlToValidate="tbHotelNights" Type="Currency"
                                Operator="DataTypeCheck" Text="*" ErrorMessage="Hotel Nights" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
                            nights at
                            <asp:TextBox ID="tbHotelPerNight" runat="server" CssClass="form-control" Style="display: inline;" Width="50px"></asp:TextBox>
                            /night
                            <asp:CompareValidator ID="cvHotelPerNight" runat="server" ControlToValidate="tbHotelPerNight" Type="Currency"
                                Operator="DataTypeCheck" Text="*" ErrorMessage="Hotel price per night" Display="Static" CssClass="text-danger"></asp:CompareValidator>
                        </div>
                    </div>
                  <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <label class="control-label">Spending Money</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="tbSpendingMoney" runat="server" CssClass="form-control txtBox" Width="100px"></asp:TextBox>
                            <asp:CompareValidator ID="cvSpending" runat="server" ControlToValidate="tbSpendingMoney" Type="Currency"
                                Operator="DataTypeCheck" Text="*" ErrorMessage="Spending Money" Display="Static" CssClass="text-danger"></asp:CompareValidator>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <label class="control-label">Miscellaneous</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="tbMisc" runat="server" CssClass="form-control txtBox" Width="100px"></asp:TextBox>
                            <asp:CompareValidator ID="cvMisc" runat="server" ControlToValidate="tbMisc" Type="Currency"
                                Operator="DataTypeCheck" Text="*" ErrorMessage="Miscellaneous" Display="Static" CssClass="text-danger"></asp:CompareValidator>
                        </div>
                    </div>--%>
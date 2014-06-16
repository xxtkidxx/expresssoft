﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SOQUYTIENMATV2.ascx.cs"
    Inherits="module_SOQUYTIENMATV2" %>
<%@ Register TagPrefix="uc1" Namespace="ITCLIB.Admin" %>
<telerik:RadCodeBlock ID="RadCodeBlockSOQUYTIENMATV2" runat="server">
    <script type="text/javascript">
    function RowDblClick(sender, eventArgs) {
            var CanEdit = "<%=ITCLIB.Security.Security.CanEditModule("TAICHINH") %>";
            if ((eventArgs.get_tableView().get_name() == "MasterTableViewSOQUYTIENMATV2") && (CanEdit == "True")) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
    }   
    </script>
    <script type="text/javascript">
        var registeredElementsNG = [];
        function GetRegisteredServerElementNG(serverID) {
            var clientID = "";
            for (var i = 0; i < registeredElementsNG.length; i++) {
                clientID = registeredElementsNG[i];
                if (clientID.indexOf(serverID) >= 0)
                    break;
            }
            return $get(clientID);
        }
        function GetGridServerElementNG(serverID, tagName) {
            if (!tagName)
                tagName = "*";

            var grid = $get("<%=RadGridSOQUYTIENMATV2.ClientID %>");
            var elements = grid.getElementsByTagName(tagName);
            for (var i = 0; i < elements.length; i++) {
                var element = elements[i];
                if (element.id.indexOf(serverID) >= 0)
                    return element;
            }
        }
    </script>
    <script type="text/javascript">
        function cmbDayClientSelectedIndexChangedHandler(sender, eventArgs) {
            $find("<%=RadGridSOQUYTIENMATV2.ClientID %>").get_masterTableView().rebind();
            return false;
        }
        function cmbYearClientSelectedIndexChangedHandler(sender, eventArgs) {
            $find("<%=RadGridSOQUYTIENMATV2.ClientID %>").get_masterTableView().rebind();
            return false;
        }
        function cmbMonthClientSelectedIndexChangedHandler(sender, eventArgs) {
            $find("<%=RadGridSOQUYTIENMATV2.ClientID %>").get_masterTableView().rebind();
            return false;
        }
    </script>
    <div style="width: 100%; margin: 10px 10px 10px 10px;">
        Chọn ngày:&nbsp;
        <telerik:RadComboBox ID="cmbDay" runat="server" OnClientSelectedIndexChanged="cmbDayClientSelectedIndexChangedHandler"
            ShowToggleImage="True" EmptyMessage="Chọn ngày" OnPreRender="cmbDay_PreRender">
            <Items>
                <telerik:RadComboBoxItem Value="0" Text="Tất cả" />
                <telerik:RadComboBoxItem Value="1" Text="1" />
                <telerik:RadComboBoxItem Value="2" Text="2" />
                <telerik:RadComboBoxItem Value="3" Text="3" />
                <telerik:RadComboBoxItem Value="4" Text="4" />
                <telerik:RadComboBoxItem Value="5" Text="5" />
                <telerik:RadComboBoxItem Value="6" Text="6" />
                <telerik:RadComboBoxItem Value="7" Text="7" />
                <telerik:RadComboBoxItem Value="8" Text="8" />
                <telerik:RadComboBoxItem Value="9" Text="9" />
                <telerik:RadComboBoxItem Value="10" Text="10" />
                <telerik:RadComboBoxItem Value="11" Text="11" />
                <telerik:RadComboBoxItem Value="12" Text="12" />
                <telerik:RadComboBoxItem Value="13" Text="13" />
                <telerik:RadComboBoxItem Value="14" Text="14" />
                <telerik:RadComboBoxItem Value="15" Text="15" />
                <telerik:RadComboBoxItem Value="16" Text="16" />
                <telerik:RadComboBoxItem Value="17" Text="17" />
                <telerik:RadComboBoxItem Value="18" Text="18" />
                <telerik:RadComboBoxItem Value="19" Text="19" />
                <telerik:RadComboBoxItem Value="20" Text="20" />
                <telerik:RadComboBoxItem Value="21" Text="21" />
                <telerik:RadComboBoxItem Value="22" Text="22" />
                <telerik:RadComboBoxItem Value="23" Text="23" />
                <telerik:RadComboBoxItem Value="24" Text="24" />
                <telerik:RadComboBoxItem Value="25" Text="25" />
                <telerik:RadComboBoxItem Value="26" Text="26" />
                <telerik:RadComboBoxItem Value="27" Text="27" />
                <telerik:RadComboBoxItem Value="28" Text="28" />
                <telerik:RadComboBoxItem Value="29" Text="29" />
                <telerik:RadComboBoxItem Value="30" Text="30" />
                <telerik:RadComboBoxItem Value="31" Text="31" />
            </Items>
        </telerik:RadComboBox>
        Chọn tháng:&nbsp;
        <telerik:RadComboBox ID="cmbMonth" runat="server" OnClientSelectedIndexChanged="cmbMonthClientSelectedIndexChangedHandler"
            ShowToggleImage="True" EmptyMessage="Chọn tháng" OnPreRender="cmbMonth_PreRender">
            <Items>
                <telerik:RadComboBoxItem Value="1" Text="Tháng 1" />
                <telerik:RadComboBoxItem Value="2" Text="Tháng 2" />
                <telerik:RadComboBoxItem Value="3" Text="Tháng 3" />
                <telerik:RadComboBoxItem Value="4" Text="Tháng 4" />
                <telerik:RadComboBoxItem Value="5" Text="Tháng 5" />
                <telerik:RadComboBoxItem Value="6" Text="Tháng 6" />
                <telerik:RadComboBoxItem Value="7" Text="Tháng 7" />
                <telerik:RadComboBoxItem Value="8" Text="Tháng 8" />
                <telerik:RadComboBoxItem Value="9" Text="Tháng 9" />
                <telerik:RadComboBoxItem Value="10" Text="Tháng 10" />
                <telerik:RadComboBoxItem Value="11" Text="Tháng 11" />
                <telerik:RadComboBoxItem Value="12" Text="Tháng 12" />
            </Items>
        </telerik:RadComboBox>
        Chọn năm:&nbsp;
        <telerik:RadComboBox ID="cmbYear" runat="server" OnClientSelectedIndexChanged="cmbYearClientSelectedIndexChangedHandler"
            ShowToggleImage="True" EmptyMessage="Chọn năm" OnPreRender="cmbYear_PreRender">
            <Items>
            </Items>
        </telerik:RadComboBox>
    </div>
</telerik:RadCodeBlock>
<telerik:RadAjaxLoadingPanel Skin="Vista" ID="RadAjaxLoadingPanelSOQUYTIENMATV2"
    runat="server" />
<telerik:RadAjaxPanel ID="RadAjaxPanelSOQUYTIENMATV2" runat="server" Height="200px"
    Width="100%">
    <style type="text/css">
        table.gridtable
        {
            font-family: verdana,arial,sans-serif;
            font-size: 13px;
            color: #333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
            width: 50%;
            margin: 10px 10px 10px 10px;
        }
        table.gridtable th
        {
            border-width: 1px;
            padding: 8px;
            font-weight: bold;
            border-style: solid;
            border-color: #666666;
            background-color: #dedede;
        }
        table.gridtable td
        {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
    </style>
    <table class="gridtable">
        <tr>
            <th>
                Tồn đầu
            </th>
            <th>
                Tổng thu
            </th>
            <th>
                Tổng chi
            </th>
            <th>
                Tồn cuối
            </th>
            <th>
                Tồn thực tế
            </th>
        </tr>
        <tr>
            <td>
                <telerik:RadNumericTextBox ID="txtTONDAU" Enabled="false" ForeColor="Red" Width="90%"
                    runat="server">
                    <NumberFormat DecimalSeparator="." GroupSeparator=" " DecimalDigits="0" />
                </telerik:RadNumericTextBox>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="txtTONGTHU" Enabled="false" ForeColor="Red" Width="90%"
                    runat="server">
                    <NumberFormat DecimalSeparator="." GroupSeparator=" " DecimalDigits="0" />
                </telerik:RadNumericTextBox>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="txtTONGCHI" Enabled="false" ForeColor="Red" Width="90%"
                    runat="server">
                    <NumberFormat DecimalSeparator="." GroupSeparator=" " DecimalDigits="0" />
                </telerik:RadNumericTextBox>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="txtTONCUOI" Enabled="false" ForeColor="Red" Width="90%"
                    runat="server">
                    <NumberFormat DecimalSeparator="." GroupSeparator=" " DecimalDigits="0" />
                </telerik:RadNumericTextBox>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="txtTONTHUCTE" Enabled="false" ForeColor="Red" Width="90%"
                    runat="server">
                    <NumberFormat DecimalSeparator="." GroupSeparator=" " DecimalDigits="0" />
                </telerik:RadNumericTextBox>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="RadGridSOQUYTIENMATV2" runat="server" Skin="Vista" AllowPaging="True"
        PageSize="50" AllowSorting="True" AllowFilteringByColumn="True" GridLines="None"
        ShowStatusBar="True" AutoGenerateColumns="False" AllowMultiRowEdit="True" AllowAutomaticDeletes="True"
        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="SOQUYTIENMATV2DataSource"
        ShowFooter="True" OnDataBound="RadGridSOQUYTIENMATV2_DataBound" OnItemDeleted="RadGridSOQUYTIENMATV2_ItemDeleted"
        OnItemInserted="RadGridSOQUYTIENMATV2_ItemInserted" OnItemUpdated="RadGridSOQUYTIENMATV2_ItemUpdated"
        OnItemCommand="RadGridSOQUYTIENMATV2_ItemCommand" OnItemDataBound="RadGridSOQUYTIENMATV2_ItemDataBound"
        CellSpacing="0" OnItemCreated="RadGridSOQUYTIENMATV2_ItemCreated">
        <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true"
            OpenInNewWindow="true" Excel-Format="ExcelML">
        </ExportSettings>
        <GroupingSettings CaseSensitive="false" />
        <MasterTableView Name="MasterTableViewSOQUYTIENMATV2" CommandItemDisplay="Top" DataSourceID="SOQUYTIENMATV2DataSource"
            DataKeyNames="PK_ID" ClientDataKeyNames="PK_ID" EditMode="PopUp" NoMasterRecordsText="Không có dữ liệu">
            <CommandItemTemplate>
                <div style="padding: 5px 5px; float: left; width: auto">
                    <b>Quản lý sổ quỹ tiền mặt</b>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGridSOQUYTIENMATV2.EditIndexes.Count == 0 && ITCLIB.Security.Security.CanEditModule("TAICHINH") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Edit.gif" />Sửa</asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGridSOQUYTIENMATV2.EditIndexes.Count > 0 %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Update.gif" />Lưu</asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGridSOQUYTIENMATV2.EditIndexes.Count > 0 || RadGridSOQUYTIENMATV2.MasterTableView.IsItemInserted %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Cancel.gif" />Hủy bỏ</asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGridSOQUYTIENMATV2.MasterTableView.IsItemInserted && ITCLIB.Security.Security.CanAddModule("TAICHINH") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/AddRecord.gif" />Thêm</asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGridSOQUYTIENMATV2.MasterTableView.IsItemInserted %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Insert.gif" />Lưu</asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Bạn có muốn xóa bản ghi đã chọn không?')"
                        runat="server" CommandName="DeleteSelected" Visible='<%# ITCLIB.Security.Security.CanDeleteModule("TAICHINH") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Delete.gif" />Xóa</asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Refresh.gif" />Làm mới</asp:LinkButton>
                </div>
                <div style="padding: 5px 5px; float: right; width: auto">
                    <asp:LinkButton ID="ExportToPdfButton" runat="server" CommandName="ExportToPdf"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/pdf.gif" /></asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="ExportToWordButton" runat="server" CommandName="ExportToWord"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/word.gif" /></asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="ExportToExcelButton" runat="server" CommandName="ExportToExcel"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/excel.gif" /></asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="ExportToCsvButton" runat="server" CommandName="ExportToCsv"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/csv.gif" /></asp:LinkButton>&nbsp;&nbsp;
                </div>
            </CommandItemTemplate>
            <Columns>
                <telerik:GridBoundColumn UniqueName="PK_ID" HeaderText="" DataField="PK_ID" Visible="false"
                    AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false"
                    FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn UniqueName="SOCHUNGTU" DataField="SOCHUNGTU" HeaderText="Số chứng từ"
                    ShowFilterIcon="false">
                    <FilterTemplate>
                        <center>
                            <asp:ImageButton ID="btnShowAll" runat="server" ImageUrl="../Images/Grid/filterCancel.gif"
                                AlternateText="Xem tất" ToolTip="Xem tất" OnClick="btnShowAll_Click" Style="vertical-align: middle" />
                        </center>
                    </FilterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSTT" runat="server" Text='<%# Eval( "SOCHUNGTU") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="50px" />
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn UniqueName="C_NGAY" HeaderText="Ngày" DataField="C_NGAY"
                    HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true"
                    ShowFilterIcon="false" FilterControlWidth="100%" DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_TYPE" HeaderText="Loại" DataField="C_TYPE"
                    HeaderStyle-Width="60px" HeaderStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true"
                    CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="KIHIEUTAIKHOANNAME" HeaderText="Nội dung" DataField="KIHIEUTAIKHOANNAME"
                    HeaderStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true"
                    CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_DESC" HeaderText="Diễn giải" DataField="C_DESC"
                    HeaderStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true"
                    CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn UniqueName="C_SOTIEN" HeaderText="Số tiền" DataField="C_SOTIEN"
                    HeaderStyle-Width="110px" HeaderStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true"
                    CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                    <ItemTemplate>
                        <telerik:RadNumericTextBox ID="txtC_SOTIEN" Enabled="false" Text='<%#Bind("C_SOTIEN")%>'
                            Width="90%" runat="server">
                            <NumberFormat DecimalSeparator="." GroupSeparator=" " DecimalDigits="0" />
                        </telerik:RadNumericTextBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="C_TON" HeaderText="Tồn" DataField="C_TON" HeaderStyle-Width="90px"
                    HeaderStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false" FilterControlWidth="100%">
                    <ItemTemplate>
                        <telerik:RadNumericTextBox ID="txtC_TON" Enabled="false" Text='<%#Bind("C_TON")%>' Width="90%" runat="server">
                            <NumberFormat DecimalSeparator="." GroupSeparator=" " DecimalDigits="0" />
                        </telerik:RadNumericTextBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
            <EditFormSettings InsertCaption="Thêm nhận gửi mới" CaptionFormatString="Sửa nhận gửi: <b>{0}</b>"
                CaptionDataField="C_DESC" EditFormType="Template" PopUpSettings-Width="900px">
                <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                </EditColumn>
                <FormTemplate>
                    <div class="headerthongtin">
                        <ul>
                            <li class="lifirst">
                                <asp:LinkButton ID="btnSave" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'><img src="Images/img_save.jpg" /><%# (Container is GridEditFormInsertItem) ? "Lưu" : "Lưu" %></asp:LinkButton></li>
                            <li class="lifirst">
                                <asp:LinkButton ID="btnSaveAddNew" runat="server" CommandName="PerformInsert" Visible='<%# Container is GridEditFormInsertItem %>'><img src="Images/img_save.jpg" /><%# (Container is GridEditFormInsertItem) ? "Lưu & Thêm mới" : "Lưu & Thêm mới" %></asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="btnClose" runat="server" CommandName="Cancel"><img src="Images/img_Close.jpg" />Đóng</asp:LinkButton></li>
                        </ul>
                    </div>
                    <div class="clearfix bgpopup">
                        <div style="width: 900px; height: 70px; background: #FFFFFF" class="clearfix">
                            <table id="tblEdit" class="TableEditInGrid" cellspacing="3" cellpadding="3" style="width: 100%"
                                border="0">
                                <tr>
                                    <td style="width: 100px;">
                                        <span class="rtsTxtnew">Ngày:
                                    </td>
                                    <td colspan="4">
                                        <telerik:RadDatePicker ID="radNgaySOQUYTIENMATV2" Width="150px" DbSelectedDate='<%# Bind("C_NGAY") %>'
                                            runat="server" AutoPostBack="false">
                                            <DateInput ID="DateInput1" runat="server" DateFormat="dd/MM/yyyy" MinDate="1/1/1890 12:00:00 AM">
                                                <ClientEvents OnKeyPress="controlkeypress" />
                                            </DateInput>
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="width: 100px;">
                                        <span class="rtsTxtnew">Loại:</span>
                                    </td>
                                    <td colspan="4">
                                        <asp:HiddenField ID="txtID" Value='<%# Eval( "PK_ID") %>' runat="server" />
                                        <telerik:RadComboBox ID="cmbC_TYPE" SelectedValue='<%# Bind("C_TYPE") %>' runat="server"
                                            EmptyMessage="Chọn">
                                            <Items>
                                                <telerik:RadComboBoxItem Value="Thu" Text="Thu" />
                                                <telerik:RadComboBoxItem Value="Chi" Text="Chi" />
                                                <telerik:RadComboBoxItem Value="Tồn cuối kỳ" Text="Tồn cuối kỳ" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px;">
                                        <span class="rtsTxtnew">Nội dung:</span>
                                    </td>
                                    <td colspan="4">
                                        <telerik:RadComboBox ID="cmbFK_KIHIEUTAIKHOAN" runat="server" DataTextField="C_NAME"
                                            DataValueField="C_CODE" DataSourceID="KIHIEUTAIKHOANDataSource" SelectedValue='<%# Bind("FK_KIHIEUTAIKHOAN") %>'
                                            ShowToggleImage="True" EmptyMessage="Chọn">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="width: 100px;">
                                        <span class="rtsTxtnew">Diễn giải:</span>
                                    </td>
                                    <td colspan="4">
                                        <telerik:RadTextBox ID="txtC_DESC" Width="90%" Text='<%# Bind("C_DESC") %>' runat="server">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="width: 100px;">
                                        <span class="rtsTxtnew">Số tiền:</span>
                                    </td>
                                    <td colspan="4">
                                        <telerik:RadNumericTextBox ID="txtC_SOTIEN" Width="90%" runat="server" Text='<%# Bind("C_SOTIEN") %>'>
                                            <NumberFormat DecimalSeparator="." GroupSeparator=" " DecimalDigits="0" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <tr>
                            </table>
                        </div>
                        </center>
                        <!-- end bgpopup-->
                    </div>
                </FormTemplate>
            </EditFormSettings>
        </MasterTableView>
        <ValidationSettings CommandsToValidate="PerformInsert,Update" ValidationGroup="G1" />
        <ClientSettings AllowKeyboardNavigation="true" KeyboardNavigationSettings-AllowSubmitOnEnter="true"
            ClientEvents-OnKeyPress="KeyPressed">
            <Selecting AllowRowSelect="True" EnableDragToSelectRows="True" />
            <ClientEvents OnPopUpShowing="PopUpShowing" />
            <ClientEvents OnRowDblClick="RowDblClick" />
            <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="350px" />
        </ClientSettings>
        <SortingSettings SortedAscToolTip="Sắp xếp tăng dần" SortedDescToolTip="Sắp xếp giảm dần"
            SortToolTip="Click để sắp xếp" />
        <StatusBarSettings LoadingText="Đang tải..." ReadyText="Sẵn sàng" />
    </telerik:RadGrid>
</telerik:RadAjaxPanel>
<asp:SqlDataSource ID="SOQUYTIENMATV2DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    DeleteCommand="DELETE FROM [SOQUYTIENMAT] WHERE [PK_ID] = @PK_ID" InsertCommand="INSERT INTO [SOQUYTIENMAT] ([C_NGAY], [C_TYPE], [FK_KIHIEUTAIKHOAN], [C_DESC], [C_SOTIEN], [C_TON],[C_ORDER],[FK_VUNGLAMVIEC]) VALUES (@C_NGAY, @C_TYPE, @FK_KIHIEUTAIKHOAN, @C_DESC, @C_SOTIEN, 0, @C_ORDER,@FK_VUNGLAMVIEC)" 
    SelectCommand="SELECT a.PK_ID,a.SOCHUNGTU,a.C_NGAY,a.C_TYPE,a.FK_KIHIEUTAIKHOAN,a.KIHIEUTAIKHOANNAME,a.C_DESC,a.C_SOTIEN,(CASE WHEN a.C_TYPE = N'Tồn cuối kỳ' THEN a.C_SOTIEN ELSE (Select sum(C_SOTIENFIX) from (SELECT (ROW_NUMBER() OVER(ORDER BY [SOQUYTIENMAT].C_ORDER ASC, [SOQUYTIENMAT].C_NGAY ASC, [SOQUYTIENMAT].PK_ID ASC) + 9999) AS SOCHUNGTU,(CASE WHEN C_TYPE=N'THU' THEN C_SOTIEN WHEN C_TYPE=N'CHI' THEN -C_SOTIEN ELSE (SELECT C_SOTIEN FROM SOQUYTIENMAT WHERE ([SOQUYTIENMAT].[FK_VUNGLAMVIEC] = N'Hà Nội' AND month([SOQUYTIENMAT].[C_NGAY]) = (CASE WHEN @MONTH = '1' THEN '12' ELSE @MONTH - 1 END) AND year([SOQUYTIENMAT].[C_NGAY]) = (CASE WHEN @MONTH = 1 THEN  @YEAR - 1 ELSE @YEAR END) AND [SOQUYTIENMAT].[C_TYPE] = N'Tồn cuối kỳ')) END) AS C_SOTIENFIX FROM [SOQUYTIENMAT] WHERE ([SOQUYTIENMAT].[FK_VUNGLAMVIEC] = N'Hà Nội' AND (day([SOQUYTIENMAT].[C_NGAY]) = @DAY OR @DAY = 0) AND month([SOQUYTIENMAT].[C_NGAY]) = @MONTH AND year([SOQUYTIENMAT].[C_NGAY]) = @YEAR AND [SOQUYTIENMAT].[C_SOTIEN] > 0) OR ([SOQUYTIENMAT].[C_TYPE] = N'Tồn đầu kỳ')) b where b.SOCHUNGTU <= a.SOCHUNGTU) END) as C_TON from (SELECT (ROW_NUMBER() OVER(ORDER BY [SOQUYTIENMAT].C_ORDER ASC, [SOQUYTIENMAT].C_NGAY ASC, [SOQUYTIENMAT].PK_ID ASC) + 9999) AS SOCHUNGTU,[SOQUYTIENMAT].[PK_ID], [SOQUYTIENMAT].[C_NGAY], [SOQUYTIENMAT].[C_TYPE], [SOQUYTIENMAT].[FK_KIHIEUTAIKHOAN], [SOQUYTIENMAT].[C_DESC], CASE WHEN [SOQUYTIENMAT].C_TYPE = N'Tồn đầu kỳ' THEN (SELECT C_SOTIEN FROM SOQUYTIENMAT WHERE ([SOQUYTIENMAT].[FK_VUNGLAMVIEC] = N'Hà Nội' AND month([SOQUYTIENMAT].[C_NGAY]) = (CASE WHEN @MONTH = 1 THEN '12' ELSE @MONTH - 1 END) AND year([SOQUYTIENMAT].[C_NGAY]) = (CASE WHEN @MONTH = 1 THEN @YEAR - 1 ELSE @YEAR END) AND [SOQUYTIENMAT].[C_TYPE] = N'Tồn cuối kỳ')) ELSE [SOQUYTIENMAT].C_SOTIEN END as C_SOTIEN,(CASE WHEN C_TYPE=N'THU' THEN C_SOTIEN WHEN C_TYPE=N'CHI' THEN -C_SOTIEN ELSE NULL END) AS C_SOTIENFIX,[SOQUYTIENMAT].[C_ORDER],DMKIHIEUTAIKHOAN.C_NAME as KIHIEUTAIKHOANNAME FROM [SOQUYTIENMAT] LEFT OUTER JOIN DMKIHIEUTAIKHOAN ON SOQUYTIENMAT.FK_KIHIEUTAIKHOAN=DMKIHIEUTAIKHOAN.C_CODE WHERE ([SOQUYTIENMAT].[FK_VUNGLAMVIEC] = N'Hà Nội' AND (day([SOQUYTIENMAT].[C_NGAY]) = @DAY OR @DAY = 0) AND month([SOQUYTIENMAT].[C_NGAY]) = @MONTH AND year([SOQUYTIENMAT].[C_NGAY]) = @YEAR AND [SOQUYTIENMAT].[C_SOTIEN] > 0) OR ([SOQUYTIENMAT].[C_TYPE] = N'Tồn đầu kỳ')) a" 
    UpdateCommand="UPDATE [SOQUYTIENMAT] SET [C_NGAY] = @C_NGAY, [C_TYPE] = @C_TYPE, [FK_KIHIEUTAIKHOAN] = @FK_KIHIEUTAIKHOAN,[C_DESC] = @C_DESC, [C_SOTIEN] = @C_SOTIEN WHERE [PK_ID] = @PK_ID">
    <SelectParameters>
        <asp:ControlParameter ControlID="cmbDay" Name="DAY" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="cmbMonth" Name="MONTH" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="cmbYear" Name="YEAR" PropertyName="SelectedValue" />
        <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="PK_ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="C_NGAY" Type="DateTime" />
        <asp:Parameter Name="C_TYPE" Type="String" />
        <asp:Parameter Name="FK_KIHIEUTAIKHOAN" Type="String" />
        <asp:Parameter Name="C_DESC" Type="String" />
        <asp:Parameter Name="C_SOTIEN" Type="String" DefaultValue="0" />
        <asp:Parameter Name="C_ORDER" Type="Int32" />
        <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="C_NGAY" Type="DateTime" />
        <asp:Parameter Name="C_TYPE" Type="String" />
        <asp:Parameter Name="FK_KIHIEUTAIKHOAN" Type="String" />
        <asp:Parameter Name="C_DESC" Type="String" />
        <asp:Parameter Name="C_SOTIEN" Type="String" DefaultValue="0" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="KIHIEUTAIKHOANDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    SelectCommand="SELECT DMKIHIEUTAIKHOAN.* FROM DMKIHIEUTAIKHOAN"></asp:SqlDataSource>

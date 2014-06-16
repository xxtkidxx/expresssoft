﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BAOGIA.ascx.cs" Inherits="module_BAOGIA" %>
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
        function OnKeyPressRadTextBox(sender, eventArgs) {
            var charCode = eventArgs.get_keyCode();
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                eventArgs.set_cancel(true);
            }
            return false;
        }
        var PK_ID, currentbaogia;
        var baogia =
        {
            PK_ID: null,
            C_CODE: null,
            C_DATE: null,
            FK_KHACHHANG: null,
            C_TENKH: null,
            C_SDT: null,
            C_NOIDUNG: null,
            FK_NGUOITAO: null,
            C_STATUS: null,
            create: function () {
                var obj = new Object();

                obj.PK_ID = "0";
                obj.C_CODE = "<%=GetMaxBG()%>";
                obj.C_DATE = new Date();
                obj.FK_KHACHHANG = "";
                obj.C_TENKH = "";
                obj.C_SDT = "";
                obj.C_NOIDUNG = "";
                obj.FK_NGUOITAO = "<%=Session["UserID"].ToString()%>";
                obj.C_STATUS = "Đang xử lý";
                return obj;
            }
        };

        function pageLoad(sender, args) {
            if ($find("<%=RadGridBAOGIA.ClientID %>").get_masterTableView().get_dataItems().length > 0) {
                PK_ID = $find("<%= RadGridBAOGIA.ClientID %>").get_masterTableView().get_dataItems()[0].getDataKeyValue("PK_ID");
            } else {
                PK_ID = "0";
            }
            $find("<%= txtC_CODE.ClientID %>").focus();
            var CanEdit = "<%=ITCLIB.Security.Security.CanEditModule("BAOGIA") %>";
            if (CanEdit == "True") {
                $get("<%= btnSave.ClientID %>").parentNode.style.display = "";
            }
            else {
                $get("<%= btnSave.ClientID %>").parentNode.style.display = "none";
            }
            var CanDelete = "<%=ITCLIB.Security.Security.CanDeleteModule("BAOGIA") %>";
            if (CanDelete == "True" && checkEdit) {
                $get("<%= btnDelete.ClientID %>").parentNode.style.display = "";
            }
            else {
                $get("<%= btnDelete.ClientID %>").parentNode.style.display = "none";
            }
        }

        function rowSelected(sender, args) {
            PK_ID = args.getDataKeyValue("PK_ID");
            $find("<%= RadTabStripBAOGIA.ClientID %>").set_selectedIndex(0);
            MyWebServiceBG.GetBAOGIAByPK_ID(PK_ID, setValues);
        }

        function setValues(baogia) {
            checkAjax = false;
            $get("<%= txtID.ClientID %>").value = baogia.PK_ID;
            $find("<%= txtC_CODE.ClientID %>").set_value(baogia.C_CODE);
            $find("<%= radC_DATE.ClientID %>").set_selectedDate(baogia.C_DATE);
            $find("<%= txtC_TENKH.ClientID %>").set_value(baogia.C_TENKH);
            $find("<%= txtC_SDT.ClientID %>").set_value(baogia.C_SDT);
            $find("<%= txtC_NOIDUNG.ClientID %>").set_value(baogia.C_NOIDUNG);
            $find("<%= cmbC_STATUS.ClientID %>").findItemByText(baogia.C_STATUS).select();
            $find("<%= txtC_CODE.ClientID %>").focus();
            if ($find("<%= cmbMaKhachHang.ClientID %>").findItemByText(baogia.FK_KHACHHANG) != null) {
                $find("<%= cmbMaKhachHang.ClientID %>").findItemByText(baogia.FK_KHACHHANG).select();
            } else {
                $find("<%= cmbMaKhachHang.ClientID %>").set_text("");
            }
            if ($find("<%= cmbFK_NGUOITAO.ClientID %>").findItemByValue(baogia.FK_NGUOITAO) != null) {
                $find("<%= cmbFK_NGUOITAO.ClientID %>").findItemByValue(baogia.FK_NGUOITAO).select();
            } else {
                $find("<%= cmbFK_NGUOITAO.ClientID %>").set_text("");
            }
            checkAjax = true;
            if (checkEdit) {
                $find("<%= RadListViewBAOGIAGIAIQUYET.ClientID %>").rebind();
            }
        }

        function getValues() {
            baogia.PK_ID = $get("<%= txtID.ClientID %>").value;           
            baogia.C_CODE = $find("<%= txtC_CODE.ClientID %>").get_value();
            baogia.C_DATE = $find("<%= radC_DATE.ClientID %>").get_selectedDate();
            baogia.C_TENKH = $find("<%= txtC_TENKH.ClientID %>").get_value();
            baogia.C_SDT = $find("<%= txtC_SDT.ClientID %>").get_value();
            baogia.C_NOIDUNG = $find("<%= txtC_NOIDUNG.ClientID %>").get_value();
            baogia.C_STATUS = $find("<%= cmbC_STATUS.ClientID %>").get_value();
            if ($find("<%= cmbMaKhachHang.ClientID %>").get_value() != "") {
                baogia.FK_KHACHHANG = $find("<%= cmbMaKhachHang.ClientID %>").get_value();
            } else {
                baogia.FK_KHACHHANG = "0";
            }           
            if ($find("<%= cmbFK_NGUOITAO.ClientID %>").get_value() != "") {
                baogia.FK_NGUOITAO = $find("<%= cmbFK_NGUOITAO.ClientID %>").get_value();
            } else {
                baogia.FK_NGUOITAO = "0";
            }
            return baogia;
        }

        function updateChanges() {
            if ($find("<%= cmbMaKhachHang.ClientID %>").get_value() != "" && $find("<%= cmbFK_NGUOITAO.ClientID %>").get_value() != "") {
                            MyWebServiceBG.UpdateBAOGIAByBAOGIA(getValues(), updateGrid);
                        } else {
                            alert("Hãy chọn khách hàng và người tạo báo giá");
                        }
                    }

                    function updateGrid(result) {
                        $find("<%= RadGridBAOGIA.ClientID %>").get_masterTableView().set_dataSource(result);
                        $find("<%= RadGridBAOGIA.ClientID %>").get_masterTableView().rebind();
        }
        checkAjax = true;
        checkEdit = true;
        function tabSelected(sender, args) {
            /*if (currentbaogia == null) {
                currentbaogia = getValues();
            }*/
            var elem = document.getElementById('divRadListView');
            switch (args.get_tab().get_index()) {
                case 1:
                    {
                        checkEdit = false;
                        $(elem).hide();
                        var newbaogia = baogia.create();
                        setValues(newbaogia);
                        $get("<%= btnSave.ClientID %>").value = "Thêm";
                        var CanAdd = "<%=ITCLIB.Security.Security.CanAddModule("BAOGIA") %>";
                        if (CanAdd == "True") {
                            $get("<%= btnSave.ClientID %>").parentNode.style.display = "";
                        }
                        else {
                            $get("<%= btnSave.ClientID %>").parentNode.style.display = "none";
                        }
                        $get("<%= btnDelete.ClientID %>").parentNode.style.display = "none";
                        break;
                    }
                default:
                    {
                        checkEdit = true;
                        $find("<%= RadGridBAOGIA.ClientID %>").get_masterTableView().selectItem(0);
                        $get("<%= btnSave.ClientID %>").value = "Lưu";
                        $get("<%= btnDelete.ClientID %>").parentNode.style.display = "";
                        break;
                    }
            }
        }

        function deleteCurrent() {
            MyWebServiceKN.DeleteBAOGIAByPK_ID($find("<%= RadGridBAOGIA.ClientID %>").get_masterTableView().get_selectedItems()[0].getDataKeyValue("PK_ID"), updateGrid);
        }

    </script>
    <script type="text/javascript">
        var cmbMaKhachHang;
        function OnClientLoadcmbMaKhachHang(sender) {
            cmbMaKhachHang = sender;
        }
        var txtC_TENKH;
        function OnClientLoadtxtC_TENKH(sender) {
            txtC_TENKH = sender;
        }
        var txtC_SDT;
        function OnClientLoadtxtC_SDT(sender) {
            txtC_SDT = sender;
        }
        function OnKeyPressRadTextBox(sender, eventArgs) {
            var charCode = eventArgs.get_keyCode();
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                eventArgs.set_cancel(true);
            }
            return false;
        }
        checkKH = true;
        function cmbMaKhachHangClientSelectedIndexChangedHandler(sender, eventArgs) {
            if (checkAjax && checkKH) {
                $find('<%=RadAjaxManager.GetCurrent(Page).ClientID %>').ajaxRequest("cmbMaKhachHang;" + eventArgs.get_item().get_value());
                var currentLoadingPanel = $find("<%= RadAjaxLoadingPanelBAOGIA.ClientID %>");
                var currentUpdatedControl = "<%= RadSplitterBAOGIA.ClientID %>";
                currentLoadingPanel.show(currentUpdatedControl);
            }
            return false;
        }
    </script>
    <script type="text/javascript">
        function onResponseEndBG() {
            if (typeof (result) != "undefined" && result && result != "") {
                //alert(result);
                var arrayOfStrings = result.split(",-,");
                if (arrayOfStrings[0] != "msg") {
                    if (arrayOfStrings[0] != "") {
                        if (!checkKH) {
                            var comboItem = new Telerik.Web.UI.RadComboBoxItem();
                            comboItem = cmbMaKhachHang.findItemByText(arrayOfStrings[0]);
                            comboItem.set_text(arrayOfStrings[0]);
                            cmbMaKhachHang.trackChanges();
                            comboItem.select();
                            cmbMaKhachHang.commitChanges();
                        }
                        txtC_TENKH.set_value(arrayOfStrings[1]);
                        txtC_SDT.set_value(arrayOfStrings[2]);
                    }
                    else {
                    }
                    checkKH = true;
                }
                var currentLoadingPanel = $find("<%= RadAjaxLoadingPanelBAOGIA.ClientID %>");
                var currentUpdatedControl = "<%= RadSplitterBAOGIA.ClientID %>";
                currentLoadingPanel.hide(currentUpdatedControl);
                result = "";
            }
            return false;
        }
    </script>
</telerik:RadCodeBlock>
<telerik:RadAjaxLoadingPanel Skin="Vista" ID="RadAjaxLoadingPanelBAOGIA" runat="server" />
<telerik:RadSplitter ID="RadSplitterBAOGIA" runat="server" Width="100%" Height="600px">
    <telerik:RadPane ID="LeftPaneBAOGIA" runat="server" Width="32%">
        <telerik:RadGrid ID="RadGridBAOGIA" DataSourceID="BAOGIADataSource" runat="server" OnItemCommand="RadGridBAOGIA_ItemCommand"
            Skin="Vista" AllowPaging="True" PageSize="20" AllowSorting="True" AllowFilteringByColumn="True" GridLines="None" ShowStatusBar="True"
            AutoGenerateColumns="False" OnDataBound="RadGridBAOGIA_DataBound" OnColumnCreated="RadGridBAOGIA_ColumnCreated" Height="590px">
            <MasterTableView Name="MasterTableViewBAOGIA" CommandItemDisplay="Top" DataSourceID="BAOGIADataSource" DataKeyNames="PK_ID" ClientDataKeyNames="PK_ID" EditMode="PopUp" NoMasterRecordsText="Không có dữ liệu">
                <CommandItemTemplate>
                    <div style="padding: 5px 5px; float: left; width: auto">
                        <b>Quản lý báo giá</b>&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:LinkButton ID="LinkButton11" runat="server" CommandName="ClearFilterGrid"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/filterCancel.gif" />Xóa tìm kiếm</asp:LinkButton>&nbsp;&nbsp;
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
                        AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="C_CODE" HeaderText="Mã BG" DataField="C_CODE" HeaderStyle-Width="45px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="C_DATE" HeaderText="Thời gian" DataField="C_DATE"
                        HeaderStyle-Width="90px" HeaderStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true"
                        ShowFilterIcon="true" FilterControlWidth="70%" DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy HH:mm}" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="FK_KHACHHANG" HeaderText="Mã khách hàng" DataField="FK_KHACHHANG"
                        HeaderStyle-Width="70px" HeaderStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true"
                        CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="C_TENKH" HeaderText="Tên khách hàng" DataField="C_TENKH"
                        HeaderStyle-Width="90px" HeaderStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true"
                        CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="C_SDT" HeaderText="Số điện thoại" DataField="C_SDT" HeaderStyle-Width="70px" HeaderStyle-HorizontalAlign="Center"
                        AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="C_NOIDUNG" HeaderText="Nội dung" DataField="C_NOIDUNG" HeaderStyle-Width="60px" HeaderStyle-HorizontalAlign="Center"
                        AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="FK_NGUOITAO" HeaderText="Người tạo fix" DataField="FK_NGUOITAO" HeaderStyle-Width="60px" HeaderStyle-HorizontalAlign="Center"
                        AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="NGUOITAONAME" HeaderText="Người tạo" DataField="NGUOITAONAME" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center"
                        AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="C_STATUS" HeaderText="Tình trạng" DataField="C_STATUS" HeaderStyle-Width="60px" HeaderStyle-HorizontalAlign="Center"
                        AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <ClientSettings>
                <Selecting AllowRowSelect="true"></Selecting>
                <ClientEvents OnRowSelected="rowSelected"></ClientEvents>
                <Scrolling AllowScroll="true" UseStaticHeaders="true"></Scrolling>
            </ClientSettings>
        </telerik:RadGrid>
    </telerik:RadPane>
    <telerik:RadSplitBar ID="RadSplitBarBAOGIA" runat="server" CollapseMode="Forward" />
    <telerik:RadPane ID="MiddlePaneBAOGIA" runat="server" Width="67%">
        <telerik:RadTabStrip ID="RadTabStripBAOGIA" OnClientTabSelected="tabSelected" Style="margin-top: 10px;"
            SelectedIndex="0" runat="server">
            <Tabs>
                <telerik:RadTab Text="Sửa báo giá">
                </telerik:RadTab>
                <telerik:RadTab Text="Thêm báo giá">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <div class="headerthongtin">
            <ul>
                <li class="lifirst">
                    <asp:LinkButton ID="btnSave" runat="server" OnClientClick="updateChanges(); return false;"><img src="Images/img_save.jpg" />Lưu</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="btnDelete" runat="server" OnClientClick="if(!confirm('Bạn chắc chắn muốn xóa báo giá?'))return false; deleteCurrent(); return false;"><img src="Images/img_Close.jpg" />Xóa</asp:LinkButton></li>
            </ul>
        </div>
        <div style="width: 100%; height: 250px; background: #FFFFFF" class="clearfix">
            <table id="tblEdit" class="TableEditInGrid" cellspacing="3" cellpadding="3" style="width: 100%" border="0">
                <tr>
                    <td style="width: 100px;">
                        <span class="rtsTxtnew">Mã báo giá:</span>
                    </td>
                    <td colspan="4">
                        <asp:HiddenField ID="txtID" Value='<%# Eval("PK_ID") %>' runat="server" />
                        <telerik:RadTextBox ID="txtC_CODE" Width="80%" runat="server" MaxLength="7">
                            <ClientEvents OnKeyPress="OnKeyPressRadTextBox" />
                        </telerik:RadTextBox>

                    </td>
                    <td style="width: 100px;">
                        <span class="rtsTxtnew">Ngày tiếp nhận:</span>
                    </td>
                    <td colspan="4">
                        <telerik:RadDateTimePicker ID="radC_DATE" Width="95%"
                            runat="server" AutoPostBack="false">
                            <DateInput ID="DateInput1" runat="server" DateFormat="dd/MM/yyyy HH:mm" MinDate="1/1/1890 00:00">
                                <ClientEvents OnKeyPress="controlkeypress" />
                            </DateInput>
                        </telerik:RadDateTimePicker>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        <span class="rtsTxtnew">Mã khách hàng:</span>
                    </td>
                    <td colspan="4">
                        <telerik:RadComboBox ID="cmbMaKhachHang" runat="server" OnClientLoad="OnClientLoadcmbMaKhachHang"
                            DataTextField="C_CODE" DataValueField="C_CODE" DataSourceID="KHACHHANGDataSource"
                            ShowToggleImage="True" EmptyMessage="Chọn mã"
                            OnClientSelectedIndexChanged="cmbMaKhachHangClientSelectedIndexChangedHandler"
                            AllowCustomText="True" Filter="Contains">
                        </telerik:RadComboBox>
                    </td>
                    <td style="width: 100px;">
                        <span class="rtsTxtnew">Tên khách hàng:</span>
                    </td>
                    <td colspan="4">
                        <telerik:RadTextBox ID="txtC_TENKH" Width="90%" runat="server" ClientEvents-OnLoad="OnClientLoadtxtC_TENKH">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;">
                        <span class="rtsTxtnew">Số điện thoại:</span>
                    </td>
                    <td colspan="4">
                        <telerik:RadTextBox ID="txtC_SDT" Width="90%" ClientEvents-OnLoad="OnClientLoadtxtC_SDT" runat="server">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;"><span class="rtsTxtnew">Nội dung:</td>
                    <td colspan="12">
                        <telerik:RadTextBox ID="txtC_NOIDUNG" runat="server" Width="90%" TextMode="MultiLine"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;"><span class="rtsTxtnew">Người tạo:</td>
                    <td colspan="4">
                        <telerik:RadComboBox ID="cmbFK_NGUOITAO" runat="server"
                            DataTextField="C_NAME" DataValueField="PK_ID" DataSourceID="UserDataSource" ShowToggleImage="True"
                            EmptyMessage="Chọn" AllowCustomText="True" Filter="Contains">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;"><span class="rtsTxtnew">Trạng thái:</td>
                    <td colspan="4">
                        <telerik:RadComboBox ID="cmbC_STATUS"
                            runat="server" EmptyMessage="Chọn">
                            <Items>
                                <telerik:RadComboBoxItem Value="Đang xử lý" Text="Đang xử lý" />
                                <telerik:RadComboBoxItem Value="Đóng" Text="Đóng" />
                            </Items>
                        </telerik:RadComboBox>
                    </td>
                </tr>
            </table>
            <div id="divRadListView">
                <telerik:RadListView Skin="Vista" ID="RadListViewBAOGIAGIAIQUYET" DataSourceID="SqlDataSourceBAOGIAGIAIQUYET" OnItemCreated="RadListViewBAOGIAGIAIQUYET_ItemCreated"
                    runat="server" ItemPlaceholderID="BAOGIAGIAIQUYETContainer" OnItemCommand="RadListViewBAOGIAGIAIQUYET_ItemCommand"
                    DataKeyNames="PK_ID">
                    <LayoutTemplate>
                        <fieldset id="FieldSet1">
                            <legend></legend>
                            <asp:PlaceHolder ID="BAOGIAGIAIQUYETContainer" runat="server"></asp:PlaceHolder>
                            <br />
                            <asp:Button ID="btnInitInsert" runat="server" Text="Thêm tình trạng" Visible='<%# (cmbC_STATUS.SelectedIndex == 0) && ITCLIB.Security.Security.CanEditModule("BAOGIA") %>' OnClick="btnInitInsert_Click"></asp:Button>
                        </fieldset>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <fieldset>
                            <div class="headerthongtin">
                                <ul>
                                    <li class="lifirst">
                                        <asp:LinkButton ID="btnEdit" runat="server" Visible='<%# ITCLIB.Security.Security.CanEditModule("BAOGIA") %>' CommandName="Edit"><img src="Images/img_save.jpg" />Sửa</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="btnDelete" runat="server" Visible='<%# ITCLIB.Security.Security.CanEditModule("BAOGIA") %>' OnClientClick="javascript:return confirm('Bạn có muốn xóa bản ghi đã chọn không?')" CommandName="Delete" CommandArgument='<%#Eval("PK_ID") %>'><img src="Images/img_Close.jpg" />Xóa</asp:LinkButton></li>
                                </ul>
                            </div>
                            <div style="width: 100%; height: 60px; background: #FFFFFF" class="clearfix">
                                <table id="tblEdit" class="TableEditInGrid" cellspacing="3" cellpadding="3" style="width: 100%" border="0">
                                    <tr>
                                        <td style="width: 100px;">
                                            <span class="rtsTxtnew">Người giải quyết:</span></br>
                                        <telerik:RadComboBox ID="cmbFK_NGUOIGIAIQUYET" runat="server" SelectedValue='<%# Bind("FK_NGUOIGIAIQUYET") %>' Enabled="false"
                                            DataTextField="C_NAME" DataValueField="PK_ID" DataSourceID="UserDataSource" ShowToggleImage="True"
                                            EmptyMessage="Chọn" AllowCustomText="True" Filter="Contains">
                                        </telerik:RadComboBox>
                                        </td>
                                        <td colspan="12">
                                            <telerik:RadTextBox ID="txtC_NOIDUNGGIAIQUYET" runat="server" Width="90%" TextMode="MultiLine" Text='<%# Bind("C_NOIDUNG") %>' Enabled="false"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <fieldset>
                            <div class="headerthongtin">
                                <ul>
                                    <li class="lifirst">
                                        <asp:LinkButton ID="btnSave" runat="server" CommandName="Update"><img src="Images/img_save.jpg" />Lưu</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel"><img src="Images/img_Close.jpg" />Hủy</asp:LinkButton></li>
                                </ul>
                            </div>
                            <div style="width: 100%; height: 60px; background: #FFFFFF" class="clearfix">
                                <table id="tblEdit" class="TableEditInGrid" cellspacing="3" cellpadding="3" style="width: 100%" border="0">
                                    <tr>
                                        <td style="width: 100px;">
                                            <span class="rtsTxtnew">Người giải quyết:</span></br>
                                        <telerik:RadComboBox ID="cmbFK_NGUOIGIAIQUYET" runat="server" SelectedValue='<%# Bind("FK_NGUOIGIAIQUYET") %>'
                                            DataTextField="C_NAME" DataValueField="PK_ID" DataSourceID="UserDataSource" ShowToggleImage="True"
                                            EmptyMessage="Chọn" AllowCustomText="True" Filter="Contains">
                                        </telerik:RadComboBox>
                                        </td>
                                        <td colspan="12">
                                            <telerik:RadTextBox ID="txtC_NOIDUNGGIAIQUYET" runat="server" Text='<%# Bind("C_NOIDUNG") %>' Width="90%" TextMode="MultiLine"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <fieldset>
                            <div class="headerthongtin">
                                <ul>
                                    <li class="lifirst">
                                        <asp:LinkButton ID="btnSave" runat="server" CommandName="PerformInsert"><img src="Images/img_save.jpg" />Lưu</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel"><img src="Images/img_Close.jpg" />Hủy</asp:LinkButton></li>
                                </ul>
                            </div>
                            <div style="width: 100%; height: 60px; background: #FFFFFF" class="clearfix">
                                <table id="tblEdit" class="TableEditInGrid" cellspacing="3" cellpadding="3" style="width: 100%" border="0">
                                    <tr>
                                        <td style="width: 100px;">
                                            <span class="rtsTxtnew">Người giải quyết:</span></br>
                                        <telerik:RadComboBox ID="cmbFK_NGUOIGIAIQUYET" runat="server" SelectedValue='<%# Bind("FK_NGUOIGIAIQUYET") %>'
                                            DataTextField="C_NAME" DataValueField="PK_ID" DataSourceID="UserDataSource" ShowToggleImage="True"
                                            EmptyMessage="Chọn" AllowCustomText="True" Filter="Contains">
                                        </telerik:RadComboBox>
                                        </td>
                                        <td colspan="12">
                                            <telerik:RadTextBox ID="txtC_NOIDUNGGIAIQUYET" runat="server" Text='<%# Bind("C_NOIDUNG") %>' Width="90%" TextMode="MultiLine"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                    </InsertItemTemplate>
                </telerik:RadListView>
            </div>
        </div>
        <!-- end bgpopup-->
    </telerik:RadPane>
</telerik:RadSplitter>
<asp:SqlDataSource ID="BAOGIADataSource" runat="server"
    ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    DeleteCommand="DELETE FROM [BAOGIA] WHERE [PK_ID] = @PK_ID"
    InsertCommand="INSERT INTO [BAOGIA] ([C_CODE], [C_DATE], [FK_KHACHHANG], [C_TENKH], [C_SDT], [C_NOIDUNG], [FK_NGUOITAO], [C_STATUS]) VALUES (@C_CODE, @C_DATE, @FK_KHACHHANG, @C_TENKH, @C_SDT, @C_NOIDUNG, @FK_NGUOITAO, @C_STATUS)"
    SelectCommand="SELECT [BAOGIA].[PK_ID], [BAOGIA].[C_CODE], [BAOGIA].[C_DATE], [BAOGIA].[FK_KHACHHANG], [BAOGIA].[C_TENKH], [BAOGIA].[C_SDT], [BAOGIA].[C_NOIDUNG], [BAOGIA].[FK_NGUOITAO], [BAOGIA].[C_STATUS], USERS.C_NAME as NGUOITAONAME FROM [BAOGIA] LEFT OUTER JOIN USERS ON BAOGIA.FK_NGUOITAO =USERS.PK_ID ORDER BY C_STATUS ASC, C_DATE DESC"
    UpdateCommand="UPDATE [BAOGIA] SET [C_CODE] = @C_CODE, [C_DATE] = @C_DATE, [FK_KHACHHANG] = @FK_KHACHHANG, [C_TENKH] = @C_TENKH, [C_SDT] = @C_SDT, [C_NOIDUNG] = @C_NOIDUNG, [FK_NGUOITAO] = @FK_NGUOITAO, [C_STATUS] = @C_STATUS WHERE [PK_ID] = @PK_ID">
    <SelectParameters>
        <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="C_CODE" Type="String" />
        <asp:Parameter Name="C_DATE" Type="DateTime" />
        <asp:Parameter Name="FK_KHACHHANG" Type="Int32" />
        <asp:Parameter Name="C_TENKH" Type="String" />
        <asp:Parameter Name="C_SDT" Type="String" />
        <asp:Parameter Name="C_NOIDUNG" Type="String" />
        <asp:Parameter Name="FK_NGUOITAO" Type="Int32" />
        <asp:Parameter Name="C_STATUS" Type="String" />
        <asp:Parameter Name="PK_ID" Type="Int32" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="PK_ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="C_CODE" Type="String" />
        <asp:Parameter Name="C_DATE" Type="DateTime" />
        <asp:Parameter Name="FK_KHACHHANG" Type="Int32" />
        <asp:Parameter Name="C_TENKH" Type="String" />
        <asp:Parameter Name="C_SDT" Type="String" />
        <asp:Parameter Name="C_NOIDUNG" Type="String" />
        <asp:Parameter Name="FK_NGUOITAO" Type="Int32" />
        <asp:Parameter Name="C_STATUS" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="UserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    SelectCommand="SELECT USERS.PK_ID,USERS.FK_GroupUser,USERS.FK_DEPT,USERS.C_LoginName,USERS.C_Password,USERS.C_NAME,USERS.C_Address,USERS.c_Tel,USERS.C_Email,USERS.C_DESC,GROUPUSER.C_NAME AS GROUPUSERNAME FROM USERS INNER JOIN GROUPUSER ON  USERS.FK_GROUPUSER = GROUPUSER.PK_ID WHERE FK_GROUPUSER NOT IN (0,1) AND (FK_VUNGLAMVIEC = N'Tất cả' OR FK_VUNGLAMVIEC = @FK_VUNGLAMVIEC)">
    <SelectParameters>
        <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="KHACHHANGDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    SelectCommand="SELECT DMKHACHHANG.* FROM DMKHACHHANG LEFT OUTER JOIN DMNHOMKHACHHANG ON DMKHACHHANG.FK_NHOMKHACHHANG = DMNHOMKHACHHANG.PK_ID WHERE DMNHOMKHACHHANG.FK_VUNGLAMVIEC = @FK_VUNGLAMVIEC">
    <SelectParameters>
        <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceBAOGIAGIAIQUYET" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    DeleteCommand="DELETE FROM [BAOGIAGIAIQUYET] WHERE [PK_ID] = @PK_ID"
    InsertCommand="INSERT INTO [BAOGIAGIAIQUYET] ([FK_BAOGIA], [FK_NGUOIGIAIQUYET], [C_NOIDUNG]) VALUES (@FK_BAOGIA, @FK_NGUOIGIAIQUYET, @C_NOIDUNG)"
    SelectCommand="SELECT [BAOGIAGIAIQUYET].[PK_ID], [BAOGIAGIAIQUYET].[FK_BAOGIA], [BAOGIAGIAIQUYET].[FK_NGUOIGIAIQUYET], [BAOGIAGIAIQUYET].[C_NOIDUNG] FROM [BAOGIAGIAIQUYET] WHERE FK_BAOGIA = @FK_BAOGIA"
    UpdateCommand="UPDATE [BAOGIAGIAIQUYET] SET [FK_NGUOIGIAIQUYET] = @FK_NGUOIGIAIQUYET, [C_NOIDUNG] = @C_NOIDUNG WHERE [PK_ID] = @PK_ID">
    <SelectParameters>
        <asp:ControlParameter Name="FK_BAOGIA" Type="Int32" ControlID="txtID" PropertyName="Value" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="FK_NGUOIGIAIQUYET" Type="Int32" />
        <asp:Parameter Name="C_NOIDUNG" Type="String" />
        <asp:Parameter Name="PK_ID" Type="Int32" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="PK_ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter Name="FK_BAOGIA" Type="Int32" ControlID="txtID" PropertyName="Value" />
        <asp:Parameter Name="FK_NGUOIGIAIQUYET" Type="Int32" />
        <asp:Parameter Name="C_NOIDUNG" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Visible="false" Text="Button" />
<asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>


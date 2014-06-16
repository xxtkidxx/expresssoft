﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DOITAC.ascx.cs" Inherits="module_DOITAC" %>
<%@ Register TagPrefix="custom" Namespace="ITCLIB.Admin" %>
<telerik:RadCodeBlock ID="RadCodeBlockDOITAC" runat="server">
    <script type="text/javascript">
        function RowDblClick(sender, eventArgs) {
            var CanEdit = "<%=ITCLIB.Security.Security.CanEditModule("DOITAC") %>";
            if ((eventArgs.get_tableView().get_name() == "MasterTableViewDOITAC") && (CanEdit == "True")) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        }
    </script>
    <script type="text/javascript">
        var registeredElementsDT = [];
        function GetRegisteredServerElementDT(serverID) {
            var clientID = "";
            for (var i = 0; i < registeredElementsDT.length; i++) {
                clientID = registeredElementsDT[i];
                if (clientID.indexOf(serverID) >= 0)
                    break;
            }
            return $get(clientID);
        }
        function GetGridServerElementDT(serverID, tagName) {
            if (!tagName)
                tagName = "*";

            var grid = $get("<%=RadGridDOITAC.ClientID %>");
        var elements = grid.getElementsByTagName(tagName);
        for (var i = 0; i < elements.length; i++) {
            var element = elements[i];
            if (element.id.indexOf(serverID) >= 0)
                return element;
        }
    }
    </script>
    <script type="text/javascript">
        var ListBoxVungLamViec;
        function OnClientLoadListBoxVungLamViec(sender) {
            ListBoxVungLamViec = sender;
        }
        var ListBoxVungLamViecSelect;
        function OnClientLoadListBoxVungLamViecSelect(sender) {
            ListBoxVungLamViecSelect = sender;
        }
        var panelControl;
        function OnClientLoadPanelControl(sender) {
            panelControl = sender;
        }
        function onClientTransferringHandler(sender, e) {
            var itemvalue = e.get_item().get_value();
            if (ListBoxVungLamViecSelect.findItemByValue(itemvalue) != null) {
                e.set_cancel(true);
            }
        }
        function OnClientDeleteVungLamViec(sender, e) {
            if (!confirm("Bạn thực sự muốn xóa vùng làm việc khỏi danh sách chọn?")) {
                e.set_cancel(true);
            }
        }
    </script>
</telerik:RadCodeBlock>
<telerik:RadAjaxLoadingPanel Skin="Vista" ID="RadAjaxLoadingPanelDOITAC" runat="server" />
<telerik:RadGrid ID="RadGridDOITAC" runat="server" Skin="Vista"
    AllowPaging="True" PageSize="20" AllowSorting="True"
    AllowFilteringByColumn="True" GridLines="None" ShowStatusBar="True"
    AutoGenerateColumns="False"
    AllowMultiRowEdit="True" AllowAutomaticDeletes="True"
    AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
    DataSourceID="DOITACDataSource" ShowFooter="True"
    OnDataBound="RadGridDOITAC_DataBound"
    OnItemDeleted="RadGridDOITAC_ItemDeleted" OnItemInserted="RadGridDOITAC_ItemInserted"
    OnItemUpdated="RadGridDOITAC_ItemUpdated"
    OnItemCommand="RadGridDOITAC_ItemCommand"
    OnItemDataBound="RadGridDOITAC_ItemDataBound" CellSpacing="0"
    OnItemCreated="RadGridDOITAC_ItemCreated">
    <PagerStyle FirstPageToolTip="Trang đầu" LastPageToolTip="Trang cuối" NextPagesToolTip="Các trang tiếp" NextPageToolTip="Trang tiếp"
        PageSizeLabelText="Số bản ghi hiển thị:" PrevPagesToolTip="Các trang sau" PrevPageToolTip="Trang sau" PagerTextFormat="Change page: {4} &nbsp;Trang <strong>{0}</strong>/<strong>{1}</strong>, Bản ghi <strong>{2}</strong> đến <strong>{3}</strong> của tất cả <strong>{5}</strong> bản ghi" />
    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true" Excel-Format="ExcelML"></ExportSettings>
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView Name="MasterTableViewDOITAC" CommandItemDisplay="Top" DataSourceID="DOITACDataSource" DataKeyNames="PK_ID" ClientDataKeyNames="PK_ID" EditMode="PopUp" NoMasterRecordsText="Không có dữ liệu">
        <CommandItemTemplate>
            <div style="padding: 5px 5px; float: left; width: auto">
                <b>Quản lý đối tác</b>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGridDOITAC.EditIndexes.Count == 0 && ITCLIB.Security.Security.CanEditModule("DOITAC") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Edit.gif" />Sửa</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGridDOITAC.EditIndexes.Count > 0 %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Update.gif" />Lưu</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGridDOITAC.EditIndexes.Count > 0 || RadGridDOITAC.MasterTableView.IsItemInserted %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Cancel.gif" />Hủy bỏ</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGridDOITAC.MasterTableView.IsItemInserted && ITCLIB.Security.Security.CanAddModule("DOITAC") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/AddRecord.gif" />Thêm</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGridDOITAC.MasterTableView.IsItemInserted %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Insert.gif" />Lưu</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Bạn có muốn xóa bản ghi đã chọn không?')" runat="server" CommandName="DeleteSelected" Visible='<%# ITCLIB.Security.Security.CanDeleteModule("DOITAC") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Delete.gif" />Xóa</asp:LinkButton>&nbsp;&nbsp;
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
            <telerik:GridTemplateColumn HeaderText="" ShowFilterIcon="false">
                <FilterTemplate>
                    <center>
                    <asp:ImageButton ID="btnShowAll" runat="server" ImageUrl="../Images/Grid/filterCancel.gif" AlternateText="Xem tất" ToolTip="Xem tất" OnClick="btnShowAll_Click" Style="vertical-align: middle" />
                  </center>
                </FilterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSTT" runat="server" Text=""></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Width="30px" />
                <ItemStyle HorizontalAlign="Center" Width="30px" />
            </telerik:GridTemplateColumn>
            <telerik:GridBoundColumn UniqueName="C_CODE" HeaderText="Mã đối tác" DataField="C_CODE"
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn UniqueName="C_NAME" HeaderText="Tên đối tác" DataField="C_NAME"
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn UniqueName="C_ADDRESS" HeaderText="Địa chỉ" DataField="C_ADDRESS"
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn UniqueName="C_TEL" HeaderText="Số điện thoại" DataField="C_TEL"
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn UniqueName="C_NGUOILIENHE" HeaderText="Người liên hệ" DataField="C_NGUOILIENHE"
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn UniqueName="C_TYPE" HeaderText="Loại đối tác" DataField="C_TYPE"
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn UniqueName="FK_VUNGLAMVIEC" HeaderText="Vùng làm việc" DataField="FK_VUNGLAMVIEC"
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
            </telerik:GridBoundColumn>
        </Columns>
        <EditFormSettings InsertCaption="Thêm đối tác mới" CaptionFormatString="Sửa đối tác: <b>{0}</b>" CaptionDataField="C_NAME" EditFormType="Template" PopUpSettings-Width="600px">
            <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
            <FormTemplate>
                <div class="headerthongtin">
                    <ul>
                        <li class="lifirst">
                            <asp:LinkButton ID="btnSave" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'><img src="Images/img_save.jpg" /><%# (Container is GridEditFormInsertItem) ? "Lưu" : "Lưu" %></asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="btnClose" runat="server" CommandName="Cancel"><img src="Images/img_Close.jpg" />Đóng</asp:LinkButton></li>
                    </ul>
                </div>
                <div class="clearfix bgpopup">
                    <div style="width: 600px; background: #FFFFFF" class="clearfix">
                        <table id="tblEdit" class="TableEditInGrid" cellspacing="3" cellpadding="3" style="width: 100%" border="0">
                            <tr>
                                <td style="width: 150px;"><span class="rtsTxtnew">Mã đối tác:</td>
                                <td colspan="4">
                                    <asp:HiddenField ID="txtID" Value='<%# Eval( "PK_ID") %>' runat="server" />
                                    <telerik:RadTextBox ID="txtCODE" Width="90%" Text='<%# Bind( "C_CODE") %>' runat="server"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="rfvCODE" runat="server" ErrorMessage="Mã đối tác không thể rỗng" ControlToValidate="txtCODE" SetFocusOnError="True" Display="Dynamic" ValidationGroup="G1"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="cuvCODE" ControlToValidate="txtCODE" OnServerValidate="CheckCode" runat="server" ErrorMessage="Mã đối tác đã tồn tại" Display="Dynamic" ValidationGroup="G1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;"><span class="rtsTxtnew">Tên đối tác:</td>
                                <td colspan="4">
                                    <telerik:RadTextBox ID="txtName" Text='<%# Bind( "C_NAME") %>' runat="server" Width="90%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên đối tác không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" Display="Dynamic" ValidationGroup="G1"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtName" OnServerValidate="CheckName" runat="server" ErrorMessage="Tên đối tác đã tồn tại" Display="Dynamic" ValidationGroup="G1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;"><span class="rtsTxtnew">Địa chỉ:</td>
                                <td colspan="4">
                                    <telerik:RadTextBox ID="txtC_ADDRESS" Text='<%# Bind( "C_ADDRESS") %>' runat="server" Width="90%"></telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;"><span class="rtsTxtnew">Điện thoại:</td>
                                <td colspan="4">
                                    <telerik:RadTextBox ID="txtC_TEL" Text='<%# Bind( "C_TEL") %>' runat="server" Width="90%"></telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;"><span class="rtsTxtnew">Người liên hệ:</td>
                                <td colspan="4">
                                    <telerik:RadTextBox ID="txtC_NGUOILIENHE" Text='<%# Bind( "C_NGUOILIENHE") %>' runat="server" Width="90%"></telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;"><span class="rtsTxtnew">Loại đối tác:</td>
                                <td colspan="4">
                                    <telerik:RadComboBox ID="cmbC_TYPE" SelectedValue='<%# Bind("C_TYPE") %>' runat="server" EmptyMessage="Chọn">
                                        <Items>
                                            <telerik:RadComboBoxItem Value="Nhập nhanh BILL" Text="Nhập nhanh BILL" />
                                            <telerik:RadComboBoxItem Value="Bình thường" Text="Bình thường" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="headerthongtin" id="Div2">
                        <span style="width: 300px; text-align: left; float: left;">Chọn vùng làm việc:</span> ||<span style="width: 250px; color: Blue"> Danh sách vùng làm việc</span>
                    </div>
                    <div style="width: 98%; background-color: White; padding-left: 2px;">
                        <telerik:RadListBox ID="RadListBoxVungLamViec" runat="server" Width="48%" Height="100px"
                            SelectionMode="Multiple" AllowTransfer="True" TransferToID="RadListBoxVungLamViecRef"
                            AutoPostBackOnTransfer="True" AutoPostBackOnReorder="True" EnableDragAndDrop="True"
                            DataKeyField="pk_id" DataSortField="c_signer" OnClientLoad="OnClientLoadListBoxVungLamViec"
                            DataSourceID="VUNGLAMVIECDataSource" DataTextField="C_NAME" DataValueField="C_CODE" Skin="Vista"
                            TransferMode="Copy" OnClientTransferring="onClientTransferringHandler">
                            <Localization AllToLeft="Bỏ chọn tất cả" AllToRight="Chọn tất cả" Delete="Xóa" ToLeft="Bỏ chọn" ToRight="Chọn" />
                            <ButtonSettings TransferButtons="TransferFrom,TransferAllFrom" />
                        </telerik:RadListBox>
                        <telerik:RadListBox ID="RadListBoxVungLamViecRef" runat="server" Width="48%" Height="100px" AllowDelete="true"
                            SelectionMode="Multiple" AutoPostBackOnReorder="true" EnableDragAndDrop="true"
                            OnClientLoad="OnClientLoadListBoxVungLamViecSelect" Skin="Vista" OnClientDeleting="OnClientDeleteVungLamViec">
                            <Localization Delete="Bỏ chọn" />
                            <ButtonSettings ShowDelete="true" />
                        </telerik:RadListBox>
                        <p style="height: 26px; line-height: 26px; color: Blue;">Ghi chú: Click vào vùng làm việc trên danh sách trái kéo và thả vào Box phải để chọn</p>
                        <br />
                    </div>
                    <asp:HiddenField ID="txtFK_VUNGLAMVIEC" Value ='<%# Eval( "FK_VUNGLAMVIEC") %>' runat="server" />
                    </center> 
        <!-- end bgpopup-->
                </div>
            </FormTemplate>
        </EditFormSettings>
    </MasterTableView>
    <ValidationSettings CommandsToValidate="PerformInsert,Update" ValidationGroup="G1" />
    <ClientSettings AllowKeyboardNavigation="true" KeyboardNavigationSettings-AllowSubmitOnEnter="true" ClientEvents-OnKeyPress="KeyPressed">
        <Selecting AllowRowSelect="True" EnableDragToSelectRows="True" />
        <ClientEvents OnPopUpShowing="PopUpShowing" />
        <ClientEvents OnRowDblClick="RowDblClick" />
        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" FrozenColumnsCount="5" ScrollHeight="450px" />
    </ClientSettings>
    <SortingSettings SortedAscToolTip="Sắp xếp tăng dần"
        SortedDescToolTip="Sắp xếp giảm dần" SortToolTip="Click để sắp xếp" />
    <StatusBarSettings LoadingText="Đang tải..." ReadyText="Sẵn sàng" />
</telerik:RadGrid>
<asp:SqlDataSource ID="DOITACDataSource" runat="server"
    ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    DeleteCommand="DELETE FROM [DMDOITAC] WHERE [PK_ID] = @PK_ID"
    InsertCommand="INSERT INTO [DMDOITAC] ([C_CODE], [C_NAME], [C_ADDRESS], [C_TEL], [C_NGUOILIENHE],[FK_VUNGLAMVIEC], [C_TYPE]) VALUES (@C_CODE, @C_NAME, @C_ADDRESS, @C_TEL, @C_NGUOILIENHE,@FK_VUNGLAMVIEC, @C_TYPE)"
    SelectCommand="SELECT [DMDOITAC].[PK_ID], [DMDOITAC].[C_CODE], [DMDOITAC].[C_NAME], [DMDOITAC].[C_ADDRESS], [DMDOITAC].[C_TEL], [DMDOITAC].[C_NGUOILIENHE], [DMDOITAC].[FK_VUNGLAMVIEC], [DMDOITAC].[C_TYPE] FROM [DMDOITAC]"
    UpdateCommand="UPDATE [DMDOITAC] SET [C_CODE] = @C_CODE, [C_NAME] = @C_NAME, [C_ADDRESS] = @C_ADDRESS,[C_TEL] = @C_TEL,[C_NGUOILIENHE] = @C_NGUOILIENHE,[FK_VUNGLAMVIEC] = @FK_VUNGLAMVIEC, [C_TYPE] = @C_TYPE WHERE [PK_ID] = @PK_ID">
    <UpdateParameters>
        <asp:Parameter Name="C_CODE" Type="String" />
        <asp:Parameter Name="C_NAME" Type="String" />
        <asp:Parameter Name="C_ADDRESS" Type="String" />
        <asp:Parameter Name="C_TEL" Type="String" />
        <asp:Parameter Name="C_NGUOILIENHE" Type="String" />
        <asp:Parameter Name="FK_VUNGLAMVIEC" Type="String" />
        <asp:Parameter Name="C_TYPE" Type="String" />
        <asp:Parameter Name="PK_ID" Type="Int32" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="PK_ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="C_CODE" Type="String" />
        <asp:Parameter Name="C_NAME" Type="String" />
        <asp:Parameter Name="C_ADDRESS" Type="String" />
        <asp:Parameter Name="C_TEL" Type="String" />
        <asp:Parameter Name="C_NGUOILIENHE" Type="String" />
        <asp:Parameter Name="FK_VUNGLAMVIEC" Type="String" />
        <asp:Parameter Name="C_TYPE" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="VUNGLAMVIECDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    SelectCommand="SELECT DMVUNGLAMVIEC.* FROM DMVUNGLAMVIEC"></asp:SqlDataSource>

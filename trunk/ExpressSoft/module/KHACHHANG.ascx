﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="KHACHHANG.ascx.cs" Inherits="module_KHACHHANG" %>
<%@ Register TagPrefix="custom" Namespace="ITCLIB.Admin" %>
<telerik:RadCodeBlock ID="RadCodeBlockKHACHHANG" runat="server">
<script type="text/javascript">
        function RowDblClick(sender, eventArgs) {
            var CanEdit = "<%=ITCLIB.Security.Security.CanEditModule("KHACHHANG") %>";
            if ((eventArgs.get_tableView().get_name() == "MasterTableViewKHACHHANG") && (CanEdit == "True")) {
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

        var grid = $get("<%=RadGridKHACHHANG.ClientID %>");
        var elements = grid.getElementsByTagName(tagName);
        for (var i = 0; i < elements.length; i++) {
            var element = elements[i];
            if (element.id.indexOf(serverID) >= 0)
                return element;
        }
    }
</script>
<script type="text/javascript">
    var cmbtinhthanh;
    var cmbquanhuyen;
    function OnClientLoadTinhThanh(sender) {
        cmbtinhthanh = sender;
    }
    function OnClientLoadQuanHuyen(sender) {
        cmbquanhuyen = sender;
    }
    function cmbQuocGiaClientSelectedIndexChangedHandler(sender, eventArgs) {
        cmbtinhthanh.requestItems(eventArgs.get_item().get_value(), false);
    }
    function cmbTinhThanhClientSelectedIndexChangedHandler(sender, eventArgs) {
        cmbquanhuyen.requestItems(eventArgs.get_item().get_value(), false);
    }
    function cmbQuanHuyenClientSelectedIndexChangedHandler(sender, eventArgs) {
        var hftext = GetGridServerElementDT("hfQuanHuyen");
        hftext.value = eventArgs.get_item().get_value();
    }
    function ItemsLoadedTinhThanh(combo, eventArqs) {
        if (combo.get_items().get_count() > 0) {
            combo.clearSelection();
        } else {
            combo.set_text("");
        }
    }
    function ItemsLoadedQuanHuyen(combo, eventArqs) {
        if (combo.get_items().get_count() > 0) {
            combo.clearSelection();
        } else {
            combo.set_text("");
        }
    }
</script>
</telerik:RadCodeBlock>
<telerik:RadAjaxLoadingPanel Skin="Vista" ID="RadAjaxLoadingPanelKHACHHANG" runat="server" />
<telerik:RadGrid ID="RadGridKHACHHANG" runat="server" Skin="Vista" 
    AllowPaging="True" PageSize="20" AllowSorting="True" 
    AllowFilteringByColumn="True" GridLines="None" ShowStatusBar="True"
    AutoGenerateColumns="False"  
    AllowMultiRowEdit="True" AllowAutomaticDeletes="True" 
    AllowAutomaticInserts="True" AllowAutomaticUpdates="True" 
    DataSourceID="KHACHHANGDataSource" ShowFooter="True"
    ondatabound="RadGridKHACHHANG_DataBound" 
    onitemdeleted="RadGridKHACHHANG_ItemDeleted" oniteminserted="RadGridKHACHHANG_ItemInserted" 
    onitemupdated="RadGridKHACHHANG_ItemUpdated" 
    onitemcommand="RadGridKHACHHANG_ItemCommand" 
    onitemdatabound="RadGridKHACHHANG_ItemDataBound" CellSpacing="0" 
    onitemcreated="RadGridKHACHHANG_ItemCreated">
    <PagerStyle FirstPageToolTip="Trang đầu" LastPageToolTip="Trang cuối" NextPagesToolTip="Các trang tiếp" NextPageToolTip="Trang tiếp" 
    PageSizeLabelText="Số bản ghi hiển thị:" PrevPagesToolTip="Các trang sau" PrevPageToolTip="Trang sau" PagerTextFormat="Change page: {4} &nbsp;Trang <strong>{0}</strong>/<strong>{1}</strong>, Bản ghi <strong>{2}</strong> đến <strong>{3}</strong> của tất cả <strong>{5}</strong> bản ghi" />    
    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true" Excel-Format="ExcelML"></ExportSettings>   
     <GroupingSettings CaseSensitive ="false"  />
    <MasterTableView Name="MasterTableViewKHACHHANG" CommandItemDisplay="Top" DataSourceID="KHACHHANGDataSource" DataKeyNames="PK_ID" ClientDataKeyNames="PK_ID" EditMode="PopUp" NoMasterRecordsText="Không có dữ liệu">
        <CommandItemTemplate>
                    <div style="padding: 5px 5px;float:left;width:auto">
                        <b>Quản lý khách hàng</b>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGridKHACHHANG.EditIndexes.Count == 0 && ITCLIB.Security.Security.CanEditModule("KHACHHANG") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Edit.gif" />Sửa</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGridKHACHHANG.EditIndexes.Count > 0 %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Update.gif" />Lưu</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGridKHACHHANG.EditIndexes.Count > 0 || RadGridKHACHHANG.MasterTableView.IsItemInserted %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Cancel.gif" />Hủy bỏ</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGridKHACHHANG.MasterTableView.IsItemInserted && ITCLIB.Security.Security.CanAddModule("KHACHHANG") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/AddRecord.gif" />Thêm</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGridKHACHHANG.MasterTableView.IsItemInserted %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Insert.gif" />Lưu</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Bạn có muốn xóa bản ghi đã chọn không?')" runat="server" CommandName="DeleteSelected" Visible='<%# ITCLIB.Security.Security.CanDeleteModule("KHACHHANG") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Delete.gif" />Xóa</asp:LinkButton>&nbsp;&nbsp;
                       <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Refresh.gif" />Làm mới</asp:LinkButton>
                    </div>
                    <div style="padding: 5px 5px;float:right;width:auto">
                        <asp:LinkButton ID="ExportToPdfButton" runat="server" CommandName="ExportToPdf"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/pdf.gif" /></asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="ExportToWordButton" runat="server" CommandName="ExportToWord"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/word.gif" /></asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="ExportToExcelButton" runat="server" CommandName="ExportToExcel"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/excel.gif" /></asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="ExportToCsvButton" runat="server" CommandName="ExportToCsv"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/csv.gif" /></asp:LinkButton>&nbsp;&nbsp;
                    </div>
        </CommandItemTemplate>
        <Columns>
                <telerik:GridBoundColumn UniqueName="PK_ID" HeaderText="" DataField="PK_ID" Visible ="false"
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                 <telerik:GridTemplateColumn HeaderText ="" ShowFilterIcon="false">   
                 <FilterTemplate >
                  <center>
                    <asp:ImageButton ID="btnShowAll" runat="server" ImageUrl="../Images/Grid/filterCancel.gif" AlternateText="Xem tất" ToolTip="Xem tất" OnClick="btnShowAll_Click" Style="vertical-align: middle" />
                  </center>
                 </FilterTemplate>
                  <ItemTemplate>
                      <asp:Label ID="lblSTT" runat="server" Text=""></asp:Label>
                </ItemTemplate>
                 <HeaderStyle HorizontalAlign ="Center" Width ="30px" />
                 <ItemStyle HorizontalAlign ="Center" Width ="30px" />
               </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn UniqueName="NHOMKHACHHANGNAME" HeaderText="Nhóm KH" DataField="NHOMKHACHHANGNAME" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="NHOMKHACHHANGNAMEQT" HeaderText="Nhóm KH QT" DataField="NHOMKHACHHANGNAMEQT" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_CODE" HeaderText="Mã KH" DataField="C_CODE" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_NAME" HeaderText="Tên KH" DataField="C_NAME" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_ADDRESS" HeaderText="Địa chỉ" DataField="C_ADDRESS" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="TINHTHANHNAME" HeaderText="Tỉnh thành" DataField="TINHTHANHNAME" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="QUANHUYENNAME" HeaderText="Quận huyện" DataField="QUANHUYENNAME" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_TEL" HeaderText="Số điện thoại" DataField="C_TEL" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_NGUOILIENHE" HeaderText="Người liên hệ" DataField="C_NGUOILIENHE" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn UniqueName="C_MOBILE" HeaderText="Di động" DataField="C_MOBILE" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_EMAIL" HeaderText="Email" DataField="C_EMAIL" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_MST" HeaderText="MST" DataField="C_MST" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_TAIKHOAN" HeaderText="Tài khoản" DataField="C_TAIKHOAN" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="USERNAME" HeaderText="Nhân viên KD" DataField="USERNAME" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
        </Columns>
        <EditFormSettings InsertCaption="Thêm khách hàng mới" CaptionFormatString="Sửa khách hàng: <b>{0}</b>" CaptionDataField="C_NAME" EditFormType="Template" PopUpSettings-Width="600px">
        <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
           <FormTemplate>
            <div class="headerthongtin">
              <ul>
                <li class="lifirst"><asp:LinkButton ID="btnSave" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'><img src="Images/img_save.jpg" /><%# (Container is GridEditFormInsertItem) ? "Lưu" : "Lưu" %></asp:LinkButton></li>
                     <li><asp:LinkButton ID="btnClose" runat="server" CommandName="Cancel"><img src="Images/img_Close.jpg" />Đóng</asp:LinkButton></li>                     
              </ul>
            </div>               
            <div class="clearfix bgpopup"> 
            <div style="width:600px;background:#FFFFFF" class="clearfix">      
            <table id="tblEdit" class ="TableEditInGrid" cellspacing="3" cellpadding="3" style="width: 100%" border="0">
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Nhóm khách hàng:</td>
                <td colspan="4">
                   <telerik:RadComboBox style="width:180px" SelectedValue='<%# Bind("FK_NHOMKHACHHANG") %>' ID="cmbFK_NHOMKHACHHANG" runat="server" EmptyMessage="Chọn nhóm khách hàng" Filter ="Contains" 
                    DataSourceID="NHOMKHACHHANGDataSource" DataTextField="C_NAME"  DataValueField="PK_ID" EnableLoadOnDemand="true">                               
                   </telerik:RadComboBox>                   
                </td>
            </tr>
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Nhóm khách hàng QT:</td>
                <td colspan="4">
                   <telerik:RadComboBox style="width:180px" SelectedValue='<%# Bind("FK_NHOMKHACHHANGQT") %>' ID="cmbFK_NHOMKHACHHANGQT" runat="server" EmptyMessage="Chọn nhóm khách hàng QT" Filter ="Contains" 
                    DataSourceID="NHOMKHACHHANGQTDataSource" DataTextField="C_NAME"  DataValueField="PK_ID" EnableLoadOnDemand="true">                               
                   </telerik:RadComboBox>                   
                </td>
            </tr>
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Mã khách hàng:</td>
                <td colspan="4">
                    <asp:HiddenField ID="txtID" Value ='<%# Eval( "PK_ID") %>' runat="server" />
                    <telerik:RadTextBox ID="txtCODE" Width ="90%" Text='<%# Bind( "C_CODE") %>' runat="server"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="rfvCODE" runat="server" ErrorMessage="Mã khách hàng không thể rỗng" ControlToValidate="txtCODE" SetFocusOnError="True" Display="Dynamic" ValidationGroup="G1"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cuvCODE" ControlToValidate="txtCODE" OnServerValidate="CheckCode" runat="server" ErrorMessage="Mã khách hàng đã tồn tại" Display="Dynamic" ValidationGroup="G1"></asp:CustomValidator>
                </td>
            </tr> 
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Tên khách hàng:</td>
                <td colspan="4">
                   <telerik:RadTextBox ID="txtName" Text='<%# Bind( "C_NAME") %>' runat="server" Width="90%"></telerik:RadTextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên khách hàng không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" Display="Dynamic" ValidationGroup="G1"></asp:RequiredFieldValidator>
                   <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtName" OnServerValidate="CheckName" runat="server" ErrorMessage="Tên khách hàng đã tồn tại" Display="Dynamic" ValidationGroup="G1"></asp:CustomValidator>
                </td>
            </tr> 
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Địa chỉ:</td>
                <td colspan="4">
                   <telerik:RadTextBox ID="txtC_ADDRESS" Text='<%# Bind( "C_ADDRESS") %>' runat="server" Width="90%"></telerik:RadTextBox>                   
                </td>
            </tr>
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Quốc gia:</td>
                <td colspan="4">
                   <asp:HiddenField ID="hfQuocGia" runat="server"  Value ='<%# cFunction.LoadIDQuocGia(Eval("FK_QUANHUYEN").ToString()) %>' />
                    <telerik:RadComboBox style="width:180px" ID="cmbQuocGia" runat="server" EmptyMessage="Chọn quốc gia" Filter ="Contains" 
                    DataSourceID="QUOCGIADataSource" DataTextField="C_NAME"  DataValueField="PK_ID" EnableLoadOnDemand="true">                               
                   </telerik:RadComboBox>                    
                </td>
            </tr>
             <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Tỉnh thành:</td>
                <td colspan="4">
                   <asp:HiddenField ID="hfTinhThanh" runat="server" Value ='<%# cFunction.LoadIDTinhThanh(Eval("FK_QUANHUYEN").ToString()) %>' />
                    <telerik:RadComboBox style="width:180px" ID="cmbTinhThanh" runat="server" EmptyMessage="Chọn tỉnh" 
                    DataSourceID="TINHTHANHDataSource" DataTextField="C_NAME"  DataValueField="PK_ID">                               
                   </telerik:RadComboBox>                    
                </td>
            </tr>
             <tr>
                 <td style =" width:150px;"><span class="rtsTxtnew">Quận huyện:</td>
                <td colspan="4">
                   <asp:HiddenField ID="hfQuanHuyen" runat="server"  Value ='<%# Bind("FK_QUANHUYEN") %>'/>
                   <telerik:RadComboBox style="width:180px" ID="cmbQuanHuyen" runat="server"  EmptyMessage="Chọn quận huyện" 
                   DataSourceID="QUANHUYENDataSource" DataTextField="C_NAME" DataValueField="PK_ID">                               
                   </telerik:RadComboBox>                   
                </td>
            </tr>
             <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Điện thoại:</td>
                <td colspan="4">
                   <telerik:RadTextBox ID="txtC_TEL" Text='<%# Bind( "C_TEL") %>' runat="server" Width="90%"></telerik:RadTextBox>                   
                </td>
            </tr>
             <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Người liên hệ:</td>
                <td colspan="4">
                   <telerik:RadTextBox ID="txtC_NGUOILIENHE" Text='<%# Bind( "C_NGUOILIENHE") %>' runat="server" Width="90%"></telerik:RadTextBox>                   
                </td>
            </tr>
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Di động:</td>
                <td colspan="4">
                   <telerik:RadTextBox ID="txtC_MOBILE" Text='<%# Bind( "C_MOBILE") %>' runat="server" Width="90%"></telerik:RadTextBox>                   
                </td>
            </tr>
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Email:</td>
                <td colspan="4">
                    <telerik:RadTextBox ID="txtEmail" Width="90%" Text='<%# Bind( "C_Email") %>' runat="server"></telerik:RadTextBox>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email sai định dạng" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ValidationGroup="G1" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Mã số thuế:</td>
                <td colspan="4">
                   <telerik:RadTextBox ID="txtC_MST" Text='<%# Bind( "C_MST") %>' runat="server" Width="90%"></telerik:RadTextBox>                   
                </td>
            </tr>
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Tài khoản:</td>
                <td colspan="4">
                   <telerik:RadTextBox ID="txtC_TAIKHOAN" Text='<%# Bind( "C_TAIKHOAN") %>' runat="server" Width="90%"></telerik:RadTextBox>                   
                </td>
            </tr>
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Nhân viên kinh doanh:</td>
                <td colspan="4">
                   <telerik:RadComboBox style="width:180px" SelectedValue='<%# Bind("FK_USER") %>' ID="cmbFK_USER" runat="server" EmptyMessage="Chọn nhân viên" Filter ="Contains" 
                    DataSourceID="USERDataSource" DataTextField="C_NAME"  DataValueField="PK_ID" EnableLoadOnDemand="true">                               
                   </telerik:RadComboBox>                    
                </td>
            </tr>
             </table>
            </div> 
             </center> 
        <!-- end bgpopup--></div>    
             </FormTemplate>
        </EditFormSettings>
        </MasterTableView>
        <ValidationSettings CommandsToValidate="PerformInsert,Update" ValidationGroup="G1"/>
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
<asp:SqlDataSource ID="KHACHHANGDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>" 
    DeleteCommand="DELETE FROM [DMKHACHHANG] WHERE [PK_ID] = @PK_ID" 
    InsertCommand="INSERT INTO [DMKHACHHANG] ([FK_NHOMKHACHHANG], [FK_NHOMKHACHHANGQT], [C_CODE], [C_NAME], [C_ADDRESS], [FK_QUANHUYEN], [C_TEL], [FK_USER], [C_TAIKHOAN], [C_MST], [C_EMAIL], [C_MOBILE], [C_NGUOILIENHE]) VALUES (@FK_NHOMKHACHHANG, @FK_NHOMKHACHHANGQT, @C_CODE, @C_NAME, @C_ADDRESS, @FK_QUANHUYEN, @C_TEL, @FK_USER, @C_TAIKHOAN, @C_MST, @C_EMAIL, @C_MOBILE, @C_NGUOILIENHE)" 
    SelectCommand="SELECT [DMKHACHHANG].[PK_ID], [DMKHACHHANG].[FK_NHOMKHACHHANG], [DMKHACHHANG].[FK_NHOMKHACHHANGQT], [DMKHACHHANG].[C_CODE], [DMKHACHHANG].[C_NAME], [DMKHACHHANG].[C_ADDRESS], [DMKHACHHANG].[FK_QUANHUYEN], [DMKHACHHANG].[C_TEL], [DMKHACHHANG].[FK_USER], [DMKHACHHANG].[C_TAIKHOAN], [DMKHACHHANG].[C_MST], [DMKHACHHANG].[C_EMAIL], [DMKHACHHANG].[C_MOBILE], [DMKHACHHANG].[C_NGUOILIENHE],DMQUANHUYEN.C_NAME as QUANHUYENNAME,DMTINHTHANH.C_NAME as TINHTHANHNAME,USERS.C_NAME as USERNAME,a.C_NAME as NHOMKHACHHANGNAME,b.C_NAME as NHOMKHACHHANGNAMEQT FROM [DMKHACHHANG] LEFT OUTER JOIN DMQUANHUYEN ON DMKHACHHANG.FK_QUANHUYEN = DMQUANHUYEN.PK_ID LEFT OUTER JOIN DMTINHTHANH ON DMQUANHUYEN.FK_TINHTHANH = DMTINHTHANH.PK_ID LEFT OUTER JOIN USERS ON DMKHACHHANG.FK_USER =USERS.PK_ID LEFT OUTER JOIN DMNHOMKHACHHANG a ON DMKHACHHANG.FK_NHOMKHACHHANG =a.PK_ID LEFT OUTER JOIN DMNHOMKHACHHANG b ON DMKHACHHANG.FK_NHOMKHACHHANGQT =b.PK_ID WHERE a.FK_VUNGLAMVIEC = @FK_VUNGLAMVIEC" 
    UpdateCommand="UPDATE [DMKHACHHANG] SET [FK_NHOMKHACHHANG] = @FK_NHOMKHACHHANG, [FK_NHOMKHACHHANGQT] = @FK_NHOMKHACHHANGQT, [C_CODE] = @C_CODE, [C_NAME] = @C_NAME, [C_ADDRESS] = @C_ADDRESS, [FK_QUANHUYEN] = @FK_QUANHUYEN, [C_TEL] = @C_TEL, [FK_USER] = @FK_USER, [C_TAIKHOAN] = @C_TAIKHOAN, [C_MST] = @C_MST, [C_EMAIL] = @C_EMAIL, [C_MOBILE] = @C_MOBILE, [C_NGUOILIENHE] = @C_NGUOILIENHE WHERE [PK_ID] = @PK_ID">
        <SelectParameters>
            <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FK_NHOMKHACHHANG" Type="Int32" />
            <asp:Parameter Name="FK_NHOMKHACHHANGQT" Type="Int32" />
            <asp:Parameter Name="C_CODE" Type="String" />
            <asp:Parameter Name="C_NAME" Type="String" />
            <asp:Parameter Name="C_ADDRESS" Type="String" />
            <asp:Parameter Name="FK_QUANHUYEN" Type="Int32" />
            <asp:Parameter Name="C_TEL" Type="String" />
            <asp:Parameter Name="FK_USER" Type="Int32" />
            <asp:Parameter Name="C_TAIKHOAN" Type="String" />
            <asp:Parameter Name="C_MST" Type="String" />
            <asp:Parameter Name="C_EMAIL" Type="String" />
            <asp:Parameter Name="C_MOBILE" Type="String" />
            <asp:Parameter Name="C_NGUOILIENHE" Type="String" />
            <asp:Parameter Name="PK_ID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="PK_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FK_NHOMKHACHHANG" Type="Int32" />
            <asp:Parameter Name="FK_NHOMKHACHHANGQT" Type="Int32" />
            <asp:Parameter Name="C_CODE" Type="String" />
            <asp:Parameter Name="C_NAME" Type="String" />
            <asp:Parameter Name="C_ADDRESS" Type="String" />
            <asp:Parameter Name="FK_QUANHUYEN" Type="Int32" />
            <asp:Parameter Name="C_TEL" Type="String" />
            <asp:Parameter Name="FK_USER" Type="Int32" />
            <asp:Parameter Name="C_TAIKHOAN" Type="String" />
            <asp:Parameter Name="C_MST" Type="String" />
            <asp:Parameter Name="C_EMAIL" Type="String" />
            <asp:Parameter Name="C_MOBILE" Type="String" />
            <asp:Parameter Name="C_NGUOILIENHE" Type="String" />
        </InsertParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="QUOCGIADataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    SelectCommand="SELECT * FROM [DMQUOCGIA]">
 </asp:SqlDataSource>
  <asp:SqlDataSource ID="TINHTHANHDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>">
 </asp:SqlDataSource>
 <asp:SqlDataSource ID="QUANHUYENDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>">
</asp:SqlDataSource>
<asp:SqlDataSource ID="UserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    SelectCommand="SELECT USERS.PK_ID,USERS.FK_GroupUser,USERS.FK_DEPT,USERS.C_LoginName,USERS.C_Password,USERS.C_NAME,USERS.C_Address,USERS.c_Tel,USERS.C_Email,USERS.C_DESC,GROUPUSER.C_NAME AS GROUPUSERNAME FROM USERS INNER JOIN GROUPUSER ON  USERS.FK_GROUPUSER = GROUPUSER.PK_ID WHERE FK_GROUPUSER NOT IN (0,1) AND (FK_VUNGLAMVIEC = N'Tất cả' OR FK_VUNGLAMVIEC = @FK_VUNGLAMVIEC)">
    <SelectParameters>
        <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
    </SelectParameters>
</asp:SqlDataSource>
 <asp:SqlDataSource ID="NHOMKHACHHANGDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
 SelectCommand="SELECT DMNHOMKHACHHANG.* FROM DMNHOMKHACHHANG WHERE C_TYPE = N'Trong nước' AND FK_VUNGLAMVIEC = @FK_VUNGLAMVIEC" >
 <SelectParameters>
     <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
 </SelectParameters>
</asp:SqlDataSource>
 <asp:SqlDataSource ID="NHOMKHACHHANGQTDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
 SelectCommand="SELECT DMNHOMKHACHHANG.* FROM DMNHOMKHACHHANG WHERE C_TYPE = N'Quốc tế' AND FK_VUNGLAMVIEC = @FK_VUNGLAMVIEC">
 <SelectParameters>
     <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
 </SelectParameters>
</asp:SqlDataSource>


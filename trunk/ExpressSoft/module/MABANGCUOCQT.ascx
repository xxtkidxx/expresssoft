﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MABANGCUOCQT.ascx.cs" Inherits="module_MABANGCUOCQT" %>
<telerik:RadCodeBlock ID="RadCodeBlockMABANGCUOCQT" runat="server">
<script type="text/javascript">
        function RowDblClick(sender, eventArgs) {
            var CanEdit = "<%=ITCLIB.Security.Security.CanEditModule("BANGCUOC") %>";
            if ((eventArgs.get_tableView().get_name() == "MasterTableViewMABANGCUOCQT") && (CanEdit == "True")) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        }
</script>
<script type="text/javascript">
    var ListBoxNhomKhachHang;
    function OnClientLoadListBoxNhomKhachHang(sender) {
        ListBoxNhomKhachHang = sender;
    }
    var ListBoxNhomKhachHangSelect;
    function OnClientLoadListBoxNhomKhachHangSelect(sender) {
        ListBoxNhomKhachHangSelect = sender;
    }
    var panelControl;
    function OnClientLoadPanelControl(sender) {
        panelControl = sender;
    }
    function onClientTransferringHandler(sender, e) {
        var itemvalue = e.get_item().get_value();
        if (ListBoxNhomKhachHangSelect.findItemByValue(itemvalue) != null) {
            e.set_cancel(true);
        }
    }
    function OnClientDeleteNhomKhachHang(sender, e) {
        if (!confirm("Bạn thực sự muốn xóa nhóm khách hàng khỏi danh sách chọn?")) {
            e.set_cancel(true);
        }
    }  
</script>
</telerik:RadCodeBlock>
<telerik:RadAjaxLoadingPanel Skin="Vista" ID="RadAjaxLoadingPanelMABANGCUOCQT" runat="server" />
<telerik:RadGrid ID="RadGridMABANGCUOCQT" runat="server" Skin="Vista" 
    AllowPaging="True" PageSize="20" AllowSorting="True" 
    AllowFilteringByColumn="True" GridLines="None" ShowStatusBar="True"
    AutoGenerateColumns="False"  
    AllowMultiRowEdit="True" AllowAutomaticDeletes="True" 
    AllowAutomaticInserts="True" AllowAutomaticUpdates="True" 
    DataSourceID="MABANGCUOCQTDataSource" ShowFooter="True"
    ondatabound="RadGridMABANGCUOCQT_DataBound" 
    onitemdeleted="RadGridMABANGCUOCQT_ItemDeleted" oniteminserted="RadGridMABANGCUOCQT_ItemInserted" 
    onitemupdated="RadGridMABANGCUOCQT_ItemUpdated" 
    onitemcommand="RadGridMABANGCUOCQT_ItemCommand" 
    onitemdatabound="RadGridMABANGCUOCQT_ItemDataBound" CellSpacing="0">
    <PagerStyle FirstPageToolTip="Trang đầu" LastPageToolTip="Trang cuối" NextPagesToolTip="Các trang tiếp" NextPageToolTip="Trang tiếp" 
    PageSizeLabelText="Số bản ghi hiển thị:" PrevPagesToolTip="Các trang sau" PrevPageToolTip="Trang sau" PagerTextFormat="Change page: {4} &nbsp;Trang <strong>{0}</strong>/<strong>{1}</strong>, Bản ghi <strong>{2}</strong> đến <strong>{3}</strong> của tất cả <strong>{5}</strong> bản ghi" />    
    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true" Excel-Format="ExcelML"></ExportSettings>   
     <GroupingSettings CaseSensitive ="false"  />
    <MasterTableView Name="MasterTableViewMABANGCUOCQT" CommandItemDisplay="Top" DataSourceID="MABANGCUOCQTDataSource" DataKeyNames="PK_ID" ClientDataKeyNames="PK_ID" EditMode="PopUp" NoMasterRecordsText="Không có dữ liệu">
        <CommandItemTemplate>
                    <div style="padding: 5px 5px;float:left;width:auto">
                        <b>Quản lý mã bảng cước</b>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGridMABANGCUOCQT.EditIndexes.Count == 0 && ITCLIB.Security.Security.CanEditModule("BANGCUOC") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Edit.gif" />Sửa</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGridMABANGCUOCQT.EditIndexes.Count > 0 %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Update.gif" />Lưu</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGridMABANGCUOCQT.EditIndexes.Count > 0 || RadGridMABANGCUOCQT.MasterTableView.IsItemInserted %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Cancel.gif" />Hủy bỏ</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGridMABANGCUOCQT.MasterTableView.IsItemInserted && ITCLIB.Security.Security.CanAddModule("BANGCUOC") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/AddRecord.gif" />Thêm</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGridMABANGCUOCQT.MasterTableView.IsItemInserted %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Insert.gif" />Lưu</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Bạn có muốn xóa bản ghi đã chọn không?')" runat="server" CommandName="DeleteSelected" Visible='<%# ITCLIB.Security.Security.CanDeleteModule("BANGCUOC") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Delete.gif" />Xóa</asp:LinkButton>&nbsp;&nbsp;
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
                <telerik:GridBoundColumn UniqueName="C_CODE" HeaderText="Mã bảng cước" DataField="C_CODE" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_NAME" HeaderText="Tên bảng cước đối tác" DataField="DOITACNAME" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_VALUE1" HeaderText="Mức chênh lệch" DataField="C_VALUE1" AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="C_VALUE2" HeaderText="% chênh lệch" DataField="C_VALUE2"  AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn UniqueName="C_VALUE" HeaderText="Nhóm khách hàng" DataField="C_VALUE" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                    <ItemTemplate>
                         <%# ITCLIB.Admin.cFunction.getnamefix(Eval("C_VALUE").ToString(), "DMNHOMKHACHHANG")%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn UniqueName="VUNGLAMVIECNAME" HeaderText="Vùng làm việc" DataField="VUNGLAMVIECNAME" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
        </Columns>
        <EditFormSettings InsertCaption="Thêm mã bảng cước mới" CaptionFormatString="Sửa mã bảng cước: <b>{0}</b>" CaptionDataField="C_CODE" EditFormType="Template" PopUpSettings-Width="600px">
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
                 <td style =" width:150px;"> <span class="rtsTxtnew">Mã bảng cước:</td>
                <td colspan="4">
                    <asp:HiddenField ID="txtID" Value ='<%# Eval( "PK_ID") %>' runat="server" />
                    <asp:HiddenField ID="txtC_VALUE" Value ='<%# Eval( "C_VALUE") %>' runat="server" />
                    <telerik:RadTextBox ID="txtCODE" Width ="90%" Text='<%# Bind( "C_CODE") %>' runat="server"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="rfvCODE" runat="server" ErrorMessage="Mã bảng cước không thể rỗng" ControlToValidate="txtCODE" SetFocusOnError="True" Display="Dynamic" ValidationGroup="G1"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cuvCODE" ControlToValidate="txtCODE" OnServerValidate="CheckCode" runat="server" ErrorMessage="Mã bảng cước đã tồn tại" Display="Dynamic" ValidationGroup="G1"></asp:CustomValidator>
                </td>
            </tr> 
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Bảng cước đối tác:</td>
                <td colspan="4">
                   <asp:DropDownList ID="ddlDoitac" SelectedValue='<%# Bind("FK_DOITAC") %>' DataTextField="C_NAME" DataValueField="PK_ID" runat="server" DataSourceID="DoiTacDataSource" AppendDataBoundItems="True">
                   <asp:ListItem Value="" Text="Chọn"></asp:ListItem>
                   </asp:DropDownList>
                   <asp:RequiredFieldValidator ID="rfvDoitac" runat="server" ErrorMessage="Hãy chọn bảng cước đối tác" ControlToValidate="ddlDoitac" SetFocusOnError="True" Display="Dynamic" ValidationGroup="G1"></asp:RequiredFieldValidator>                                                                
                </td>
            </tr>
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">Mức chênh lệch:</td>
                <td colspan="4">
                    <telerik:RadNumericTextBox  ID="txtC_VALUE1" Width ="90%" Runat="server" Text='<%# Bind("C_VALUE1") %>'>
                            <NumberFormat DecimalSeparator ="." GroupSeparator =" " DecimalDigits="1"/>
                    </telerik:RadNumericTextBox>            
                    <asp:RequiredFieldValidator ID="rfvtxtC_VALUE1" runat="server" ErrorMessage="Mức chênh lệch không thể rỗng" ControlToValidate="txtC_VALUE1" SetFocusOnError="True" Display="Dynamic" ValidationGroup="G1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                 <td style =" width:150px;"> <span class="rtsTxtnew">% chênh lệch:</td>
                <td colspan="4">
                    <telerik:RadNumericTextBox  ID="txtC_VALUE2" Width ="90%" Runat="server" Text='<%# Bind("C_VALUE2") %>'>
                            <NumberFormat DecimalSeparator ="." GroupSeparator =" " DecimalDigits="1"/>
                    </telerik:RadNumericTextBox>
                    <asp:RequiredFieldValidator ID="rfvtxtC_VALUE2" runat="server" ErrorMessage="% chênh lệch không thể rỗng" ControlToValidate="txtC_VALUE2" SetFocusOnError="True" Display="Dynamic" ValidationGroup="G1"></asp:RequiredFieldValidator>          
                </td>
            </tr>
            </table>
            </div>
            <div class ="headerthongtin" id ="Div2">
             <span style =" width :300px; text-align:left; float:left;"> Chọn nhóm khách hàng:</span> ||<span style =" width :250px; color: Blue "> Danh sách nhóm khách hàng</span>                     
            </div>
            <div style ="width:98%; background-color:White;padding-left:2px;">
                <telerik:RadListBox ID="RadListBoxNhomKhachHang" runat="server" Width ="48%" Height ="100px"  
                        SelectionMode="Multiple" AllowTransfer="True" TransferToID="RadListBoxNhomKhachHangRef" 
                        AutoPostBackOnTransfer="True" AutoPostBackOnReorder="True" EnableDragAndDrop="True" 
                        DataKeyField="pk_id" DataSortField="c_signer"  OnClientLoad ="OnClientLoadListBoxNhomKhachHang"
                        DataSourceID="NHOMKHACHHANGDataSource" DataTextField="C_NAME" DataValueField="PK_ID" Skin="Vista" 
                       TransferMode="Copy" OnClientTransferring ="onClientTransferringHandler">
                       <Localization AllToLeft ="Bỏ chọn tất cả" AllToRight ="Chọn tất cả" Delete ="Xóa" ToLeft ="Bỏ chọn" ToRight ="Chọn"  />
                       <ButtonSettings TransferButtons ="TransferFrom,TransferAllFrom" />
                    </telerik:RadListBox>
                <telerik:RadListBox ID="RadListBoxNhomKhachHangRef" runat="server" Width ="48%" Height ="100px" AllowDelete ="true"  
                        SelectionMode="Multiple" AutoPostBackOnReorder="true" EnableDragAndDrop="true"
                        OnClientLoad="OnClientLoadListBoxNhomKhachHangSelect" Skin="Vista" OnClientDeleting ="OnClientDeleteNhomKhachHang">
                        <Localization Delete ="Bỏ chọn" />
                        <ButtonSettings ShowDelete ="true"  />
                 </telerik:RadListBox>     
            <p style =" height: 26px; line-height :26px; color:Blue;">Ghi chú: Click vào nhóm khách hàng trên danh sách trái kéo và thả vào Box phải để chọn</p>
            <br />
            </div>  
             </center> 
        <!-- end bgpopup--></div>    
             </FormTemplate>
        </EditFormSettings>
        </MasterTableView>
        <ValidationSettings CommandsToValidate="PerformInsert,Update" ValidationGroup="G1"/>
        <ClientSettings AllowKeyboardNavigation="true" KeyboardNavigationSettings-AllowSubmitOnEnter="true" ClientEvents-OnKeyPress="KeyPressed">
            <Selecting AllowRowSelect="True" EnableDragToSelectRows="True" />
            <ClientEvents OnPopUpShowing="PopUpShowingSmall" />
            <ClientEvents OnRowDblClick="RowDblClick" />
        </ClientSettings>
        <SortingSettings SortedAscToolTip="Sắp xếp tăng dần" 
            SortedDescToolTip="Sắp xếp giảm dần" SortToolTip="Click để sắp xếp" />
        <StatusBarSettings LoadingText="Đang tải..." ReadyText="Sẵn sàng" />
</telerik:RadGrid>
<asp:SqlDataSource ID="MABANGCUOCQTDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
        DeleteCommand="DELETE FROM [DMMABANGCUOCQT] WHERE [PK_ID] = @PK_ID" 
        InsertCommand="INSERT INTO [DMMABANGCUOCQT] ([C_CODE], [FK_DOITAC],[C_VALUE1],[C_VALUE2],[C_VALUE],[FK_VUNGLAMVIEC]) VALUES (@C_CODE, @FK_DOITAC,@C_VALUE1,@C_VALUE2,@C_VALUE,@FK_VUNGLAMVIEC)"
        SelectCommand="SELECT [DMMABANGCUOCQT].[PK_ID], [DMMABANGCUOCQT].[C_CODE], [DMMABANGCUOCQT].[FK_DOITAC], [DMMABANGCUOCQT].[C_VALUE1], [DMMABANGCUOCQT].[C_VALUE2], [DMMABANGCUOCQT].[C_VALUE], [DMMABANGCUOCQT].[FK_VUNGLAMVIEC], [DMDOITAC].[C_NAME] as [DOITACNAME], [DMVUNGLAMVIEC].[C_NAME] as [VUNGLAMVIECNAME] FROM [DMMABANGCUOCQT] LEFT OUTER JOIN [DMDOITAC] ON [DMMABANGCUOCQT].[FK_DOITAC] = [DMDOITAC].[PK_ID] LEFT OUTER JOIN [DMVUNGLAMVIEC] ON [DMMABANGCUOCQT].[FK_VUNGLAMVIEC] = [DMVUNGLAMVIEC].[C_CODE] WHERE [DMMABANGCUOCQT].FK_VUNGLAMVIEC = @FK_VUNGLAMVIEC ORDER BY LTRIM([DMMABANGCUOCQT].[C_CODE])"      
        UpdateCommand="UPDATE [DMMABANGCUOCQT] SET [C_CODE] = @C_CODE, [FK_DOITAC] = @FK_DOITAC, [C_VALUE1] = @C_VALUE1, [C_VALUE2] = @C_VALUE2, [C_VALUE] = @C_VALUE WHERE [PK_ID] = @PK_ID" >
        <SelectParameters>
            <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="C_CODE" Type="String" />
            <asp:Parameter Name="FK_DOITAC" Type="String" />
            <asp:Parameter Name="C_VALUE1" Type="String" DefaultValue="0" />
            <asp:Parameter Name="C_VALUE2" Type="String" DefaultValue="0" />
            <asp:Parameter Name="C_VALUE" Type="String" />            
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="PK_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="C_CODE" Type="String" />
            <asp:Parameter Name="FK_DOITAC" Type="String" />
            <asp:Parameter Name="C_VALUE1" Type="String" DefaultValue="0" />
            <asp:Parameter Name="C_VALUE2" Type="String" DefaultValue="0" />
            <asp:Parameter Name="C_VALUE" Type="String" />
            <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
        </InsertParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DoiTacDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    SelectCommand="SELECT [PK_ID], [C_CODE], [C_NAME] FROM [DMDoiTac] ORDER BY LTRIM([C_CODE])">
</asp:SqlDataSource>
 <asp:SqlDataSource ID="NHOMKHACHHANGDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
 SelectCommand="SELECT DMNHOMKHACHHANG.* FROM DMNHOMKHACHHANG WHERE C_TYPE = N'Quốc tế' AND FK_VUNGLAMVIEC = @FK_VUNGLAMVIEC">
 <SelectParameters>
     <asp:SessionParameter Name="FK_VUNGLAMVIEC" Type="String" SessionField="VUNGLAMVIEC" />
 </SelectParameters>
</asp:SqlDataSource>


﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Depts.ascx.cs" Inherits="Depts" %>

<telerik:RadCodeBlock ID="RadCodeBlockDept"  runat ="server" >
<script type="text/javascript">
         function RowDblClickDept(sender, eventArgs) {
            var CanEdit = "<%=ITCLIB.Security.Security.CanEditModule("PHONGBAN") %>";
            if ((eventArgs.get_tableView().get_name() == "MasterTableViewDept") && (CanEdit == "True")) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        }
</script>
<script type="text/javascript">
    var registeredElements = [];
    function GetRegisteredServerElement(serverID) {
        var clientID = "";
        for (var i = 0; i < registeredElements.length; i++) {
            clientID = registeredElements[i];
            if (clientID.indexOf(serverID) >= 0)
                break;
        }
        return $get(clientID);
    }
    function GetGridServerElementDEPT(serverID, tagName) {
        if (!tagName)
            tagName = "*";

        var grid = $get("<%=RadGridDefts.ClientID %>");
        var elements = grid.getElementsByTagName(tagName);
        for (var i = 0; i < elements.length; i++) {
            var element = elements[i];
            if (element.id.indexOf(serverID) >= 0)
                return element;
        }
    }
  </script> 
<script type="text/javascript">
    var comboBox;
    function OnClientLoadDEPT(sender) {
        comboBox = sender;
    }
    function ClientNodeClicking(sender, args) {
        var txtpk = GetGridServerElementDEPT("hfID");
        var node = args.get_node()
        txtpk.value = node.get_value();
        comboBox.set_text(node.get_text());
        comboBox.set_value(node.get_value());
        comboBox.trackChanges();
        comboBox.get_items().getItem(0).set_text(node.get_text());
        comboBox.commitChanges();
        comboBox.hideDropDown();
    }

    function StopPropagation(e) {
        if (!e) {
            e = window.event;
        }

        e.cancelBubble = true;
    }

    function OnClientDropDownOpenedHandler(sender, eventArgs) {
        var tree = sender.get_items().getItem(0).findControl("RaTreViewDir");
        var selectedNode = tree.get_selectedNode();
        if (selectedNode) {
            selectedNode.scrollIntoView();
        }
    }
    function OnClientShowText(sender, eventArgs) {

    }
    function OnClientCloseText(sender, eventArgs) {
        if (eventArgs.get_argument() != null) {
        }
        else {
        }
        return false;
    }
</script>

</telerik:RadCodeBlock>
<telerik:RadAjaxLoadingPanel Skin="Vista" ID="RadAjaxLoadingPanelDept" runat="server" />
<telerik:RadSplitter ID="RadSplitterDEPT" runat="server" Width="100%" Height ="550px">
<telerik:RadPane ID="LeftPaneDEPT" runat="server" Width="20%">
<telerik:RadPanelBar ID="RadPanelBarListDept" Width ="100%" Height ="100%"  
        runat="server" ExpandMode="MultipleExpandedItems"
        Skin ="Vista" DataFieldID="PK_ID" DataFieldParentID="c_parent" 
        DataSourceID="SqlDataSourceListDept" DataTextField="c_name"  DataValueField="PK_ID" 
        onitemdatabound="RadPanelBarListText_ItemDataBound" 
        onitemclick="RadPanelBarListDept_ItemClick" 
        onprerender="RadPanelBarListDept_PreRender" >
     </telerik:RadPanelBar>
</telerik:RadPane>
<telerik:RadSplitBar ID="RadSplitBarDEPT" runat="server" CollapseMode="Forward" />
<telerik:RadPane ID="MiddlePaneDEPT" runat="server" Width="79%">
<telerik:RadGrid ID="RadGridDefts" runat="server" Skin="Vista" 
    AllowPaging="True" PageSize="20" AllowSorting="True" 
    AllowFilteringByColumn="True" GridLines="None" ShowStatusBar="True"
    AutoGenerateColumns="False"   Height ="100%"
    AllowMultiRowEdit="True" AllowAutomaticDeletes="True" 
    AllowAutomaticInserts="True" AllowAutomaticUpdates="True" 
    DataSourceID="DeftsDataSource" ShowFooter="True"
    ondatabound="RadGridDefts_DataBound" 
    onitemdeleted="RadGridDefts_ItemDeleted" oniteminserted="RadGridDefts_ItemInserted" 
    onitemupdated="RadGridDefts_ItemUpdated" 
    onitemcommand="RadGridDefts_ItemCommand" 
    onitemdatabound="RadGridDefts_ItemDataBound" CellSpacing="0" 
    onitemcreated="RadGridDefts_ItemCreated" 
        onprerender="RadGridDefts_PreRender">
    <PagerStyle FirstPageToolTip="Trang đầu" LastPageToolTip="Trang cuối" NextPagesToolTip="Các trang tiếp" NextPageToolTip="Trang tiếp" 
    PageSizeLabelText="Số bản ghi hiển thị:" PrevPagesToolTip="Các trang sau" PrevPageToolTip="Trang sau" PagerTextFormat="Change page: {4} &nbsp;Trang <strong>{0}</strong>/<strong>{1}</strong>, Bản ghi <strong>{2}</strong> đến <strong>{3}</strong> của tất cả <strong>{5}</strong> bản ghi" />    
    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true" Excel-Format="ExcelML">
<Excel Format="ExcelML"></Excel>
    </ExportSettings>   
     <GroupingSettings CaseSensitive ="false"  />
    <MasterTableView Name ="MasterTableViewDept" CommandItemDisplay="Top" DataSourceID="DeftsDataSource" DataKeyNames="pk_id" ClientDataKeyNames="pk_id" EditMode="PopUp" NoMasterRecordsText="Không có dữ liệu">
        <CommandItemTemplate>
                    <div style="padding: 5px 5px;float:left;width:auto">
                        <b>
                           Quản lý phòng ban, bộ phận: <asp:Label ID="lblcap" runat="server" 
                            Text="Label" onprerender="lblcap_PreRender"></asp:Label></b>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGridDefts.EditIndexes.Count == 0  && ITCLIB.Security.Security.CanEditModule("PHONGBAN") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Edit.gif" />Sửa</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGridDefts.MasterTableView.IsItemInserted && ITCLIB.Security.Security.CanAddModule("PHONGBAN") %>'><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/AddRecord.gif" />Thêm</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Bạn có muốn xóa bản ghi đã chọn không?')" Visible ='<%# ITCLIB.Security.Security.CanDeleteModule("PHONGBAN") %>' runat="server" CommandName="DeleteSelected"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Delete.gif" />Xóa</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/Refresh.gif" />Làm mới</asp:LinkButton>
                    </div>
                    <div style="padding: 5px 5px;float:right;width:auto">
                        <asp:LinkButton ID="ExportToPdfButton" runat="server" CommandName="ExportToPdf"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/pdf.gif" /></asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="ExportToWordButton" runat="server" CommandName="ExportToWord"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/word.gif" /></asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="ExportToExcelButton" runat="server" CommandName="ExportToExcel"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/excel.gif" /></asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="ExportToCsvButton" runat="server" CommandName="ExportToCsv"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Grid/csv.gif" /></asp:LinkButton>&nbsp;&nbsp;
                    </div>
        </CommandItemTemplate>
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
        <Columns>
                <telerik:GridBoundColumn UniqueName="pk_id" HeaderText="" DataField="pk_id" Visible ="false"
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn UniqueName="c_parent" HeaderText="" DataField="c_parent" Visible ="false"
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
                 <telerik:GridTemplateColumn HeaderText ="" ShowFilterIcon="false">   
                 <FilterTemplate >
                  <center> <asp:Button ID="btnSearch" Visible ="false" Text="Tìm" runat="server"/>
                   <asp:ImageButton ID="btnShowAll" runat="server" ImageUrl="../Images/Grid/filterCancel.gif" AlternateText="Xem tất" ToolTip="Xem tất" OnClick="btnShowAll_Click" Style="vertical-align: middle" />
                  </center>
                 </FilterTemplate>
                  <ItemTemplate>
                      <asp:Label ID="lblSTT" runat="server" Text=""></asp:Label>
                </ItemTemplate>
                 <HeaderStyle HorizontalAlign ="Center" Width ="30px" />
                 <ItemStyle HorizontalAlign ="Center" Width ="30px" />
              </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn UniqueName="c_name" HeaderText="Tên phòng ban, bộ phận" DataField="c_name" 
                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                </telerik:GridBoundColumn>
        </Columns>
        <EditFormSettings InsertCaption="Thêm phòng ban, bộ phận mới" CaptionFormatString="Sửa phòng ban, bộ phận: <b>{0}</b>" CaptionDataField="C_NAME" EditFormType="Template" PopUpSettings-Width="600px">
        <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
           <FormTemplate>
           <div class="headerthongtin">
              <ul>
                <li class="lifirst"><asp:LinkButton ID="btnSave" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'><img src="Images/img_save.jpg" /><%# (Container is GridEditFormInsertItem) ? "Lưu" : "Lưu" %></asp:LinkButton></li>
                     <li><asp:LinkButton ID="btnClose" runat="server" CommandName="Cancel"><img src="Images/img_Close.jpg" />Đóng</asp:LinkButton></li>                     
              </ul>
            </div>  
              <table id="Table1" cellspacing="3" cellpadding="3" style="width: 100%" border="0">
                        <tr>
                            <td>
                                Trực thuộc phòng ban (bộ phận):
                            </td>
                            <td>
                                <asp:HiddenField ID="hfID" runat="server"  Value ='<%# Bind("c_parent")%>'/>
           <telerik:RadComboBox ID="rcbParent" runat="server" Width="400px" 
                ShowToggleImage="True" Style="vertical-align: middle;" 
                EmptyMessage="Chọn phòng ban (bộ phận)" ExpandAnimation-Type="None" CollapseAnimation-Type="None">
                     <ItemTemplate>
                        <div id ="div1">
                                 <telerik:RadTreeView runat="server" ID="RaTreViewDir" OnClientNodeClicking ="ClientNodeClicking" 
                                  Width="100%" Height="200px" DataFieldID="pk_id" DataFieldParentID="c_parent" DataSourceID="DeptTreelist" 
                                     DataTextField="c_name" DataValueField="pk_id" >                        
                                  </telerik:RadTreeView>
                          </div>
                        </ItemTemplate>
                         <Items>
                            <telerik:RadComboBoxItem Text=""  />
                        </Items>
                <ExpandAnimation Type="None"></ExpandAnimation>
                <CollapseAnimation Type="None"></CollapseAnimation>
            </telerik:RadComboBox>
                            <script type="text/javascript">
                                var div1 = document.getElementById("div1");
                                div1.onclick = StopPropagation;
                            </script>                           
                   </td>
               </tr>
                        <tr>
                            <td>
                                Tên phòng ban, bộ phận:
                            </td>
                            <td>
                                <asp:HiddenField ID="txtID" Value='<%# Eval("pk_id") %>' runat="server"  />
                                <asp:TextBox ID="txtName" Width ="400px" Text='<%# Bind( "C_NAME") %>' runat="server"></asp:TextBox>
                               <br /><span style="color:Red;">
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Tên phòng ban, bộ phận không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" Display="Dynamic" ValidationGroup="G1"></asp:RequiredFieldValidator>
                                <asp:Label ID="lbtThongbao" runat="server" Text=""></asp:Label>
                             </span> 
                            </td>
                        </tr>                   
                    </table>
             </FormTemplate>

<PopUpSettings Width="600px" ></PopUpSettings>
        </EditFormSettings>
        </MasterTableView>
        <ValidationSettings CommandsToValidate="PerformInsert,Update" ValidationGroup="G1"/>
        <ClientSettings>
            <Selecting AllowRowSelect="True" EnableDragToSelectRows="True" />
            <ClientEvents OnPopUpShowing="PopUpShowing" />
            <ClientEvents OnRowDblClick="RowDblClickDept" />
            <Scrolling  AllowScroll ="false" />
        </ClientSettings>
        <SortingSettings SortedAscToolTip="Sắp xếp tăng dần" 
            SortedDescToolTip="Sắp xếp giảm dần" SortToolTip="Click để sắp xếp" />
        <StatusBarSettings LoadingText="Đang tải..." ReadyText="Sẵn sàng" />

<FilterMenu EnableImageSprites="False"></FilterMenu>
</telerik:RadGrid>
<asp:SqlDataSource ID="DeftsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
        DeleteCommand="DELETE FROM [DMPHONGBAN] WHERE [pk_id] = @pk_id" 
        InsertCommand="INSERT INTO [DMPHONGBAN] ([c_name], [c_parent]) VALUES (@c_name, @c_parent)"
        SelectCommand="SELECT * FROM [DMPHONGBAN] where c_parent =@c_parent ORDER BY LTRIM([c_name])"     
    UpdateCommand="UPDATE [DMPHONGBAN] SET [c_name] = @c_name, [c_parent] = @c_parent WHERE [pk_id] = @pk_id" >
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="c_parent" SessionField="paID"/>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="c_name" Type="String" />
            <asp:Parameter Name="c_parent" Type="Int32" />
            <asp:Parameter Name="pk_id" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="pk_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="c_name" Type="String" />
            <asp:Parameter Name="c_parent" Type="Int32" />
        </InsertParameters>
</asp:SqlDataSource>      
</telerik:RadPane>
 </telerik:RadSplitter>
<telerik:RadWindowManager ReloadOnShow="true" ShowContentDuringLoad="false" ID="RadWindowManagerCG" runat="server" VisibleStatusbar="False"
   OnClientClose="OnClientCloseText" OnClientShow="OnClientShowText" Behaviors ="Close,Reload" ></telerik:RadWindowManager>

<asp:SqlDataSource ID="DeptTreelist" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    SelectCommand="SELECT [pk_id], [c_name], [c_parent] FROM [DMPHONGBAN] ORDER BY LTRIM([c_name])">
</asp:SqlDataSource>
   <asp:SqlDataSource ID="SqlDataSourceListDept" runat="server" ConnectionString="<%$ ConnectionStrings:ExpressSoftConnectionString %>"
    SelectCommand="SELECT [pk_id], [c_name], [c_parent] FROM [DMPHONGBAN] ORDER BY LTRIM([c_name])">
 </asp:SqlDataSource> 
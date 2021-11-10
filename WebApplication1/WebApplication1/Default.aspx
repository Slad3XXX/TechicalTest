<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-4">
            <h2>Add Player</h2>
            <p>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
                    <Fields>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                        <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                        <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                        <asp:BoundField DataField="balance" HeaderText="balance" SortExpression="balance" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [players] WHERE ([username] = @username)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [players] WHERE [Id] = @original_Id AND [username] = @original_username AND [first_name] = @original_first_name AND [last_name] = @original_last_name AND [password] = @original_password AND [balance] = @original_balance AND [email] = @original_email" InsertCommand="INSERT INTO [players] ([Id], [username], [first_name], [last_name], [password], [balance], [email]) VALUES (@Id, @username, @first_name, @last_name, @password, @balance, @email)" UpdateCommand="UPDATE [players] SET [username] = @username, [first_name] = @first_name, [last_name] = @last_name, [password] = @password, [balance] = @balance, [email] = @email WHERE [Id] = @original_Id AND [username] = @original_username AND [first_name] = @original_first_name AND [last_name] = @original_last_name AND [password] = @original_password AND [balance] = @original_balance AND [email] = @original_email">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_username" Type="String" />
                        <asp:Parameter Name="original_first_name" Type="String" />
                        <asp:Parameter Name="original_last_name" Type="String" />
                        <asp:Parameter Name="original_password" Type="String" />
                        <asp:Parameter Name="original_balance" Type="Decimal" />
                        <asp:Parameter Name="original_email" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="first_name" Type="String" />
                        <asp:Parameter Name="last_name" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="balance" Type="Decimal" />
                        <asp:Parameter Name="email" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" DefaultValue="%" Name="username" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="first_name" Type="String" />
                        <asp:Parameter Name="last_name" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="balance" Type="Decimal" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_username" Type="String" />
                        <asp:Parameter Name="original_first_name" Type="String" />
                        <asp:Parameter Name="original_last_name" Type="String" />
                        <asp:Parameter Name="original_password" Type="String" />
                        <asp:Parameter Name="original_balance" Type="Decimal" />
                        <asp:Parameter Name="original_email" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                &nbsp;</p>
        </div>
        <div class="col-md-4">
            <h2>Players List (search by username)</h2>
            <p>
                <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="124px" ></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Search" />
            </p>
            <p>
                &nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Width="715px">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                        <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                        <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                        <asp:BoundField DataField="balance" HeaderText="balance" SortExpression="balance" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">No records found.</div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </p>
        </div>
    </div>

</asp:Content>

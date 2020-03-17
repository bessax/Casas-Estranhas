<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="FormCasa.aspx.cs" Inherits="CasasEstranhas.admin.FormCasa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
    <h1 id="h1_titulo" runat="server">Alteração de Casa</h1>
    <hr />
    
    <asp:DetailsView ID="dvCasa" runat="server" AutoGenerateRows="False" 
        DataKeyNames="IdCasa" DataSourceID="sqldsCasa" DefaultMode="Edit" 
        onitemcommand="dvCasa_ItemCommand" oniteminserted="dvCasa_ItemInserted" 
        onitemupdated="dvCasa_ItemUpdated">
        <FieldHeaderStyle Width="110px" />
        <Fields>
            <asp:BoundField DataField="IdCasa" HeaderText="IdCasa" InsertVisible="False" 
                ReadOnly="True" SortExpression="IdCasa" Visible="False" />
            <asp:TemplateField HeaderText="Categoria" SortExpression="IdCategoria">              
                          

                <EditItemTemplate>
                   <asp:DropDownList runat="server" ID="ddlCategoria"
                    DataTextField="Descricao"
                    DataValueFiel="IdCategoria"
                    SelectedValue='<%# Bind("IdCategoria") %>' DataSourceID="sqldsCategorias" 
                        DataValueField="IdCategoria">
               </asp:DropDownList>    
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList runat="server" ID="ddlCategoria"
                    DataTextField="Descricao"
                    DataValueFiel="IdCategoria"
                    SelectedValue='<%# Bind("IdCategoria") %>' DataSourceID="sqldsCategorias" 
                        DataValueField="IdCategoria">
               </asp:DropDownList>    
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="Descricao" HeaderText="Descrição" 
                SortExpression="Descricao" />
            <asp:BoundField DataField="PrecoMinimo" HeaderText="Preço Mínimo (R$)" 
                SortExpression="PrecoMinimo" />
            <asp:BoundField DataField="Visitas" HeaderText="Visitas" 
                SortExpression="Visitas" />
            <asp:BoundField DataField="Ofertas" HeaderText="Ofertas" 
                SortExpression="Ofertas" />
            <asp:BoundField DataField="DataFinalizacao" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="Data Finalização" SortExpression="DataFinalizacao" />
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" 
                CancelText="Cancelar" DeleteText="Excluir" EditText="Alterar" 
                InsertText="Inserir" NewText="Novo" SelectText="Selecionar" 
                UpdateText="Atualizar" />
        </Fields>
    </asp:DetailsView>
    
    <asp:SqlDataSource ID="sqldsCasa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CasasEstranhasConnectionString %>" 
        DeleteCommand="DELETE FROM [Casa] WHERE [IdCasa] = @IdCasa" 
        InsertCommand="INSERT INTO [Casa] ([IdCategoria], [Nome], [Descricao], [PrecoMinimo], [Visitas], [Ofertas], [DataCadastro], [DataFinalizacao], [MaiorLance], [ExecutorLance], [DataLance]) VALUES (@IdCategoria, @Nome, @Descricao, @PrecoMinimo, @Visitas, @Ofertas, @DataCadastro, @DataFinalizacao, @MaiorLance, @ExecutorLance, @DataLance)" 
        SelectCommand="SELECT [IdCasa], [IdCategoria], [Nome], [Descricao], [PrecoMinimo], [Visitas], [Ofertas], [DataCadastro], [DataFinalizacao], [MaiorLance], [ExecutorLance], [DataLance] FROM [Casa] WHERE ([IdCasa] = @IdCasa)" 
        UpdateCommand="UPDATE [Casa] SET [IdCategoria] = @IdCategoria, [Nome] = @Nome, [Descricao] = @Descricao, [PrecoMinimo] = @PrecoMinimo, [Visitas] = @Visitas, [Ofertas] = @Ofertas, [DataCadastro] = @DataCadastro, [DataFinalizacao] = @DataFinalizacao, [MaiorLance] = @MaiorLance, [ExecutorLance] = @ExecutorLance, [DataLance] = @DataLance WHERE [IdCasa] = @IdCasa">
        <DeleteParameters>
            <asp:Parameter Name="IdCasa" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdCategoria" Type="Int32" />
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="Descricao" Type="String" />
            <asp:Parameter Name="PrecoMinimo" Type="Decimal" />
            <asp:Parameter Name="Visitas" Type="Int32" />
            <asp:Parameter Name="Ofertas" Type="Int32" />
            <asp:Parameter Name="DataCadastro" Type="DateTime" />
            <asp:Parameter Name="DataFinalizacao" Type="DateTime" />
            <asp:Parameter Name="MaiorLance" Type="Decimal" />
            <asp:Parameter Name="ExecutorLance" Type="String" />
            <asp:Parameter Name="DataLance" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="IdCasa" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="IdCategoria" Type="Int32" />
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="Descricao" Type="String" />
            <asp:Parameter Name="PrecoMinimo" Type="Decimal" />
            <asp:Parameter Name="Visitas" Type="Int32" />
            <asp:Parameter Name="Ofertas" Type="Int32" />
            <asp:Parameter Name="DataCadastro" Type="DateTime" />
            <asp:Parameter Name="DataFinalizacao" Type="DateTime" />
            <asp:Parameter Name="MaiorLance" Type="Decimal" />
            <asp:Parameter Name="ExecutorLance" Type="String" />
            <asp:Parameter Name="DataLance" Type="DateTime" />
            <asp:Parameter Name="IdCasa" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="sqldsCategorias" 
        ConnectionString="<%$ ConnectionStrings:CasasEstranhasConnectionString %>" 
        SelectCommand="SELECT [Descricao], [IdCategoria] FROM [Categoria]" />

</asp:Content>

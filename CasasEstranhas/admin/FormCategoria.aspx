<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="FormCategoria.aspx.cs" Inherits="CasasEstranhas.admin.FormCategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
    
    <asp:FormView ID="fvCategoria" runat="server" DataKeyNames="IdCategoria" 
        DataSourceID="sqldsCategoria" DefaultMode="Edit" 
        onitemcommand="fvCategoria_ItemCommand" 
        oniteminserted="fvCategoria_ItemInserted" 
        onitemupdated="fvCategoria_ItemUpdated">
        <EditItemTemplate>
            <h1> Alteração da Categoria"<%#Eval("descricao") %></h1>
            <hr />
            
            Descricao:
            <p>
                Nome da Categoria:
                <asp:TextBox ID="DescricaoTextBox" runat="server" 
                    Text='<%# Bind("Descricao") %>' />
                    <asp:RequiredFieldValidator ID="rfvDescricao" ControlToValidate="DescricaoTextBox" runat="server" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
            <p />
            <p>
             
                 <asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />   
                    &nbsp;
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Atualizar" />            

             </p>
        </EditItemTemplate>
        <InsertItemTemplate>

            <h1>
            Nova Categoria
            </h1>
            <hr />
            <p>
              Nome Categoria
              <asp:TextBox ID="DescricaoTextBox" runat="server" 
                Text='<%# Bind("Descricao") %>' />
                <asp:RequiredFieldValidator ID="rfvDescricao" ControlToValidate="DescricaoTextBox" runat="server" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
            </p>
            
            <p>
            
            
            <asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            &nbsp;
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Inserir" />
            
            </p>
        </InsertItemTemplate>
       
    </asp:FormView>
    
    <asp:SqlDataSource ID="sqldsCategoria" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CasasEstranhasConnectionString %>" 
        DeleteCommand="DELETE FROM [Categoria] WHERE [IdCategoria] = @IdCategoria" 
        InsertCommand="INSERT INTO [Categoria] ([Descricao]) VALUES (@Descricao)" 
        SelectCommand="SELECT [IdCategoria], [Descricao] FROM [Categoria] WHERE ([IdCategoria] = @IdCategoria)" 
        UpdateCommand="UPDATE [Categoria] SET [Descricao] = @Descricao WHERE [IdCategoria] = @IdCategoria">
        <DeleteParameters>
            <asp:Parameter Name="IdCategoria" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Descricao" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="IdCategoria" QueryStringField="id" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Descricao" Type="String" />
            <asp:Parameter Name="IdCategoria" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

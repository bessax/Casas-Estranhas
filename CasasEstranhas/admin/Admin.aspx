<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="CasasEstranhas.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="server">
    <h1>Administração do Site</h1>
    <hr />
    <h2>Categorias</h2>
    <div style="vertical-align:middle; padding-bottom:10px;" >
        <img id="Img1" runat="server" src="~/img/btn_inserir.png" 
            alt="Inserir" title="Inserir" />
        <a runat="server" href="~/admin/FormCategoria.aspx">Nova Categoria</a>
    </div>
    <asp:GridView ID="gvCategorias" runat="server" DataSourceID="sqldsCategorias" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="idcategoria" 
        ForeColor="Black" GridLines="Vertical" 
        onrowdeleted="gvCategorias_RowDeleted">
        <Columns>
            <asp:TemplateField HeaderText="Opções" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" >
                        <img runat="server" src="~/img/btn_casas.png" alt="casas" title="Casas" />
                    </asp:LinkButton>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/admin/FormCategoria.aspx?id=" + Eval("idcategoria") %>'>
                        <img runat="server" src="~/img/btn_alterar.png" alt="alterar" title="Alterar" />
                    </asp:HyperLink>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" 
                        OnClientClick="return confirm('Deseja realmente excluir esta categoria?');">
                        <img runat="server" src="~/img/btn_excluir.png" alt="excluir" title="Excluir" />
                    </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="58px" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="descricao" HeaderText="Categoria" 
                SortExpression="descricao" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
    
    
    <h2>Casas da Categoria Selecionada</h2>
    <div style="vertical-align:middle; padding-bottom:10px;" >
        <img runat="server" src="~/img/btn_inserir.png" 
            alt="Inserir" title="Inserir" />
        <a runat="server" href="~/admin/FormCasa.aspx">Nova Casa</a>
    </div>
    <asp:GridView ID="gvCasas" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="idcasa" DataSourceID="sqldsCasasPorCategoria" 
    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
    CellPadding="3" ForeColor="Black" GridLines="Vertical" 
        EmptyDataText="Selecione uma categoria acima.">
        <Columns>
            <asp:TemplateField HeaderText="Opções" ShowHeader="False">
                <ItemTemplate>                    
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/admin/FormCasa.aspx?id=" + Eval("idcasa") %>'>
                        <img id="Img2" runat="server" src="~/img/btn_alterar.png" alt="alterar" title="Alterar" />
                    </asp:HyperLink>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" 
                        OnClientClick="return confirm('Deseja realmente excluir esta casa?');">
                        <img id="Img3" runat="server" src="~/img/btn_excluir.png" alt="Excluir" title="Excluir" />
                    </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" >                
                <ItemStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="visitas" HeaderText="Visitas" 
                SortExpression="visitas" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ofertas" HeaderText="Ofertas" 
                SortExpression="ofertas" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="datafinalizacao" HeaderText="Finalização" 
                SortExpression="datafinalizacao" DataFormatString="{0:dd/MM/yyyy}" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsCategorias" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CasasEstranhasConnectionString %>" 
        SelectCommand="SELECT [idcategoria], [descricao] FROM [Categoria]"
        DeleteCommand="DELETE FROM Categoria WHERE idcategoria = @idcategoria">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqldsCasasPorCategoria" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CasasEstranhasConnectionString %>" 
        SelectCommand="SELECT Casa.idcasa, Casa.nome, Casa.visitas, Casa.ofertas, 
            Casa.datafinalizacao
            FROM Casa
            WHERE Casa.idcategoria = @idcategoria 
            ORDER BY Casa.datacadastro" 
        DeleteCommand="DELETE FROM Casa WHERE idcasa = @idcasa">
        
        <SelectParameters>
            <asp:ControlParameter Name="idcategoria" ControlID="gvCategorias" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

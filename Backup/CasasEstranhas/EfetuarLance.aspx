<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true"
    CodeBehind="EfetuarLance.aspx.cs" Inherits="CasasEstranhas.EfetuarLance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">

    <asp:FormView ID="fvDetalhesCasa" runat="server" 
        DataSourceID="sqldsDetalhesCasa">
    <ItemTemplate>
        <h3 class="text-left">
            <%# Eval("nome") %></h3>
        <h6 class="text-left">
            <%# "Categoria: " + Eval("NomeCategoria") %></h6>
        <div class="clear">
        </div>
        <div class="aligncenter">
            <img src='<%# "img/casas/" + 
                    Eval("idCasa", "{0:d4}") + ".jpg" %>' alt="" class="bordered" style="width: 410px;" />
        </div>
        <p class="text-justify">
            <%# Eval("descricao") %>
        </p>
        <p>
            <%# string.IsNullOrEmpty(Eval("maiorlance").ToString()) ? 
                    "<b>Lance mínimo: </b>" + Eval("precominimo", "{0:c}") : 
                    "<b>Maior lance: </b>" + Eval("maiorlance", "{0:c}") + "<br />"%><br />
            <%# string.IsNullOrEmpty(Eval("executorlance").ToString()) ? 
                    "Nenhum lance até o momento." : 
                    "<b>Executor do lance: </b>" + Eval("executorlance")%><br />
            <asp:HiddenField runat="server" ID="hdfMaiorLance" Value='<%# Eval("maiorlance").ToString() == "" ?Eval("preco_minimo"): Eval("maiorlance") %>' />
        </p>
        <p>
            <b>Visitas:</b>
            <%#Eval("Visitas")%><br />
            <b>Ofertas: </b>
            <%# Eval("ofertas") %><br />
            <b>Data finalização: </b>
            <%# Eval("datafinalizacao", "{0:dd/MM/yyyy}") %>
        </p>

        </ItemTemplate>
    </asp:FormView>
    
    <asp:SqlDataSource ID="sqldsDetalhesCasa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CasasEstranhasConnectionString %>" 
        SelectCommand="SELECT Casa.IdCasa, Casa.Nome, Casa.Descricao, Casa.PrecoMinimo, Casa.Visitas, Casa.Ofertas, Casa.DataCadastro, Casa.DataFinalizacao, Casa.MaiorLance, Casa.ExecutorLance, Casa.DataLance, Categoria.IdCategoria, Categoria.Descricao AS NomeCategoria FROM Casa INNER JOIN Categoria ON Casa.IdCategoria = Categoria.IdCategoria WHERE (Casa.IdCasa = @Idcasa)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Idcasa" QueryStringField="id" />
        </SelectParameters>
    
    </asp:SqlDataSource>
    <div style="padding-left:5px" >
     <b>Seu nome:</b><br />
    <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvNome" runat="server" 
        ErrorMessage="Preenchimento obrigatório." 
        ControlToValidate="txtNome">
    </asp:RequiredFieldValidator>
    <br />
    <b>Seu lance:</b><br />
    <asp:TextBox ID="txtLance" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvLance" runat="server" 
        ErrorMessage="Preenchimento obrigatório." 
        ControlToValidate="txtLance" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="cpvLance" runat="server" 
        ErrorMessage="Formato numérico inválido." 
        ControlToValidate="txtLance" 
        Display="Dynamic" Operator="DataTypeCheck" Type="Double">
    </asp:CompareValidator>
    <br />
    <asp:LinkButton runat="server" ID="btnEfetuarLance" 
        onclick="btnEfetuarLance_Click">
        Efetuar Lance</asp:LinkButton>
    <br /><br />

    </div>
</asp:Content>

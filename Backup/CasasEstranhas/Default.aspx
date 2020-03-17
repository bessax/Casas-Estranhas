<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="CasasEstranhas.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
    <div id="div_casasemdestaque" runat="server">
        <h1>Casas em Destaque</h1>
	    <p class="meta">As 5 casas mais visitadas dos últimos 30 dias</p>
    </div>
    
    <div id="div_casasporcategoria" runat="server">
        <h1 runat="server" id="h1_categoria">Casas da Categoria Selecionada</h1>
	    <p class="meta">As casas da categoria selecionada</p>
    </div>
    
	<hr />
    
    <asp:ListView ID="lvCasasEmDestaque" runat="server" DataKeyNames="IdCasa" 
        DataSourceID="sqldsCasasEmDestaque">        
        
        <EmptyDataTemplate>
            <h2>Não há casas nesta categoria.</h2>
        </EmptyDataTemplate>
        
        <ItemTemplate>
        
            <h3 class="text-left"><%# Eval("Nome") %></h3>
            <div class="clear"></div>
            <div class="alignright" style="width:128px;height:192px;">
                <img src='<%# "img/casas/" + Eval("IdCasa", "{0:d4}") + ".jpg" %>' 
                    alt="" class="bordered" style="width:120px;"/>
            </div>
			<p class="text-justify">
			    <%# Eval("Descricao") %>
			</p>
			<p>
			    <b>Visitas: </b>
			    <%# Eval("Visitas") %><br />
			    <b>Data de finalização: </b>
			    <%# Eval("DataFinalizacao", "{0:dd/MM/yyyy}") %>
			</p>
			<p>
                <%# string.IsNullOrEmpty(Eval("MaiorLance").ToString()) ? "" :
                    "<b>Lance atual: </b>" + Eval("MaiorLance", "{0:c}") + "<br />" %>
                
                <%# string.IsNullOrEmpty(Eval("ExecutorLance").ToString()) ? 
                    "Não há lances para esta casa até o momento." :
                    "<b>Executor do lance: </b>" + Eval("ExecutorLance") + "<br />" %>
            </p>
            <p>
                <a href='<%# "EfetuarLance.aspx?id=" + Eval("IdCasa")  %>' >
                    Quero dar um lance
                </a>
            </p>

            <div class="clear"></div>
            <hr />
        
        </ItemTemplate>
        
        <AlternatingItemTemplate>
        
            <h3 class="text-right"><%# Eval("Nome") %></h3>
            <div class="clear"></div>
            <div class="alignleft" style="width:128px;height:192px;">
                <img src='<%# "img/casas/" + Eval("IdCasa", "{0:d4}") + ".jpg" %>' 
                    alt="" class="bordered" style="width:120px;"/>
            </div>
			<p class="text-justify">
			    <%# Eval("Descricao") %>
			</p>
			<p>
			    <b>Visitas: </b>
			    <%# Eval("Visitas") %><br />
			    <b>Data de finalização: </b>
			    <%# Eval("DataFinalizacao", "{0:dd/MM/yyyy}") %>
			</p>
			<p>
                <%# string.IsNullOrEmpty(Eval("MaiorLance").ToString()) ? "" :
                    "<b>Lance atual: </b>" + Eval("MaiorLance", "{0:c}") + "<br />" %>
                
                <%# string.IsNullOrEmpty(Eval("ExecutorLance").ToString()) ? 
                    "Não há lances para esta casa até o momento." :
                    "<b>Executor do lance: </b>" + Eval("ExecutorLance") + "<br />" %>
            </p>
            <p>
                <a href='<%# "EfetuarLance.aspx?id=" + Eval("IdCasa")  %>' >
                    Quero dar um lance
                </a>
            </p>

            <div class="clear"></div>
            <hr />
        
        </AlternatingItemTemplate>
        
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" >
                <span ID="itemPlaceholder" runat="server" />
            </div>
        </LayoutTemplate>
        
    </asp:ListView>
    
    <asp:SqlDataSource ID="sqldsCasasEmDestaque" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CasasEstranhasConnectionString %>" 
        SelectCommand="SELECT TOP (5) Casa.IdCasa, Casa.Nome, Casa.Descricao, 
            Casa.PrecoMinimo, Casa.Visitas, Casa.Ofertas, Casa.DataFinalizacao, 
            Casa.MaiorLance, Casa.ExecutorLance, Casa.DataLance, 
            Categoria.Descricao AS Categoria FROM Casa 
            INNER JOIN Categoria ON Casa.IdCategoria = Categoria.IdCategoria 
            WHERE [DataFinalizacao] > GetDate() ORDER BY Casa.Visitas DESC">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sqldsCasasPorCategoria" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CasasEstranhasConnectionString %>" 
        SelectCommand="SELECT Casa.IdCasa, Casa.Nome, Casa.Descricao, Casa.PrecoMinimo, 
            Casa.Visitas, Casa.Ofertas, Casa.DataFinalizacao, Casa.MaiorLance, 
            Casa.ExecutorLance, Casa.DataLance, Categoria.Descricao AS Categoria 
            FROM Casa INNER JOIN Categoria ON Casa.IdCategoria = Categoria.IdCategoria 
            WHERE Casa.IdCategoria = @IdCategoria 
            and [DataFinalizacao] > GetDate() ORDER BY Casa.Visitas DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="IdCategoria" QueryStringField="Categoria" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

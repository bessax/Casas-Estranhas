<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucCasaMaisRecente.ascx.cs"
    Inherits="CasasEstranhas.wucCasaMaisRecente" %>
<h4>
    Casa mais recente</h4>
<asp:FormView runat="server" ID="fvCasaMaisRecente" DataSourceID="sldsCasaMaisRecente">
    <ItemTemplate>
        <img src='<%# "img/casas/" + Eval("IdCasa", "{0:d4}") + ".jpg" %>' width="180" alt="Foto Casa"
            class="alignleft" />
        <div style="width: 186px">
            <h3>
                <%# Eval("Nome") %></h3>
            <p class="text-justify">
                <%# Eval("Descricao") %>
            </p>
            <p>
                <b>Lance atual: </b>
                <%# Eval("MaiorLance", "{0:c}") %><br />
                <b>Executor do lance: </b>
                <%# Eval("ExecutorLance") %><br />
                <a href='<%# "EfetuarLance.aspx?id=" + Eval("IdCasa") %>'>Quero dar um lance</a>
            </p>
        </div>
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource runat="server" ID="sldsCasaMaisRecente" ConnectionString="<%$ ConnectionStrings:CasasEstranhasConnectionString %>"
    SelectCommand="SELECT TOP 1 [IdCasa], [Nome], [Descricao], [MaiorLance], [ExecutorLance] FROM [Casa] ORDER BY [DataCadastro] DESC" />

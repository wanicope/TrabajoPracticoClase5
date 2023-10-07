<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrosContables.aspx.cs" Inherits="TrabajoPractico3.GestionRegistros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registros Contables</title>
</head>
<body>
       
  <div class="container">
        <li class="nav-item">
          <a class="nav-link" href="Menu.aspx">Menu</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Cuentas.aspx">Cuentas</a>
        </li>
    </div>
  </div>
</nav>
    <form id="form1" runat="server">
        <div>
            <h2 class="mb-4">Registros Contables</h2>
            <div class="mb-3">
                <h5 class="mb-3">Seleccione Registro:</h5>
                <asp:DropDownList ID="DropDownListRegistrosExistentes" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceRegistrosContables" DataTextField="id" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <h5 class="mb-3">Seleccione Cuenta:</h5>
                <asp:DropDownList ID="DropDownListCuentasExistentes" runat="server" DataSourceID="SqlDataSourceCuentasExistentes" DataTextField="descripcion" DataValueField="id" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <h5 class="mb-3">Importe</h5>
                <asp:TextBox ID="TextBoxMonto" runat="server" required placeholder="Importe" TextMode="Number" ToolTip="Ingrese importe" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <h5 class="mb-3">Deber/Haber</h5>
                <asp:DropDownList ID="DropDownListTipo" runat="server" CssClass="form-select">
                    <asp:ListItem Selected="True" Value="False">Debe</asp:ListItem>
                    <asp:ListItem Value="True">Haber</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button ID="ButtonCR" runat="server" Text="Crear Registro" OnClick="ButtonCR_Click" />
                <asp:Button ID="ButtonER" runat="server" Text="Eliminar Registro" OnClientClick="return confirm('¿Estás seguro de que quieres eliminar esta cuenta?');" OnClick="ButtonER_Click" />
                <asp:Button ID="ButtonMR" runat="server" Text="Modificar Registro" OnClick="ButtonMR_Click" />
            </div>
            <asp:Label ID="LabelMensaje" runat="server" CssClass="alert alert-info mt-3"></asp:Label>
        </div>
        <asp:Table ID="TableRegistros" CssClass="table table-striped mt-4" runat="server">
        </asp:Table>
        
        <asp:SqlDataSource ID="SqlDataSourceCuentasExistentes" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRegistrosContables" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT * FROM [RegistrosContables]" UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="DropDownListRegistrosExistentes" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DropDownListCuentasExistentes" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBoxMonto" Name="monto" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListTipo" Name="tipo" PropertyName="SelectedValue" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="DropDownListCuentasExistentes" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBoxMonto" Name="monto" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListTipo" Name="tipo" PropertyName="SelectedValue" Type="Boolean" />
                <asp:ControlParameter ControlID="DropDownListRegistrosExistentes" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRegistrosContablesJoinDescripcion" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT RegistrosContables.id, RegistrosContables.idCuenta, RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.id" UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="tipo" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="tipo" Type="Boolean" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceMontoRegistroExistente" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT * FROM [RegistrosContables] WHERE ([id] = @id)" UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="tipo" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListRegistrosExistentes" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="tipo" Type="Boolean" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
        </body>
</html>

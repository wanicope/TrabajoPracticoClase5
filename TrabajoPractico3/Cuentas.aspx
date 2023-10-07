<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuentas.aspx.cs" Inherits="TrabajoPractico3.GestionCuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cuentas</title>
</head>
<body>

  <div class="container">
    
        <li class="nav-item">
          <a class="nav-link" href="Menu.aspx">Menu</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="RegistrosContables.aspx">Registros Contables</a>
        </li>
     
    </div>
  </div>
</nav>

    <form id="form1" runat="server" class="container py-5">
        <div class="card p-4 shadow bg-white">
            <h2 class="mb-4">Cuentas</h2>
            <div class="mb-3">
                <h5 class="mb-3">Seleccione Cuenta:</h5>
                <asp:DropDownList ID="DropDownListCuentas" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCuentas" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="DropDownListCuentas_SelectedIndexChanged" CssClass="form-select">
                </asp:DropDownList>
            </div>
            <div class="mb-3">
                <h5 class="mb-3">Ingrese Descripción:</h5>
                <asp:TextBox ID="TextBoxDC" placeholder="Descripción Cuenta" runat="server" ToolTip="Crear Cuenta" required onkeyup="filtrarTabla(this.value)" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="d-flex">
                <asp:Button ID="ButtonCC" runat="server" Text="Crear Cuenta" OnClick="ButtonCC_Click" />
                <asp:Button ID="ButtonEC" runat="server" OnClick="ButtonEC_Click" OnClientClick="return confirm('¿Estás seguro de que quieres eliminar esta cuenta?');" Text="Eliminar Cuenta" />
                <asp:Button ID="ButtonMC" runat="server" OnClick="ButtonMC_Click" Text="Modificar Cuenta" />
            </div>
            <asp:Label ID="LabelMensaje" runat="server"></asp:Label>
        </div>
        <asp:Table ID="TableCuentas" CssClass="table table-striped mt-4" runat="server">
        </asp:Table>
        <asp:SqlDataSource ID="SqlDataSourceCuentas" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="DropDownListCuentas" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBoxDC" Name="descripcion" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBoxDC" Name="descripcion" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="DropDownListCuentas" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    
</body>
</html>

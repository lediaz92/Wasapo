unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus, Vcl.Buttons, Vcl.Grids, UTipos, LO_ArbolBinario, LO_ArbolTrinario,LO_LDChatsCompartidos, LO_Pilas, LO_Hash,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, Vcl.XPMan;
type
 TForm1 = class(TForm)
//____Paneles____
 PIngresar:TPanel;
 PChats:TPanel;
 PRegistrarse:TPanel;
 PAjustes:TPanel;
 PIContacto:TPanel;
 PNuevoContacto:TPanel;
 PEstados:TPanel;
 PContactos:TPanel;
 PConfirmacion:TPanel;
//____Labels____
 LPITelefono:TLabel;
 LPIClave:TLabel;
 LPIRegistrar:TLabel;
 LPRNombre:TLabel;
 LPRTelefono:TLabel;
 LPRApellido:TLabel;
 LPRCodArea:TLabel;
 LPRCodPais:TLabel;
 Nombre:TLabel;
 Telefono:TLabel;
 Estado:TLabel;
 LPCContactos:TLabel;
 LPICNombre:TLabel;
 LPICTelefono:TLabel;
 LPICEstado:TLabel;
 LPICConexion:TLabel;
 Label5:TLabel;
 Label6:TLabel;
 Label7:TLabel;
 Label8:TLabel;
 Label9:TLabel;
 Label10:TLabel;
 Label11:TLabel;
 Label12:TLabel;
 LPICApellido:TLabel;
 LPEEstado:TLabel;
 LPEOpcion:TLabel;
 Label2:TLabel;
//____Edits____
 EPITelefono:TEdit;
 EPIContrasenia:TEdit;
 EPRNombre:TEdit;
 EPRApellido:TEdit;
 EPRTelefono:TEdit;
 EPRCodArea:TEdit;
 EPRCodPais:TEdit;
 EPANombre:TEdit;
 EPATelefono:TEdit;
 EPAEstado:TEdit;
 EPICNombre:TEdit;
 EPICTelefono:TEdit;
 EPICEstado:TEdit;
 EPAApellido:TEdit;
 EPRContrasenia:TEdit;
 EPCDatosChat:TEdit;
 EPNCTelefono:TEdit;
 EPNCNombre:TEdit;
 EPNCApellido:TEdit;
 EPICApellido:TEdit;
 EPEEstado:TEdit;
 EPCMensaje:TEdit;
 EPAContrasenia:TEdit;
//____Buttons____
 BPRRegistrarse:TBitBtn;
 BPIIngresar:TBitBtn;
 BPIRegistrarse:TBitBtn;
 BPNCAgregar:TBitBtn;
 BPChatsEnviar:TBitBtn;
 BPEModificar:TBitBtn;
 BPEEliminar:TBitBtn;
 BPConfGuardar:TBitBtn;
 EPASeleccionar:TBitBtn;
 BPICCerrar:TBitBtn;
 BPRCerrar:TBitBtn;
 BPNCCerrar:TBitBtn;
 BPECerrar:TBitBtn;
 BPAEliminar:TBitBtn;
 BPACerrar:TBitBtn;
 BPAGuardar:TBitBtn;
 BPConfCerrar:TBitBtn;
 BPCInfoContacto:TBitBtn;
 BPCCerrar:TBitBtn;
 BPICGuardar:TBitBtn;
 BPICEliminar:TBitBtn;
 BPChatsCerrar:TBitBtn;
//____Images____
 Image1:TImage;
 Image2:TImage;
 Image3:TImage;
//____Menu____
 MainMenu1:TMainMenu;
 AJUSTES1:TMenuItem;
 CONTACTOS1:TMenuItem;
 CHATS1:TMenuItem;
 NuevoContacto1:TMenuItem;
 VerContactos1:TMenuItem;
 Cerrarsesion1:TMenuItem;
//____StringGrid____
 StringGridChats:TStringGrid;
 StringGridContactos:TStringGrid;
 StringGridEstados:TStringGrid;
//____Listbox____
 ListBoxChats:TListBox;
//____Timer____
 Timer1:TTimer;
//Declaraci�n de funciones y procedimientos************************************************************
  procedure SelectChat(Sender:TObject; ACol, ARow:Integer);
//
 Procedure FormCreate(Sender:TObject);
 Procedure EPRCodPaisKeyPress(Sender:TObject; Var Key:Char);
 Procedure EPRCodAreaKeyPress(Sender:TObject; Var Key:Char);
 Procedure EPRTelefonoKeyPress(Sender:TObject; Var Key:Char);
 Procedure EPRNombreKeyPress(Sender:TObject; Var Key:Char);
 Procedure EPRApellidoKeyPress(Sender:TObject; Var Key:Char);
 Procedure EPITelefonoKeyPress(Sender:TObject; Var Key:Char);
 Procedure EPNCTelefonoKeyPress(Sender:TObject; Var Key:Char);
 Procedure AJUSTES1Click(Sender:TObject);
 Procedure NuevoContacto1Click(Sender:TObject);
 Procedure VerContactos1Click(Sender:TObject);
 Procedure CHATS1Click(Sender:TObject);
 Procedure Cerrarsesion1Click(Sender:TObject);
 Procedure BSalirClick(Sender:TObject);
 Procedure BPRRegistrarseClick(Sender:TObject);
 Procedure BPRCerrarClick(Sender:TObject);
 Procedure BPIIngresarClick(Sender:TObject);
 Procedure BPIRegistrarseClick(Sender:TObject);
 Procedure BPICGuardarClick(Sender:TObject);
 Procedure BPICEliminarClick(Sender:TObject);
 Procedure BPCInfoContactoClick(Sender:TObject);
 Procedure BPICCerrarClick(Sender:TObject);
 Procedure BPCCerrarClick(Sender:TObject);
 Procedure BPAGuardarClick(Sender:TObject);
 Procedure BPAEliminarClick(Sender:TObject);
 Procedure BPACerrarClick(Sender:TObject);
 Procedure EPASeleccionarClick(Sender:TObject);
 Procedure BPEModificarClick(Sender:TObject);
 Procedure BPEEliminarClick(Sender:TObject);
 Procedure BPConfGuardarClick(Sender:TObject);
 Procedure BPECerrarClick(Sender:TObject);
 Procedure BPConfCerrarClick(Sender:TObject);
 Procedure BPNCAgregarClick(Sender:TObject);
 Procedure BPNCCerrarClick(Sender:TObject);
 Procedure BPChatsEnviarClick(Sender:TObject);
 Procedure BPChatsCerrarClick(Sender:TObject);
 Procedure StringGridEstadosSelectCell(Sender:TObject; ACol, ARow:Integer; Var CanSelect:Boolean);
 Procedure Timer1Timer(Sender:TObject);
//*****************************************************************************************************
 Procedure InicializarArchivosLocales();
 Procedure InicializarArchivosCompartidos();
 Function NumValido(Var Key:Char):TBooleano;
 Function LetraValida(Var Key:Char):TBooleano;
 Procedure MostrarGrid(Var Me:TipoMeEstados; NombreArchivoC:TString; NombreArchivoD:TString; Var MeAux:TipoMeEstados;
                           NombreArchivoCAux:TString; NombreArchivoDAux:TString; Var Contador: TEntero);
 Procedure MostrarContactos(Grid:TStringGrid);
 Procedure MostrarEstados();
 Procedure CerrarPaneles();
 Procedure IniciarSesion();
 Procedure Registrarse();
 Procedure AjustesPerfil(); 
 Procedure GuardarAjustesPerfil();
 Procedure ModificarEstadosAjustesPerfil();
 Procedure EliminarEstadosAjustesPerfil();
 Procedure EliminarCuentaAjustesPerfil();
 Procedure AgregarContacto();
 Procedure InfoContacto();
 Procedure EliminarContacto();
 Procedure ModificarContacto();
 Procedure EnviarMensajeChats();
 Procedure SincronizarDatos();
 Procedure ActualizarChats();
 Procedure AsignarColores();
 Procedure CerrarSesion();
 procedure StringGridChatsSelectCell(Sender: TObject; ACol, ARow: Integer;
 var CanSelect: Boolean);
Private
  { Private declarations }
Public
  { Public declarations }
end;
Var
  Form1: TForm1;
  RutaCompartida: TRuta;
//*****Variables Globales para modificar Usuario*****
  GlobalID:TEntero;
  GlobalNombre:TString;
  GlobalApellido:TString;
  GlobalFHora:TFechaHora;
  GlobalUltCon:TFechaHora;
  GlobalVisible:TBooleano;
  GlobalContrasenia:TString;
  GlobalTelefonoUsuario:TEntero;
  GlobalEstado:TSTring;
//*****Variables Globales para modificar Contacto*****
  GlobalIDContacto:TEntero;
  GlobalTelefono:TEntero;
  GlobalRegistrado:TBooleano;
  GlobalBloqueado:TBooleano;
  GlobalPadre:TPosicion;
  GlobalHI:TPosicion;
  GlobalHD:TPosicion;
//*****Contadores globales de estados*****
  GlobalEstadosGrales:TEntero;
  GlobalEstadosUsuario:TEntero;
//Implementaci�n de funciones y procedimientos*********************************************************
Implementation
{$R *.dfm}
//*****************************************************************************************************
Procedure TForm1.FormCreate(Sender:TObject);
Begin
 //SendMessage(Form1.Handle,WM_SYSCOMMAND,SC_MAXIMIZE,0);
 //Form1.Menu:=nil;
 AsignarColores();
 CerrarPaneles();
 InicializarArchivosLocales();
 InicializarArchivosCompartidos();
End;
//*****************************************************************************************************
Procedure TForm1.EPRCodPaisKeyPress(Sender:TObject;Var Key:Char);
Var
 Valido: TBooleano;
Begin
 Valido:=NumValido(Key);
 If not (Valido) then
  Messagedlg('El c�digo de pa�s debe ser num�rico', mtERROR, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.EPRCodAreaKeyPress(Sender:TObject;Var Key:Char);
Var
 Valido:TBooleano;
Begin
 Valido:=NumValido(Key);
 If not(valido) then
  Messagedlg('El c�digo de �rea debe ser num�rico', mtERROR, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.EPRTelefonoKeyPress(Sender:TObject;Var Key:Char);
Var
 Valido: TBooleano;
Begin
 Valido:=NumValido(Key);
 If not(Valido) then
  Messagedlg('El n�mero de tel�fono debe ser num�rico', mtERROR, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.EPRNombreKeyPress(Sender:TObject; Var Key:Char);
Var
 Valida:TBooleano;
Begin
 Valida:=LetraValida(Key);
 If not(valida) then
  Messagedlg('El nombre no debe contener n�meros ni s�mbolos', mtERROR, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.EPRApellidoKeyPress(Sender:TObject; Var Key:Char);
Var
 Valida:TBooleano;
Begin
 Valida:= LetraValida(Key);
 If not(valida) then
  Messagedlg('El apellido no debe contener n�meros ni s�mbolos', mtERROR, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.EPITelefonoKeyPress(Sender:TObject;Var Key:Char);
Var
 Valido:TBooleano;
Begin
 Valido:=NumValido(Key);
 If not(valido) then
  Messagedlg('El n�mero de tel�fono debe ser num�rico', mtERROR, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.EPNCTelefonoKeyPress(Sender:TObject; Var Key:Char);
Var
 Valido:TBooleano;
Begin
 Valido:=NumValido(Key);
 If not(Valido) then
  Messagedlg('El tel�fono debe ser num�rico', mtERROR, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.AJUSTES1Click(Sender:TObject);
Begin
 AjustesPerfil();
End;
//*****************************************************************************************************
Procedure TForm1.NuevoContacto1Click(Sender:TObject);
Begin
 CerrarPaneles();
 PNuevoContacto.Show;
 PNuevoContacto.BringToFront;
End;
//*****************************************************************************************************
Procedure TForm1.VerContactos1Click(Sender:TObject);
Begin
 CerrarPaneles();
 MostrarContactos(StringGridContactos);
 PContactos.Show;
 PContactos.BringToFront;
End;
//*****************************************************************************************************
Procedure TForm1.CHATS1Click(Sender:TObject);
begin
 CerrarPaneles();
 MostrarContactos(StringGridChats);
 PChats.Show;
 PChats.BringToFront;
end;
//*****************************************************************************************************
Procedure TForm1.Cerrarsesion1Click(Sender:TObject);
Begin
 CerrarSesion();
End;
//*****************************************************************************************************
Procedure TForm1.BSalirClick(Sender:TObject);
Begin
 Form1.Close;
End;
//*****************************************************************************************************
Procedure TForm1.BPRRegistrarseClick(Sender:TObject);
Begin
 Registrarse();
End;
//*****************************************************************************************************
Procedure TForm1.BPRCerrarClick(Sender: TObject);
Begin
 EPRNombre.Clear;
 EPRApellido.Clear;
 EPRContrasenia.Clear;
 EPRCodPais.Clear;
 EPRCodArea.Clear;
 EPRTelefono.Clear;
 PRegistrarse.Hide;
End;
//*****************************************************************************************************
Procedure TForm1.BPIIngresarClick(Sender:TObject);
Begin
 IniciarSesion();
End;
//*****************************************************************************************************
Procedure TForm1.BPIRegistrarseClick(Sender:TObject);
Begin
 CerrarPaneles();
 PIngresar.Hide;
 PRegistrarse.Show;
 PRegistrarse.BringToFront;
End;
//*****************************************************************************************************
Procedure TForm1.BPICGuardarClick(Sender:TObject);
Begin
 ModificarContacto();
End;
//*****************************************************************************************************
Procedure TForm1.BPICEliminarClick(Sender:TObject);
Begin
 EliminarContacto();
End;
//*****************************************************************************************************
Procedure TForm1.BPCInfoContactoClick(Sender:TObject);
Begin
 InfoContacto();
End;
//*****************************************************************************************************
Procedure TForm1.BPICCerrarClick(Sender:TObject);
Begin
 EPICNombre.Clear;
 EPICApellido.Clear;
 EPICTelefono.Clear;
 EPICEstado.Clear;
 CerrarPaneles();
 PContactos.Show;
 PContactos.BringToFront;
End;
//*****************************************************************************************************
Procedure TForm1.BPCCerrarClick(Sender:TObject);
Begin
 PContactos.Hide;
End;
//*****************************************************************************************************
Procedure TForm1.BPAGuardarClick(Sender:TObject);
Begin
 Messagedlg('A continuaci�n ingrese su contrase�a para efectuar los cambios realizados ', mtINFORMATION, [mbOK], 0);
 PConfirmacion.Show;
 PConfirmacion.BringToFront;
End;
//*****************************************************************************************************
Procedure TForm1.BPAEliminarClick(Sender:TObject);
Begin
 EliminarCuentaAjustesPerfil();
End;
//*****************************************************************************************************
Procedure TForm1.BPACerrarClick(Sender:TObject);
Begin
 EPANombre.Clear;
 EPAApellido.Clear;
 EPATelefono.Clear;
 EPAEstado.Clear;
 PAJustes.Hide;
End;
//*****************************************************************************************************
Procedure TForm1.EPASeleccionarClick(Sender:TObject);
Begin
 MostrarEstados();
 PEstados.Show;
 PEstados.BringToFront;
End;
//*****************************************************************************************************
Procedure TForm1.BPEModificarClick(Sender:TObject);
Begin
 ModificarEstadosAjustesPerfil();
End;
//*****************************************************************************************************
Procedure TForm1.BPEEliminarClick(Sender:TObject);
Begin
 EliminarEstadosAjustesPerfil();
End;
//*****************************************************************************************************
Procedure TForm1.BPConfGuardarClick(Sender:TObject);
Begin
 GuardarAjustesPerfil();
End;
//*****************************************************************************************************
Procedure TForm1.BPECerrarClick(Sender:TObject);
Var
 EstadoActual:TSTring;
Begin
 EstadoActual:= EPEEstado.Text;
 EPAEstado.Text:=EstadoActual;
 PEstados.Hide;
End;
//*****************************************************************************************************
Procedure TForm1.BPConfCerrarClick(Sender:TObject);
Begin
 EPAContrasenia.Clear;
 PConfirmacion.Hide; 
End;
//*****************************************************************************************************
Procedure TForm1.BPNCAgregarClick(Sender:TObject);
Begin
 AgregarContacto();
End;
//*****************************************************************************************************
Procedure TForm1.BPNCCerrarClick(Sender: TObject);
Begin
 EPNCNombre.Clear;
 EPNCApellido.Clear;
 EPNCTelefono.Clear;
 PNuevoContacto.Hide;
End;
//*****************************************************************************************************
Procedure TForm1.BPChatsEnviarClick(Sender:TObject);
Begin
 EnviarMensajeChats();
End;
//*****************************************************************************************************
Procedure TForm1.BPChatsCerrarClick(Sender:TObject);
Begin
 PChats.Hide;
End;
//*****************************************************************************************************


Procedure TForm1.StringGridEstadosSelectCell(Sender:TObject; ACol, ARow:Integer; Var CanSelect:Boolean);
Var
 Texto:Tstring;
Begin
 If (CanSelect) then
  Texto:=StringGridEstados.Cells[ACol,ARow];
 EPEEstado.Text:=Texto;
End;
//*****************************************************************************************************
Procedure TForm1.Timer1Timer(Sender:TObject);
Begin
 SincronizarDatos();
 ActualizarChats();
End;
//*****************************************************************************************************
Procedure TForm1.InicializarArchivosLocales();
Var
 MeContactos:TipoMeContactos;
 MeEstados:TipoMeEstados;
 MeEstadosAux:TipoMeEstados;
 MeEstadosUsuario:TipoMeEstados;
 MeEStadosUsuarioAux:TipoMeEstados;
Begin
 LO_ArbolBinario.CrearMe(MeContactos);
 LO_Pilas.CrearMe(MeEstados,_ArchivoCEstados,_ArchivoDEstados);
 LO_Pilas.CrearMe(MeEstadosAux,_ArchivoCEstadosAux,_ArchivoDEstadosAux);
 LO_Pilas.CrearMe(MeEstadosUsuario,_ArchivoCEstadosUsuario,_ArchivoDEstadosUsuario);
 LO_Pilas.CrearMe(MeEstadosUsuarioAux,_ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux);
End;
//*****************************************************************************************************
Procedure TForm1.InicializarArchivosCompartidos();
Var
 MeChatsCompartido:TipoMeChatsCompartido;
 MeUsuarios:TipoMeUsuarios;
Begin
  try
    LO_Hash.CrearMe(MeUsuarios);
    LO_ArbolTrinario.CrearMe(MeChatsCompartido);
  except
    on e : exception do
    begin
    ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
      'Mensaje del error: ' + e.Message);
    end;
  end;
End;
//*****************************************************************************************************
Function TForm1.NumValido(Var Key:Char):TBooleano;
Begin
 NumValido:= true;
 If (Key<#48) or (Key >#57) then
  If (Key<>#8) then
   begin
    NumValido:= false;
    Key:=#0;
   end;
End;
//*****************************************************************************************************
Function TForm1.LetraValida(Var Key:Char):TBooleano;
Begin
 LetraValida:= true;
 If (Key<#65) or (Key >#122) then
  If (key<>#8) then
   begin
    LetraValida:= false;
    Key:=#0;
   end;
End;
//*****************************************************************************************************
Procedure TForm1.MostrarGrid(Var Me:TipoMeEstados; NombreArchivoC:TString; NombreArchivoD:TString;
                             Var MeAux:TipoMeEstados; NombreArchivoCAux:TString;
                             NombreArchivoDAux:TString; Var Contador:TEntero);
Var
 RDEstados:TRDEstados;
 Texto:TString;
 FechaHora:TFechaHora;
 I:TEntero;
Begin
 StringGridEstados.RowCount:=Contador;
 I:=_Cero;
 LO_Pilas.CrearMe(MeAux,NombreArchivoCAux,NombreArchivoDAux);
 LO_Pilas.AbrirMe(MeAux,NombreArchivoCAux,NombreArchivoDAux);
 LO_Pilas.AbrirMe(Me,NombreArchivoC,NombreArchivoD);
 While (I<Contador) do
  begin
   RDEstados:=LO_Pilas.Tope(Me);
   Texto:=RDEstados.Texto;
   FechaHora:=RDEstados.Fecha_Hora;
   LO_Pilas.Desapilar(Me);
   If (I=_Cero) then
    EPEEstado.Text:= Texto;
   StringGridEstados.Cells[0,i]:=Texto;
   StringGridEstados.Cells[1,i]:=FechaHora;
   LO_Pilas.Apilar(MeAux,RDEstados);
   I:=I+_Uno;
  end;
 LO_Pilas.CerrarMe(MeAux);
 LO_Pilas.CerrarME(Me);
end;
//*****************************************************************************************************
Procedure TForm1.MostrarContactos(Grid:TStringGrid);
Var
 ArregloContactos:Array[1..200] of TRDContactos;
 Num:TEntero;
 I, Contador:Integer;
 MeContactos:TipoMeContactos;
 Nombre, Apellido, Nombre_Apellido, Snum, Estado:TString;
 PosAux:TPosicion;
Begin
 Contador:=_Cero;
 LO_ArbolBinario.AbrirMe(MeContactos);
 PosAux:= LO_ArbolBinario.Raiz(MeContactos);
 LO_ArbolBinario.PreOrden(MeContactos,PosAux,ArregloContactos,Contador,GlobalID);
 Grid.RowCount:=Contador+_Uno;
 ListboxChats.Clear;
 For i:=_Cero to Contador do
  begin
   Nombre:=ArregloContactos[i].Nombre;
   Apellido:=ArregloContactos[i].Apellido;
   Num:= ArregloContactos[i].Numero_Celular;
   Estado:=ArregloContactos[i].Estado;
   Nombre_Apellido:= Nombre+ ' ' + Apellido;
   Snum:=IntToStr(num);
   If (Nombre <>'') then
    begin
     Grid.Cells[0,i]:= Nombre_Apellido;
     Grid.Cells[1,i]:= Snum;
    end;
  end;
End;
//*****************************************************************************************************
Procedure TForm1.MostrarEstados();
Var
 Contador, CantEstadosUsuario, Id_Interno:TEntero;
 MeEstados, MeEstadosUsuario, MeEstadosAux, MeEstadosUsuarioAux:TipoMeEstados;
Begin
 Contador:=_Cero;
 CantEstadosUsuario:=_Cero;
 Id_Interno:=GlobalId;
 GlobalEstadosUsuario:=_Cero;
 GlobalEstadosGrales:=_Cero;
 LO_Pilas.DevolverEstados(MeEstados,MeEstadosUsuario,Id_Interno,Contador,CantEstadosUsuario);
 GlobalEstadosGrales:=Contador;
 GlobalEstadosUsuario:=CantEstadosUsuario;
 LO_Pilas.ReconstruirPila(MeEstados,_ArchivoCEstadosAux,_ArchivoDEstadosAux,MeEstadosAux,
                          _ArchivoCEstados,_ArchivoDEstados,Contador);
 Lo_Pilas.ReconstruirPila(MeEstadosUsuario,_ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux,
                          MeEstadosUsuarioAux,_ArchivoCEstadosUsuario,_ArchivoDEstadosUsuario,
                          CantEstadosUsuario);
 MostrarGrid(MeEstadosUsuarioAux,_ArchivoCEstadosUsuario,_ArchivoDEstadosUsuario,MeEstadosUsuario,
             _ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux,CantEstadosUsuario);
 LO_Pilas.ReconstruirPila(MeEstadosUsuario,_ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux,MeEstadosUsuarioAux,
                          _ArchivoCEstadosUsuario,_ArchivoDEstadosUsuario,CantEstadosUsuario);
End;
//*****************************************************************************************************
Procedure TForm1.CerrarPaneles();
Begin
 PAjustes.Hide;
 PNuevoContacto.Hide;
 PContactos.Hide;
 PChats.Hide;
 PIContacto.Hide;
 PRegistrarse.Hide;
 PEstados.Hide;
 PConfirmacion.Hide;
End;
//*****************************************************************************************************
Procedure TForm1.IniciarSesion();
Var
 SNum, Contrasenia:TString;
 MeUsuarios:TipoMeUsuarios;
 RDUsuarios:TRDUsuarios;
 Num, Id_Interno:TEntero;
 Pos:TPosicion;
 ExisteNumero:TBooleano;
 SelectedButton:Integer;
Begin
 If (EPITelefono.Text<>'') and (EPIContrasenia.Text<>'') then
  begin
   Snum:=EPITelefono.Text;
   Num:=StrToInt64(Snum);
   Contrasenia:=EPIContrasenia.Text;
   LO_Hash.AbrirMe(MeUsuarios);
   Pos:=LO_Hash.BuscarPos(MeUsuarios,Num);
   ExisteNumero:=LO_Hash.ExisteNro(MeUsuarios,Num,Pos);
   If not(ExisteNumero) then
    Messagedlg('El numero ingresado no se encuentra registrado', mtERROR, [mbOK], 0)
   else
    begin
     LO_Hash.AbrirMe(MeUsuarios);
     RDUsuarios:=LO_Hash.CapturarRD(MeUsuarios,Pos);
     If (RDUsuarios.NRO=Num) then
      If not(RDUsuarios.En_Linea) then
       begin
        If (RDUsuarios.Contrasenia=Contrasenia) then
         begin
          Id_Interno:=RDUsuarios.Id_Interno;
          Messagedlg('Bienvenido a Wasapo '+ RDUsuarios.Nombre, mtINFORMATION, [mbOK], 0);
          GlobalTelefonoUsuario:=Num;
          GlobalId:=Id_Interno;
          GlobalNombre:=RDUsuarios.Nombre;
          GlobalApellido:=RDUsuarios.Apellido;
          RDUsuarios.En_Linea:=true;
          LO_Hash.ModificarRD(MeUsuarios,Pos,RDUsuarios);
          CerrarPaneles();
          PIngresar.Hide;
          Form1.Menu:=MainMenu1;
          Timer1.Enabled:=true;
         end
        else
         begin
          Messagedlg('La contrase�a ingresada es incorrecta', mtERROR, [mbOK], 0);
          EPIContrasenia.Clear;
         end;
       end
      else
        begin
          SelectedButton:=MessageDlg('El usuario ya se encuentra en l�nea, desea reconectarse?',mtCustom,[mbYes,mbCancel], 0);
          if (SelectedButton = mrYes)
          then begin
            RDUsuarios.En_Linea:=false;
            LO_Hash.ModificarRD(MeUsuarios,Pos,RDUsuarios);
            IniciarSesion();
          end;


        end;
    end;
  end;
End;
//*****************************************************************************************************
Procedure TForm1.Registrarse();
Var
 Num:TEntero;
 Snum, Nombre, Apellido, FechaHora, Contrasenia:TString;
 PosAux, Pos:TPosicion;
 RCHash:TRControl;
 MeUsuarios:TipoMeUsuarios;
 MeEstados:TipoMeEstados;
 RDUsuarios, RDUsuariosAux:TRDUsuarios;
 RDEstados:TRDEstados;
 RCEstados:TRCEstados;
 ExisteNumero:TBooleano;
Begin
 LO_Hash.AbrirMe(MeUsuarios);
 If (EPRNombre.Text<>'') and (EPRApellido.Text<>'') and (EPRCodPais.Text<>'')
     and (EPRCodArea.Text<>'') and (EPRTelefono.Text<>'') then
 begin
  Nombre:=EPRNombre.Text;
  Apellido:=EPRApellido.Text;
  Contrasenia:=EPRContrasenia.Text;
  Snum:=EPRCodPais.Text+EPRCodArea.Text+EPRTelefono.Text;
  FechaHora:=DateToStr(Now) + ' ' + TimeToStr(Now);
  Num:=StrToInt64(Snum);
  RCHash:=LO_Hash.CapturarRC(MeUsuarios);
  If (RCHash.Cant=_TopeReg) then
   Messagedlg('Registro de usuarios lleno', mtINFORMATION, [mbOK], 0)
  else
   begin
   Posaux:=LO_Hash.BuscarPos(MeUsuarios,num);
   ExisteNumero:=LO_Hash.ExisteNro(MeUsuarios,Num,PosAux);
   If (ExisteNumero) then
    Messagedlg('Ya existe un usuario registrado con ese n�mero de tel�fono', mtINFORMATION, [mbOK], 0)
   else
    begin
     Pos:=PosAux;
     LO_Hash.AbrirMe(MeUsuarios);
     RDUsuarios.Nro:=Num;
     RDUsuarios.Nombre:=Nombre;
     RDUsuarios.Apellido:=Apellido;
     RDUsuarios.Contrasenia:= Contrasenia;
     RDUsuarios.Fecha_Hora:=FechaHora;
     RDUsuarios.Estado:='Hey there! I am using Wasapo!';
     RDUsuarios.En_Linea:=False;
     RDUsuarios.Ultima_Conexion:=FechaHora;
     RDUsuarios.Visible:=True;
     LO_Hash.InsertarRD(MeUsuarios,Pos,RDUsuarios);
     Lo_Hash.AbrirMe(MeUsuarios);
     RDUsuariosAux:=LO_Hash.CapturarRD(MeUsuarios,Pos);
     LO_Pilas.AbrirMe(MeEstados,_ArchivoCEstados,_ArchivoDEstados);
     RCEstados.Cant:=_Cero;
     RDEstados.Id_Interno:=RDUsuariosAux.Id_Interno;
     RDEstados.Fecha_Hora:=FechaHora;
     RDEstados.Enlace:= _PosNula;
     RDEstados.Texto:='Estoy durmiendo';
     LO_Pilas.Apilar(MeEstados,RDEstados);
     RDEstados.Texto:='No puedo hablar, solo Wasapos';
     LO_Pilas.Apilar(MeEstados,RDEstados);
     RDEstados.Texto:='Ocupado';
     LO_Pilas.Apilar(MeEstados,RDEstados);
     RDEstados.Texto:='Disponible';
     LO_Pilas.Apilar(MeEstados,RDEstados);
     RDEstados.Texto:='Hey there! I am using Wasapo!';
     LO_Pilas.Apilar(MeEstados,RDEstados);
     LO_Pilas.CerrarMe(MeEstados);
     Messagedlg('Usuario registrado con �xito', mtINFORMATION, [mbOK], 0);
     CerrarPaneles();
     PIngresar.Show;
    end;
   end;
   EPRNombre.Clear;
   EPRApellido.Clear;
   EPRContrasenia.Clear;
   EPRCodPais.Clear;
   EPRCodArea.Clear;
   EPRTelefono.Clear;
  end
  else
   Messagedlg('Complete todos los campos por favor', mtINFORMATION, [mbOK], 0)
End;
//*****************************************************************************************************
Procedure TForm1.AjustesPerfil();
Var
 Num:TEntero;
 Pos:TPosicion;
 MeUsuarios:TipoMeUsuarios;
 RDUsuarios:TRDUsuarios;
 SNum: TString;
Begin
 LO_Hash.AbrirMe(MeUsuarios);
 Num:=GlobalTelefonoUsuario;
 SNum:=inttostr(Num);
 Pos:=LO_Hash.BuscarPos(MeUsuarios,Num);
 RDUsuarios:=LO_Hash.CapturarRD(MeUsuarios,Pos);
 EPANombre.Text:= RDUsuarios.Nombre;
 EPAApellido.Text:= RDUsuarios.Apellido;
 EPAEstado.Text:= RDUsuarios.Estado;
 EPATelefono.Text:=SNum;
 CerrarPaneles();
 PAjustes.Show;
 PAjustes.BringToFront;
End;
//*****************************************************************************************************
Procedure TForm1.GuardarAjustesPerfil();
Var
 Nombre, Apellido, Estado, SNum, Contrasenia:TString;
 MeUsuarios:TipoMeUsuarios;
 RDUsuario: TRDUsuarios;
 Num:TEntero;
 Pos:TPosicion;
Begin
 Nombre:=EPANombre.Text;
 Apellido:=EPAApellido.Text;
 Estado:=EPAEstado.Text;
 Contrasenia:=EPAContrasenia.Text;
 SNum:=EPATelefono.Text;
 Num:=StrToInt64(SNum);
 LO_Hash.AbrirMe(MeUsuarios);
 Pos:=LO_Hash.BuscarPos(MeUsuarios,Num);
 RDUsuario:=LO_Hash.CapturarRD(MeUsuarios,Pos);
 If (RDUsuario.Contrasenia=Contrasenia) then
  begin
   RDUsuario.Nombre:=Nombre;
   RDUsuario.Apellido:=Apellido;
   RDUsuario.Estado:=Estado;
   RDUsuario.Nro:=Num;
   RDUsuario.Contrasenia:=Contrasenia;
   RDUsuario.Fecha_Hora:=GlobalFHora;
   RDUsuario.Id_Interno:=GlobalID;
   RDUsuario.Ultima_Conexion:=GlobalUltCon;
   RDUsuario.Visible:=GlobalVisible;
   RDUsuario.En_Linea:=true;
   LO_Hash.ModificarRD(MeUsuarios,Pos,RDUsuario);
   Messagedlg('Cambios realizados con �xito', mtINFORMATION, [mbOK], 0);
   EPANombre.Clear;
   EPAApellido.Clear;
   EPAEstado.Clear;
   EPATelefono.Clear;
   EPAContrasenia.Clear;
   CerrarPaneles();
  end
 else
  begin
   Messagedlg('La contrase�a ingresada es incorrecta', mtERROR, [mbOK], 0);
   EPAContrasenia.Text;
  end;
End;
//*****************************************************************************************************
Procedure TForm1.ModificarEstadosAjustesPerfil();
Var
 RDEstados:TRDEstados;
 MeEstados, MeEstadosUsuario, MeAuxEstados:TipoMeEstados;
 Estado, Seleccion:TString;
 FechaHora:TFechaHora;
 Id_Interno, CantEstadosUsuario:TEntero;
Begin
 Id_Interno:=GlobalId;
 Seleccion:=StringGridEstados.Cells[StringGridEstados.Col,StringGridEstados.Row];
 Estado:=EPEEstado.Text;
 If (Seleccion<>Estado) then
  begin
   LO_Pilas.AbrirMe(MeEstados,_ArchivoCEStados,_ArchivoDEstados);
   LO_Pilas.AbrirMe(MeEstadosUsuario,_ArchivoCEStadosUsuario,_ArchivoDEstadosUsuario);
   RDEstados.Id_Interno:=Id_Interno;
   RDEstados.Texto:=Estado;
   FechaHora:=DateToStr(Now) + ' ' + TimeToStr(Now);
   RDEstados.Fecha_Hora:=FechaHora;
   LO_Pilas.Apilar(MeEstados,RDEstados);
   LO_Pilas.Apilar(MeEstadosUsuario,RDEstados);
   GlobalEstadosGrales:=GlobalEstadosGrales+_Uno;
   GlobalEstadosUsuario:=GlobalEstadosUsuario+_Uno;
   CantEstadosUsuario:=GlobalEstadosUsuario;
   LO_Pilas.CerrarMe(MeEstados);
   LO_Pilas.CerrarMe(MeEstadosUsuario);
   LO_Pilas.AbrirMe(MeEstadosUsuario,_ArchivoCEStadosUsuario,_ArchivoDEstadosUsuario);
   MostrarGrid(MeEstadosUsuario,_ArchivoCEstadosUsuario,_ArchivoDEstadosUsuario,MeAuxEstados,
               _ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux,CantEstadosUsuario);
   LO_Pilas.ReconstruirPila(MeEstadosUsuario,_ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux,MeAuxEstados,
                             _ArchivoCEstadosUsuario, _ArchivoDEstadosUsuario, CantEstadosUsuario);
   Messagedlg('Estado modificado con �xito', mtINFORMATION, [mbOK], 0)
  end;
End;
//*****************************************************************************************************
Procedure TForm1.EliminarEstadosAjustesPerfil();
Var
 Seleccion, Estado:TString;
 Contador, CantEstadosUsuario, Id_Interno:TEntero;
 MeEstados, MeEstadosUsuario, MeEstadosAux, MeEstadosUsuarioAux:TipoMEEstados;
Begin
 Seleccion:=StringGridEstados.Cells[StringGridEstados.Col,StringGridEstados.Row];
 Estado:= EPEEstado.Text;
 If (seleccion=Estado) then
  begin
   Contador:=_Cero;
   CantEstadosUsuario:=_Cero;
   Id_Interno:=GlobalId;
   GlobalEstadosUsuario:=_Cero;
   GlobalEstadosGrales:=_Cero;
   LO_Pilas.EliminarEstados(MeEstados,MeEstadosUsuario,Id_Interno,Contador,CantEstadosUsuario,Estado);
   GlobalEstadosGrales:=Contador;
   GlobalEstadosUsuario:=CantEstadosUsuario;
   LO_Pilas.ReconstruirPila(MeEstados,_ArchivoCEstadosAux,_ArchivoDEstadosAux,MeEstadosAux,
                             _ArchivoCEstados, _ArchivoDEstados, Contador);
   Lo_Pilas.ReconstruirPila(MeEstadosUsuario,_ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux,MeEstadosUsuarioAux,
                            _ArchivoCEstadosUsuario,_ArchivoDEstadosUsuario,CantEstadosUsuario);
   MostrarGrid(MeEstadosUsuarioAux,_ArchivoCEstadosUsuario,_ArchivoDEstadosUsuario,MeEstadosUsuario,
               _ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux,CantEstadosUsuario);
   LO_Pilas.ReconstruirPila(MeEstadosUsuario,_ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux,MeEstadosUsuarioAux,
                             _ArchivoCEstadosUsuario,_ArchivoDEstadosUsuario,CantEstadosUsuario);
   Messagedlg('Estado eliminado con �xito', mtINFORMATION, [mbOK], 0);
 end;
End;
//*****************************************************************************************************
Procedure TForm1.EliminarCuentaAjustesPerfil();
Var
 RDUsuarios:TRDUsuarios;
 Num:TEntero;
 Pos:TPosicion;
 SNum:TString;
 MeUsuarios:TipoMeUsuarios;
Begin
 LO_Hash.AbrirMe(MeUsuarios);
 SNum:=EPATelefono.Text;
 Num:=StrToInt64(sNum);
 Pos:=LO_Hash.BuscarPos(MeUsuarios,Num);
 RDUsuarios.NRO:=_MenosUno;
 RDUsuarios.Id_Interno:=_MenosUno;
 RDUsuarios.Nombre:='';
 RDUsuarios.Apellido:='';
 RDUsuarios.Contrasenia:='';
 RDUsuarios.Fecha_Hora:=DateToStr(Now) + ' ' + TimeToStr(Now);
 RDUsuarios.Estado:='';
 RDUsuarios.Ultima_Conexion:=DateToStr(Now) + ' ' + TimeToStr(Now);
 RDUsuarios.Visible:=false;
 RDUsuarios.En_Linea:=False;
 LO_Hash.EliminarRD(MeUsuarios,Pos,RDUsuarios);
 Messagedlg('Usuario '+ Snum +' eliminado con �xito', mtINFORMATION, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.AgregarContacto();
Var
 SNum, Nombre, Apellido:TString;
 Pos, PosRegistrado, PosRCLista:TPosicion;
 MeContactos:TipoMeContactos;
 MeUsuarios:TipoMeUsuarios;
 MeChatsCompartido:TipoMeChatsCompartido;
 RCLista:TRXChatsCompartido;
 RDChat:TRDChatsCompartido;
 RDUsuarios:TRDUsuarios;
 RDContactos:TRDContactos;
 Num:TEntero;
 Existe, Registrado, ExisteRCLista:TBooleano;
Begin
 If (EPNCNombre.Text<>'') and (EPNCApellido.Text<>'') and (EPNCTelefono.Text<>'') then
  begin
   LO_ArbolBinario.AbrirMe(MeContactos);
   Nombre:=EPNCNombre.Text;
   Apellido:=EPNCApellido.Text;
   SNum:=EPNCTelefono.Text;
   Num:=StrToInt64(SNum);
   Pos:=_PosNula;
   Existe:=LO_ArbolBinario.ExisteRD(MeContactos,Num,Pos);
   If (Existe) then
    begin
     Messagedlg('El numero de telefono pertenece a un contacto existente', mtERROR, [mbOK], 0);
     EPNCTelefono.Clear;
    end
   else
    begin
     RDContactos.Id_Interno:=_Cero;
     RDContactos.Numero_Celular:=Num;
     RDContactos.Nombre:=Nombre;
     RDContactos.Apellido:=Apellido;
     RDContactos.Bloqueado:=false;
     RDContactos.Padre:=_PosNula;
     RDContactos.Hijo_Izquierdo:=_PosNula;
     RDContactos.Hijo_Derecho:=_PosNula;
     PosRegistrado:=LO_Hash.BuscarPos(MeUsuarios,Num);
     Registrado:=LO_Hash.ExisteNro(MeUsuarios,Num,PosRegistrado);
     If not(Registrado) then
      RDContactos.Registrado:=false
     else
      begin
       RDUsuarios:=LO_Hash.CapturarRD(MeUsuarios,PosRegistrado);
       RDContactos.Registrado:=true;
       RDContactos.Id_Interno:=RDUsuarios.Id_Interno;
       RDContactos.Estado:=RDUsuarios.Estado;
       RDContactos.Ultima_Conexion:=RDUsuarios.Ultima_Conexion;
      end;
     LO_ArbolBinario.InsertarRD(MeContactos,Pos,RDContactos,Num);
     ExisteRCLista:=LO_ArbolTrinario.BuscarRX(MeChatsCompartido,GlobalID,RDContactos.Id_Interno,PosRCLista);
     If (not(ExisteRCLista))and(Registrado)then
      begin
       RDChat.Mensaje:='Estamos Conectados';
       LO_ArbolTrinario.InsertarRX(MeChatsCompartido,PosRCLista,RCLista,GlobalID,RDContactos.Id_Interno);
       LO_LDChatsCompartidos.InsertarChat(MeChatsCompartido,RDChat,GlobalID,RDContactos.Id_Interno);
      end;
     Messagedlg('Contacto agregado con �xito', mtINFORMATION, [mbOK], 0);
     EPNCNombre.Clear;
     EPNCApellido.Clear;
     EPNCTelefono.Clear; 
    end;
  end
 else
  Messagedlg('Complete todos los campos por favor', mtINFORMATION, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.InfoContacto();
Var
 Nombre, Apellido, Estado, SNum, Conexion:TString;
 Num, Telefono:TEntero;
 RDContactos:TRDContactos;
 Existe: TBooleano;
 Pos:TPosicion;
 MeContactos:TipoMeContactos;
Begin
 SNum:=StringGridContactos.Cells[1, StringGridContactos.Row];
 If (Snum<>'') then
  begin
   Num:=StrToInt64(SNum);
   GlobalTelefono:=Num;
   Pos:=_PosNula;
   LO_ArbolBinario.AbrirMe(MeContactos);
   Existe:= LO_ArbolBinario.ExisteRD(MeContactos,Num,Pos);
   RDContactos:=LO_ArbolBinario.CapturarRD(MeContactos,Pos);
   Nombre:=RDContactos.Nombre;
   Apellido:=RDContactos.Apellido;
   Estado:=RDContactos.Estado;
   Telefono:=RDContactos.Numero_Celular;
   Conexion:=RDContactos.Ultima_Conexion;
   If (RDContactos.En_Linea) then
    LPICConexion.Caption:='En Linea'
   else
    LPICConexion.Caption:='Ultima conexion: '+Conexion;
  EPICNombre.Text:=Nombre;
  EPICApellido.Text:=Apellido;
  EPICTelefono.Text:=IntToStr(Telefono);
  EPICEstado.Text:=Estado;
  PIContacto.Show;
  PIContacto.BringToFront;
 end;
End;
//*****************************************************************************************************
Procedure TForm1.EliminarContacto();
Var
 SNum:TString;
 Pos:TPosicion;
 MeContactos:TipoMeContactos;
 Num, I:TEntero;
 Existe:TBooleano;
Begin
 LO_ArbolBinario.AbrirMe(MeContactos);
 Snum:=EPICTelefono.Text;
 Num:=StrToInt64(SNum);
 Pos:=_PosNula;
 Existe:=LO_ArbolBinario.ExisteRD(MeContactos,Num,Pos);
 If (Existe) then
  begin
   LO_ArbolBinario.EliminarRD(MeContactos,Pos);
   Messagedlg('Contacto eliminado con �xito', mtINFORMATION, [mbOK], 0);
   PIContacto.Hide;
   MostrarContactos(StringGridContactos);
   I:=StringGridContactos.RowCount;
   StringGridContactos.RowCount:=I;
   LO_ArbolBinario.CerrarMe(MeContactos);
  end
 else
  Messagedlg('El contacto no existe', mtINFORMATION, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.ModificarContacto();
Var
 SNum, Nombre, Apellido, Estado:TString;
 Pos, PosAux:TPosicion;
 MeContactos:TipoMeContactos;
 Num:TEntero;
 RDContactos:TRDContactos;
 Existe:TBooleano;
Begin
 If (EPICNombre.Text<>'') and (EPICApellido.Text<>'') and (EPICTelefono.Text<>'') then
  begin
   LO_ArbolBinario.AbrirMe(MeContactos);
   Nombre:=EPICNombre.Text;
   Apellido:=EPICApellido.Text;
   SNum:= EPICTelefono.Text;
   Num:=StrToInt64(SNum);
   Estado:=EPICEstado.Text;
   Pos:=_PosNula;
   Existe:=LO_ArbolBinario.ExisteRD(MeContactos,GlobalTelefono,Pos);
   RDContactos:=LO_ArbolBinario.CapturarRD(MeContactos,Pos);
   GlobalIDContacto:=RDContactos.Id_Interno;
   GlobalBloqueado:=RDContactos.Bloqueado;
   GlobalRegistrado:=RDContactos.Registrado;
   RDContactos.Id_Interno:=GlobalIDContacto;
   RDContactos.Numero_Celular:=Num;
   RDContactos.Nombre:=Nombre;
   RDContactos.Apellido:=Apellido;
   RDContactos.Bloqueado:=GlobalBloqueado;
   RDContactos.Registrado:=GlobalRegistrado;
   RDContactos.Estado:=Estado;
   If (Num=GlobalTelefono) then
    begin
     LO_ArbolBinario.ModificarRD(MeContactos,Pos,RDContactos);
     Messagedlg('Usuario modificado con �xito', mtINFORMATION, [mbOK], 0);
    end
   else
    begin
     PosAux:=_PosNula;
     Existe:=LO_ArbolBinario.ExisteRD(MeContactos,Num,PosAux);
     If(Existe) then
      Messagedlg('Ya existe un contacto con ese numero de telefono, no se pudo modificar.. ', mtINFORMATION, [mbOK], 0)
     else
      begin
       LO_ArbolBinario.EliminarRD(MeContactos,Pos);
       PosAux:=_PosNula;
       Existe:=LO_ArbolBinario.ExisteRD(MeContactos,Num,PosAux);
       LO_ArbolBinario.InsertarRD(MeContactos,PosAux,RDContactos,Num);
       Messagedlg('Usuario modificado con �xito', mtINFORMATION, [mbOK], 0);
      end;
    end;
    PIContacto.Hide;
    MostrarContactos(StringGridContactos);
  end
 else
  Messagedlg('Complete todos los campos por favor', mtINFORMATION, [mbOK], 0);
End;
//*****************************************************************************************************
Procedure TForm1.EnviarMensajeChats();
Var
 Mensaje:TString;
 MeChatsCompartido:TipoMeChatsCompartido;
 RDChat:TRDChatsCompartido;
 SNum:TString;
 Num, IdUsuarioB:TEntero;
 MeUsuarios:TipoMeUsuarios;
 PosUsuario:TPosicion;
 RDUsuario:TRDUsuarios;
Begin
 If (EPCMensaje.Text<>'') then
  begin
   Mensaje:=GlobalNombre+': '+EPCMensaje.Text;
   SNum:=StringGridChats.Cells[1, StringGridChats.Row];
   Num:=StrToInt64(SNum);
   LO_Hash.AbrirMe(MeUsuarios);
   PosUsuario:=LO_Hash.BuscarPos(MeUsuarios,Num);
   RDUsuario:=LO_Hash.CapturarRD(MeUsuarios,PosUsuario);
   IdUsuarioB:=RDUsuario.Id_Interno;
   RDChat.Numero_Mensaje:=_Cero;
   RDChat.Id_UsuarioEmisor:=GlobalID;
   RDChat.Id_UsuarioReceptor:=IdUsuarioB;
   RDChat.Mensaje:=Mensaje;
   RDChat.Fecha_Hora:=Datetostr(Now)+TimeToStr(Now);
   RDChat.Mensaje_Enviado:=true;
   RDChat.Mensaje_Recibido:=false;
   RDChat.Mensaje_Leido:=false;
   RDChat.Anterior:=_PosNula;
   RDChat.Siguiente:=_PosNula;
   LO_LDChatsCompartidos.InsertarChat(MeChatsCompartido,RDChat,GlobalID,IDUsuarioB);
   ActualizarChats();
  end;
 EPCMensaje.Clear;
End;
//*****************************************************************************************************
Procedure TForm1.SincronizarDatos();
Var
 MeUsuarios:TipoMeUsuarios;
 MeContactos:TipoMeContactos;
 RDUsuario:TRDUsuarios;
 RDContacto:TRDContactos;
 Num:TEntero;
 ArregloContactos:Array[0..200] of TRDContactos;
 Pos, PosAux:TPosicion;
 ExisteNum, ExisteContacto:TBooleano;
 I, Contador:integer;
Begin
 LO_Hash.AbrirMe(MeUsuarios);
 LO_ArbolBinario.AbrirMe(MeContactos);
 Pos:=LO_ArbolBinario.Raiz(MeContactos);
 Contador:=_Cero;
 LO_ArbolBinario.PreOrden(MeContactos,Pos,ArregloContactos,Contador, GlobalID);
 If (Contador<>_MenosUno) then
  begin
   For I:=_Cero to Contador do
    begin
     Num:=ArregloContactos[i].Numero_Celular;
     Pos:=LO_Hash.BuscarPos(MeUsuarios,Num);
     ExisteNum:=LO_Hash.ExisteNro(MeUsuarios,Num,Pos);
     If (ExisteNum) then
      begin
       RDUsuario:=LO_Hash.CapturarRD(MeUsuarios,Pos);
       RDContacto:=ArregloContactos[i];
       RDContacto.Estado:=RDUsuario.Estado;
       RDContacto.En_Linea:=RDUsuario.En_Linea;
       RDContacto.Ultima_Conexion:=RDUsuario.Ultima_Conexion;
       ExisteContacto:=LO_ArbolBinario.ExisteRD(MeContactos,Num,PosAux);
       LO_ArbolBinario.ModificarRD(MeContactos,PosAux,RDContacto);
      end;
    end;
  end;
End;
//*****************************************************************************************************

procedure TForm1.SelectChat(Sender: TObject; ACol, ARow: Integer);
var
  MeUsuarios:TipoMeUsuarios;
  MeChatsCompartido:TipoMeChatsCompartido;
  Number:TString;
  PosUser:TPosicion;
  PosChat:TPosicion;
  User:TRDUsuarios;
  UserID:TEntero;
  Online:Boolean;
begin
  if (Sender=StringGridChats)
  then begin
    Number:=StringGridChats.Cells[1,ARow];
    if (Number = '')
    then
    begin
        ShowMessage('Debe seleccionar un n�mero v�lido');
    end
    else begin
      LO_Hash.AbrirMe(MeUsuarios);
      PosUser:=LO_Hash.BuscarPos(MeUsuarios,StrToInt(Number));
      if not (LO_Hash.ExisteNro(MeUsuarios,StrToInt(Number),PosUser))
        then begin
          ShowMessage('El n�mero no existe');
        end
        else begin
          User:=LO_Hash.CapturarRD(MeUsuarios,PosUser);
          LO_ArbolTrinario.AbrirMe(MeChatsCompartido);
          PosChat:=_PosNula;
          if not (LO_ArbolTrinario.BuscarRX(MeChatsCompartido,GlobalId,User.Id_Interno,PosChat) )
          then begin
            ShowMessage('Todav�a no hay registros de chat con este usuario');
          end
          else begin
            if not (User.En_Linea)
            then begin
              ShowMessage('El usuario no se encuentra en linea, recibir� su mensaje una vez que inicie sesi�n');
            end
            else begin
              ActualizarChats();
            end;
          end;
        end;
    end;
  end;
end;

procedure TForm1.StringGridChatsSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  SelectChat(Sender,ACol,ARow);
end;

//*****************************************************************************************************
Procedure TForm1.ActualizarChats();
Var
 Num, IdUsuarioB, EnlaceChat:TEntero;
 SNum, Mensaje, NombreUsuarioB, UltConexion:TString;
 MeUsuarios:TipoMeUsuarios;
 MeChatsCompartido:TipoMeChatsCompartido;
 RCLista,RegPadreLista: TRXChatsCompartido;
 RDChat:TRDChatsCompartido;
 RDUsuario:TRDUsuarios;
 ExisteUsuario, ExisteChat, EnLinea:TBooleano;
 PosUsuario, PosChat, PosRCLista:TPosicion;
 Seleccion:TGridRect;
Begin
 SNum:=StringGridChats.Cells[1, StringGridChats.Row];
 ListBoxChats.Clear;
 EPCDatosChat.Clear;
 If (SNum <>'') then
  begin
   Num:=StrToInt64(SNum);
   LO_Hash.AbrirMe(MeUsuarios);
   PosUsuario:=LO_Hash.BuscarPos(MeUsuarios,Num);
   ExisteUsuario:=LO_Hash.ExisteNro(MeUsuarios,Num,PosUsuario);
   If (existeUsuario) then
    begin
     RDUsuario:=LO_Hash.CapturarRD(MeUsuarios,PosUsuario);
     IdUsuarioB:=RDUsuario.Id_Interno;
     LO_ArbolTrinario.AbrirMe(MeChatsCompartido);
     PosChat:=_PosNula;
     ExisteChat:=LO_ArbolTrinario.BuscarRX(MeChatsCompartido,GlobalId,IdUsuarioB,PosChat);
     If (ExisteChat) then
      begin
       NombreUsuarioB:=RDUsuario.Nombre;
       UltConexion:=RDUsuario.Ultima_Conexion;
       EnLinea:=RDUsuario.En_Linea;
       If not(enLinea) then
        EPCDatosChat.Text:=NombreUsuarioB+' - �ltima conexi�n: '+UltConexion
       else
        EPCDatosChat.Text:= NombreUsuarioB+' - EN LINEA';
       LO_ArbolTrinario.CapturarNodo(MeChatsCompartido,PosChat,RegPadreLista);
       PosRCLista:=RegPadreLista.HijoMedio;
       LO_ArbolTrinario.CapturarNodo(MeChatsCompartido,PosRCLista,RCLista);
       EnlaceChat:=RCLista.Primero;
       While (EnlaceChat<>_PosNula) do
        begin
         RDChat:=LO_LDChatsCompartidos.CapturarRD(MeChatsCompartido,EnlaceChat);
         Mensaje:=RDChat.Mensaje+' ('+RDChat.Fecha_Hora+')';
         ListBoxChats.AddItem(mensaje,ListBoxChats);
         EnlaceChat:=RDChat.Siguiente;
        end;

      end;
    end
   else

    //Messagedlg('El contacto seleccionado no se encuentra registrado. No puede chatear', mtINFORMATION, [mbOK], 0);
    //Timer1.Enabled:=true;
    //Seleccion.Top:=0;
    //StringGridChats.Selection:=Seleccion;
  end;
//
End;
//*****************************************************************************************************
Procedure TForm1.AsignarColores();
Begin
 Form1.Color:=RGB(213, 219, 219);
 PAjustes.Color:=RGB(205,205,255);
 PChats.Color:=RGB(205,205,255);
 PConfirmacion.Color:=RGB(205,205,255);
 PContactos.Color:=RGB(205,205,255);
 PEstados.Color:=RGB(205,205,255);
 PIContacto.Color:=RGB(205,205,255);
 PIngresar.Color:=RGB(214,181,60);
 PNuevoContacto.Color:=RGB(205,205,255);
 PRegistrarse.Color:=RGB(205,205,255);
End;
//*****************************************************************************************************
Procedure TForm1.CerrarSesion();
Var
 RDUsuario:TRDUsuarios;
 MeUsuarios:TipoMeUsuarios;
 Pos:TPosicion;
 Num:TEntero;
Begin
 Num:=GlobalTelefonoUsuario;
 LO_Hash.AbrirMe(MeUsuarios);
 Pos:=LO_Hash.BuscarPos(MeUsuarios,Num);
 RDUsuario:=LO_Hash.CapturarRD(MeUsuarios,Pos);
 RDUsuario.En_Linea:=false;
 RDUsuario.Ultima_Conexion:=DateToStr(Now) + ' ' + TimeToStr(Now);
 LO_Hash.ModificarRD(MeUsuarios,Pos,RDUsuario);
 CerrarPaneles();
 Form1.Close;
End;
//*****************************************************************************************************
End.

unit LO_Pilas;
Interface
uses UTipos, SysUtils, Dialogs, ExtCtrls, StdCtrls, FileCtrl, StrUtils;

//------------------------------------------------------------------------------
//-------------Declaraci�n de Funciones y Procedimientos------------------------
//------------------------------------------------------------------------------

Procedure CrearMe(Var Me:TipoMeEstados; NombreArchivoC:TString; NombreArchivoD:TString);
Procedure AbrirMe(Var Me:TipoMeEstados; NombreArchivoC:TString; NombreArchivoD:TString);
Procedure CerrarMe(Var Me:TipoMeEstados);
Function MeVacio(Var Me:TipoMeEstados):TBooleano;
Procedure Apilar(Var Me:TipoMeEstados; RD:TRDEstados);
Procedure Desapilar(Var Me:TipoMeEstados);
Function Tope(Var Me:TipoMeEstados):TRDEstados;
Procedure DevolverEstados(Var Me:TipoMeEstados; Var MeEstadosUsuario:TipoMeEstados; Id_Interno:TEntero;
                          Var Contador:TEntero; Var CantEstadosUsuario:TEntero);
Procedure ReconstruirPila(Var MeAux:TipoMeEstados; NombreArchivoCAux:TString; NombreArchivoDAux:TString;
                          Var Me:TipoMeEstados; NombreArchivoC:TString; NombreArchivoD:TString;
                          Var Contador:TEntero);
Procedure EliminarEstados(Var Me:TipoMeEstados; Var MeEstadosUsuario:TipoMeEstados; Id_Interno:TEntero;
                          Var Contador:TEntero; Var CantEstadosUsuario:TEntero; Var Estado:TString);
Procedure DestruirMe(Var Me:TipoMeEstados; NombreArchivoC:TString; NombreArchivoD:TString);

//------------------------------------------------------------------------------
//-------------Implementaci�n de funciones y procedimientos---------------------
//------------------------------------------------------------------------------

Implementation

//------------------------------------------------------------------------------
//---------------------Procedimiento "CrearMe"----------------------------------
//---------------------Crea m�todo estructural----------------------------------
//------------------------------------------------------------------------------

Procedure CrearMe(Var Me:TipoMeEstados; NombreArchivoC:TString; NombreArchivoD:TString);
Var
 RC:TRCEstados;
Begin
 Assign(Me.C,_RUTA+ NombreArchivoC);
 Assign(Me.D,_RUTA+ NombreArchivoD);
 {$I-}
 Reset(Me.C);
 If (IORESULT<>_Cero)then
  begin
   Rewrite(Me.C);
   Seek(Me.C,_Cero);
   RC.Borrados:=_PosNula;
   RC.Primero:= _PosNula;
   RC.Cant:=_Cero;
   Write(Me.C,RC);
  end;
 Reset(Me.D);
 If (IORESULT<>_Cero) then
  Rewrite(Me.D);
 Close(Me.C);
 Close(Me.D);
 {$I+}
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "AbrirMe"----------------------------------
//---------------------Abre m�todo estructural----------------------------------
//------------------------------------------------------------------------------

Procedure AbrirMe(Var Me:TipoMeEstados; NombreArchivoC:TString; NombreArchivoD:TString);
Begin
 AssignFile(Me.D,_Ruta+NombreArchivoD);
 AssignFile(Me.C,_Ruta+NombreArchivoC);
 Reset(Me.D);
 Reset(Me.C);
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "CerrarMe"---------------------------------
//--------------------Cierra m�todo estructural---------------------------------
//------------------------------------------------------------------------------

Procedure CerrarMe(Var Me:TipoMeEstados);
Begin
 Close(Me.D);
 Close(Me.C);
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "MeVacio"----------------------------------
//-------------Seg�n el estado del m�todo estructural---------------------------
//--------Retorna "True" si est� vac�o, "False" caso contrario.-----------------
//------------------------------------------------------------------------------

Function MeVacio(Var Me:TipoMeEstados):TBooleano;
Var
 RC:TRCEstados;
Begin
 MeVacio:=False;
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 If(RC.Primero=_PosNula) then
  MeVacio:= true
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "Apilar"-----------------------------------
//---------Introduce "Apila" registros de datos dentro de la pila---------------
//------------------------------------------------------------------------------

Procedure Apilar(Var Me:TipoMeEstados; RD:TRDEstados);
Var
 RC:TRCEstados;
 RDAux:TRDEstados;
 Pos:TPosicion;
Begin
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 If (RC.Borrados=_PosNula) then
  Pos:= Filesize (Me.D)
 else
  begin
   Pos:= RC.Borrados;
   Seek (Me.D,Pos);
   Read (Me.D,RDAux);
   RC.Borrados:=RDAux.Enlace;
  end;
 RD.Enlace:=RC.Primero;
 RC.Primero:=Pos;
 RC.Cant:=RC.Cant+_Uno;
 Seek(Me.D,Pos);
 Write(Me.D,RD);
 Seek(Me.C,_Cero);
 Write(Me.C,RC);
End;

//------------------------------------------------------------------------------
//--------------------Procedimiento "Desapilar"---------------------------------
//--------Remueve "Desapila" registros de datos dentro de la pila---------------
//------------------------------------------------------------------------------

Procedure Desapilar(Var Me:TipoMeEstados);
Var
 RC:TRCEstados;
 RD:TRDEstados;
 PosBorrado:TPosicion;
Begin
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 PosBorrado:=RC.Primero;
 Seek(Me.D,PosBorrado);
 Read(Me.D,RD);
 RC.Primero:=RD.Enlace;
 RD.Enlace:=RC.Borrados;
 RC.Borrados:=PosBorrado;
 RC.Cant:=RC.Cant-_Uno;
 Seek(Me.D,PosBorrado);
 Write(Me.D,RD);
 Seek(Me.C,_Cero);
 Write(Me.C,RC);
End;

//------------------------------------------------------------------------------
//----------------------Procedimiento "Tope"------------------------------------
//--------Retorna el registro de datos que est� al tope de la pila--------------
//------------------------------------------------------------------------------

Function Tope(Var Me:TipoMeEstados):TRDEstados;
Var
 RC:TRCEstados;
 RD:TRDEstados;
Begin
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 Seek(Me.D,RC.Primero);
 If (RC.Primero <> _PosNula) then
  Read(Me.D,RD);
 Tope:=RD;
End;

//------------------------------------------------------------------------------
//-----------------Procedimiento "DevolverEstados"------------------------------
//---Retorna una pila con los estados y la cantidad de estados de un usuario----
//------------------------------------------------------------------------------

Procedure DevolverEstados(Var Me:TipoMeEstados; Var MeEstadosUsuario:TipoMeEstados; Id_Interno:TEntero;
                          Var Contador:TEntero; Var CantEstadosUsuario:TEntero);
Var
 MeAux:TipoMeEstados;
 RC:TRCEstados;
 RD:TRDEstados;
 Cant:TEntero;
Begin
 AbrirMe(Me,_ArchivoCEstados,_ArchivoDEstados);
 CrearMe(MeEstadosUsuario,_ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux);
 AbrirMe(MeEstadosUsuario,_ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux);
 CrearMe(MeAux,_ArchivoCEstadosAux,_ArchivoDEstadosAux);
 AbrirMe(MeAux,_ArchivoCEstadosAux,_ArchivoDEstadosAux);
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 Cant:=RC.Cant;
 While (Cant>_Cero) do
   begin
     RD:=Tope(Me);
     Desapilar(Me);
     If (RD.Id_Interno=Id_Interno) then
       begin
        Apilar(MeEstadosUsuario,RD);
        CantEstadosUsuario:=CantEstadosUsuario+_Uno;
       end;
     Apilar(MeAux,RD);
     Cant:=Cant-_Uno;
     Contador:= Contador+_Uno;
   end;
 CerrarMe(MeAux);
 CerrarMe(MeEStadosUsuario);
 CerrarMe(Me);
 DestruirMe(Me,_ArchivoCEstados,_ArchivoDEstados);
End;

//------------------------------------------------------------------------------
//-----------------Procedimiento "ReconstruirPila"------------------------------
//-------Reconstruye la pila original y devuelve los estados de los-------------
//-----------------usuarios y la cantidad de ellos------------------------------
//------------------------------------------------------------------------------

Procedure ReconstruirPila(Var MeAux:TipoMeEstados; NombreArchivoCAux:TString; NombreArchivoDAux:TString;
                          Var Me:TipoMeEstados; NombreArchivoC:TString; NombreArchivoD:TString;
                          Var Contador:TEntero);
Var
 Cant:TEntero;
 RD:TRDEstados;
Begin
 AbrirMe(MeAux,NombreArchivoCAux,NombreArchivoDAux);
 CrearMe(Me,NombreArchivoC,NombreArchivoD);
 AbrirMe(Me,NombreArchivoC,NombreArchivoD);
 Cant:=_Cero;
 While (Cant<Contador) do
  begin
   RD:=TOPE(MeAux);
   Desapilar(MeAux);
   Apilar(Me,RD);
   Cant:=Cant+_Uno;
  end;
 CerrarMe(Me);
 CerrarMe(MeAux);
 DestruirMe(MeAux,NombreArchivoCAux,NombreArchivoDAux);
End;

//------------------------------------------------------------------------------
//-----------------Procedimiento "EliminarEstados"------------------------------
//-----------------Elimina el estado de un usuario------------------------------
//------------------------------------------------------------------------------

Procedure EliminarEstados(Var Me:TipoMeEstados; Var MeEstadosUsuario:TipoMeEstados; Id_Interno:TEntero;
                          Var Contador:TEntero; Var CantEstadosUsuario:TEntero; Var Estado:TString);
Var
 MeAux:TipoMeEstados;
 RC:TRCEstados;
 RD:TRDEstados;
 Cant:TEntero;
Begin
 AbrirME(Me,_ArchivoCEstados,_ArchivoDEstados);
 CrearME(MeEstadosUsuario,_ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux);
 AbrirME(MeEstadosUsuario,_ArchivoCEstadosUsuarioAux,_ArchivoDEstadosUsuarioAux);
 CrearME(MeAux,_ArchivoCEstadosAux,_ArchivoDEstadosAux);
 AbrirME(MeAux,_ArchivoCEstadosAux,_ArchivoDEstadosAux);
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 Cant:=RC.Cant;
 While (Cant>_Cero) do
  begin
   RD:=Tope(Me);
   Desapilar(Me);
   If (RD.Texto<>Estado) then
    begin
     If (RD.ID_Interno=Id_Interno) then
      begin
       Apilar(MeEstadosUsuario,RD);
       CantEstadosUsuario:=CantEstadosUsuario+_Uno;
      end;
     Apilar(MeAux,RD);
     Contador:= Contador+_Uno;
    end;
    Cant:=Cant-_Uno;
   end;
 CerrarMe(MeAux);
 CerrarMe(MeEStadosUsuario);
 CerrarMe(Me);
 DestruirMe(Me,_ArchivoCEstados,_ArchivoDEstados);
End;

//------------------------------------------------------------------------------
//--------------------Procedimiento "DestruirMe"--------------------------------
//-------------------Destruye el m�tdo estructural------------------------------
//------------------------------------------------------------------------------

Procedure DestruirMe(Var Me:TipoMeEstados; NombreArchivoC:TString; NombreArchivoD:TString);
Begin
 DeleteFile(_RUTA+NombreArchivoC);
 DeleteFile(_RUTA+NombreArchivoD);
End;

//------------------------------------------------------------------------------
//---------------------------------FIN------------------------------------------
//------------------------------------------------------------------------------

End.

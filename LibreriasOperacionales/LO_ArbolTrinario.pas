unit LO_ArbolTrinario; 
Interface
uses UTipos, SysUtils, Dialogs, ExtCtrls, StdCtrls;

//------------------------------------------------------------------------------
//-------------Declaración de Funciones y Procedimientos------------------------
//------------------------------------------------------------------------------

Procedure CrearMe(Var Me:TipoMeChatsCompartido);
Procedure AbrirMe(var Me:TipoMeChatsCompartido);
Procedure CerrarMe(Var Me:TipoMeChatsCompartido);
Function Raiz(Var Me:TipoMeChatsCompartido):TPosicion;
Function HijoIzquierdo(Var Me:TipoMeChatsCompartido; Pos:TPosicion):TPosicion;
Function HijoDerecho(Var Me:TipoMeChatsCompartido; Pos:TPosicion):TPosicion;
Function HijoMedio(Var Me:TipoMeChatsCompartido; Pos:TPosicion):TPosicion;
Function Padre(Var Me:TipoMeChatsCompartido; Pos:TPosicion):TPosicion;
Function MeVacio(Var Me:TipoMeChatsCompartido):TBooleano;
Procedure CapturarNodo(Var Me:TipoMeChatsCompartido; Pos:TPosicion; Var RX:TRXChatsCompartido);
Function BuscarRX(Var Me:TipoMeChatsCompartido; IDUA:TEntero; IDUB:TEntero; Var Pos:TPosicion):TBooleano;
Procedure ModificarRX(Var Me:TipoMeChatsCompartido; Pos:TPosicion; RX:TRXChatsCompartido);
Procedure InsertarRX(Var Me:TipoMeChatsCompartido; Pos:TPosicion; RX:TRXChatsCompartido; IDUA:TEntero; IDUB:TEntero);

//------------------------------------------------------------------------------
//-------------Implementación de funciones y procedimientos---------------------
//------------------------------------------------------------------------------

Implementation

//------------------------------------------------------------------------------
//---------------------Procedimiento "CrearMe"----------------------------------
//---------------------Crea método estructural----------------------------------
//------------------------------------------------------------------------------

Procedure CrearMe(Var Me:TipoMeChatsCompartido);
Var
 RC:TRCChatsCompartido;
 RN:TRNChatsCompartido;
Begin
 {$I-}
 //ShowMessage ('Ruta: ' + _RutaCompartida+_ArchivoDChatsCompartido);
 Assign(Me.D,_RutaCompartida+_ArchivoDChatsCompartido);
 Assign(Me.C,_RutaCompartida+_ArchivoCChatsCompartido);
 Assign(Me.X,_RutaCompartida+_ArchivoXChatsCompartido);
 Assign(Me.N,_RutaCompartida+_ArchivoNChatsCompartido);
 Reset(Me.C);
 If (IOResult<>_Cero) then
  begin
   ShowMessage ('IOResult<>_Cero: ' + IOResult.ToString);
   ReWrite(Me.C);
   Seek(Me.C,_Cero);
   RC.Raiz:=_PosNula;
   RC.Borrados:=_PosNula;
   RC.UltimoNivel:=_PosNula;
   RC.Porcentaje:=_Cero;
   RC.Cant:=_Cero;
   RC.CantMensajesTotal:=_Cero;
   Write(Me.C,RC);
  end;
 Reset(Me.D);
 If (IOResult<>_Cero) then
  Rewrite(Me.D);
 Reset(Me.N);
 If (IOResult<>_Cero) then
  begin
   ReWrite(Me.N);
   Seek(Me.N,_Cero);
   RN.Nivel:=_Cero;
   Write(Me.N,RN);
  end;
 Reset(Me.X);
 If (IOResult<>_Cero) then
  Rewrite(Me.X);
 Close(Me.D);
 Close(Me.C);
 Close(Me.N);
 Close(Me.X);
 {$I+}
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "AbrirMe"----------------------------------
//---------------------Abre método estructural----------------------------------
//------------------------------------------------------------------------------

Procedure AbrirMe(Var Me:TipoMeChatsCompartido);
Begin
 Assign(Me.D,_RutaCompartida+_ArchivoDChatsCompartido);
 Assign(Me.C,_RutaCompartida+_ArchivoCChatsCompartido);
 Assign(Me.X,_RutaCompartida+_ArchivoXChatsCompartido);
 Assign(Me.N,_RutaCompartida+_ArchivoNChatsCompartido);
 Reset(Me.C);
 Reset(Me.D);
 Reset(Me.N);
 Reset(Me.X);
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "CerrarMe"---------------------------------
//--------------------Cierra método estructural---------------------------------
//------------------------------------------------------------------------------

Procedure CerrarMe(Var Me:TipoMeChatsCompartido);
Begin
 Close(Me.D);
 Close(Me.C);
 Close(Me.X);
 Close(Me.N);
End;

//------------------------------------------------------------------------------
//-------------------------Procedimiento "Raiz"---------------------------------
//---------Retorna la posición donde se encuentra el nodo raíz------------------
//------------------------------------------------------------------------------

Function Raiz(Var Me:TipoMeChatsCompartido):TPosicion;
Var
 RC:TRCChatsCompartido;
Begin
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 Raiz:=RC.Raiz;
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "HijoIzquierdo"----------------------------
//-------Retorna la posición donde se encuentra el nodo izquierdo---------------
//------------------------------------------------------------------------------

Function HijoIzquierdo(Var Me:TipoMeChatsCompartido; Pos:TPosicion):TPosicion;
Var
 RX:TRXChatsCompartido;
Begin
 AbrirMe(Me);
 Seek(Me.X,Pos);
 Read(Me.X,RX);
 HijoIzquierdo:=RX.HijoIzquierdo;
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "HijoDerecho"------------------------------
//---------Retorna la posición donde se encuentra el nodo derecho---------------
//------------------------------------------------------------------------------

Function HijoDerecho(Var Me:TipoMeChatsCompartido; Pos:TPosicion):TPosicion;
Var
 RX:TRXChatsCompartido;
Begin
 AbrirMe(Me);
 Seek(Me.X,Pos);
 Read(Me.X,RX);
 HijoDerecho:=RX.HijoDerecho;
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "HijoMedio"--------------------------------
//---------Retorna la posición donde se encuentra el nodo medio-----------------
//------------------------------------------------------------------------------

Function HijoMedio(Var Me:TipoMeChatsCompartido; Pos:TPosicion):TPosicion;
Var
 RX:TRXChatsCompartido;
Begin
 AbrirME(Me);
 Seek(Me.X,Pos);
 Read(Me.X,RX);
 HijoMedio:=RX.HijoMedio;
End;

//------------------------------------------------------------------------------
//-----------------------Procedimiento "Padre"----------------------------------
//---------Retorna la posición donde se encuentra el nodo padre-----------------
//------------------------------------------------------------------------------

Function Padre(Var Me:TipoMeChatsCompartido; Pos:TPosicion):TPosicion;
Var
 RX:TRXChatsCompartido;
Begin
 AbrirMe(Me);
 Seek(Me.X,Pos);
 Read(Me.X,RX);
 Padre:=RX.Padre;
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "MeVacio"----------------------------------
//-------------Según el estado del método estructural---------------------------
//--------Retorna "True" si está vacío, "False" caso contrario.-----------------
//------------------------------------------------------------------------------

Function MeVacio(Var Me:TipoMeChatsCompartido):TBooleano;
Var
 RC:TRCChatsCompartido;
Begin
 AbrirMe(Me);
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 MeVacio:=(RC.Raiz=_PosNula);
End;

//------------------------------------------------------------------------------
//-------------------Procedimiento "CapturarNodo"-------------------------------
//---Retorna el nodo que se encuentra en la posicion que llega por parámetro----
//------------------------------------------------------------------------------

Procedure CapturarNodo(Var Me:TipoMeChatsCompartido; Pos:TPosicion; Var RX:TRXChatsCompartido);
Var
 RXAux:TRXChatsCompartido;
Begin
 AbrirME(Me);
 Seek(Me.X,Pos);
 Read(Me.X,RXAux);
 RX:=RXAux;
End;

//------------------------------------------------------------------------------
//--------------------Procedimiento "BuscarRX"----------------------------------
//-----------Según el estado del RX retorna la posición-------------------------
//-------donde se encuentra o "False" y "posnula" caso contrario----------------
//------------------------------------------------------------------------------

Function BuscarRX(Var Me:TipoMEChatsCompartido; IDUA:TEntero; IDUB:TEntero; Var Pos:TPosicion):TBooleano;
Var
 RC:TRCChatsCompartido;
 RX:TRXChatsCompartido;
 PosPadre:TPosicion;
 Encontre:TBooleano;
 Clave:TEntero;
Begin
 AbrirMe(Me);
 //IDUA = Id Usuario Actual
 //IDUB = Id Usuario Buscado
 If (IDUA>IDUB) then
  Clave:=(IDUB*_Mil)+IDUA
 else
  Clave:=(IDUA*_Mil)+IDUB;
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 Pos:=RC.Raiz;
 PosPadre:=_PosNula;
 Encontre:=false;
 While not(Encontre) and (Pos<>_PosNula) do
  begin
   Seek(Me.X,Pos);
   Read(Me.X,RX);
   If (Clave=RX.Clave) then
    encontre := true
   else
    If (Clave<RX.Clave) then
     begin
      PosPadre:=Pos;
      Pos:=RX.HijoIzquierdo;
     end
    else
     begin
      Pospadre:=Pos;
      Pos:=RX.HijoDerecho;
     end;
  end;
 If not (Encontre) then
  Pos:=PosPadre;
 BuscarRX:=Encontre;
 Close(Me.C);
 Close(Me.X);
End;

//------------------------------------------------------------------------------
//--------------------Procedimiento "ModificarRX"-------------------------------
//-------------------------Modifica un RX---------------------------------------
//------------------------------------------------------------------------------

Procedure ModificarRX(Var Me:TipoMeChatsCompartido; Pos:TPosicion; RX:TRXChatsCompartido);
Var
 RXAux:TRXChatsCompartido;
Begin
 If (Pos<>_PosNula) then
  begin
   Reset(Me.X);
   Seek(Me.X,Pos);
   Read (Me.X,RXAux);
   RX.Padre:=RXAux.Padre;
   RX.HijoIzquierdo:=RXAux.HijoIzquierdo;
   RX.HijoDerecho:=RXAux.HijoDerecho;
   RX.HijoMedio:=RXAux.HijoMedio;
   Seek(Me.X,Pos);
   Write(Me.X,RX);
  end;
End;

//------------------------------------------------------------------------------
//--------------------Procedimiento "InsertarRX"--------------------------------
//----------Inserta un RX en la posición pasada por parámetro-------------------
//------------------------------------------------------------------------------

Procedure InsertarRX(Var Me:TipoMeChatsCompartido; Pos:TPosicion; RX:TRXChatsCompartido; IDUA:TEntero; IDUB:TEntero);
Var
 RC:TRCChatsCompartido;
 PosNew,PosNewHMedio:TPosicion;
 RXAux,RXAux2, RXHijoMedio:TRXChatsCompartido;
 Clave:TEntero;
Begin
 AbrirMe(Me);
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 If(IDUA>IDUB) then
  Clave:=(IDUB*_Mil)+IDUA
 else
  Clave:=(IDUA*_Mil)+IDUB;
 If (RC.Borrados=_PosNula) then
  begin
   PosNew:=Filesize(Me.D);
   PosNewHMedio:=PosNew+_Uno;
  end
 else
  begin
   PosNew:=RC.Borrados;
   Seek(Me.X,PosNew);
   Read(Me.X,RXAux);
   RC.Borrados:=RXAux.HijoDerecho;
   PosNewHMedio:=RC.Borrados;
   Seek(Me.X,PosNewHMedio);
   Read(Me.X,RXAux2);
   RC.Borrados:=RXAux2.HijoDerecho;
  end;
 If (Pos=_PosNula) then //Inserto Raiz
  RC.Raiz:=PosNew
 else
  begin
   Seek(Me.X,Pos);
   Read(Me.X,RXAux);
   If (RXAux.Clave>Clave) then
    RXAux.HijoIzquierdo:=PosNew
   else
    If (RXAux.Clave<Clave) then
     RXAux.HijoDerecho:=PosNew;
    Seek(Me.X,Pos);
    Write(Me.X,RXAux);
  end;
 RX.Padre:=Pos;
 RX.Clave:=Clave;
 RX.IDUsuarioA:=IDUA;
 RX.IDUsuarioB:=IDUB;
 RX.Primero:=_PosNula;
 RX.Ultimo:=_PosNula;
 RX.CantMensaje:=_Cero;
 RX.HijoIzquierdo:=_PosNula;
 RX.HijoDerecho:=_PosNula;
 RX.HijoMedio:=PosNewHMedio;
 RXHijoMedio.Clave:=Clave;
 RXHijoMedio.IDUsuarioA:=IDUA;
 RXHijoMedio.IDUsuarioB:=IDUB;
 RXHijoMedio.Primero:=_PosNula;
 RXHijoMedio.Ultimo:=_PosNula;
 RXHijoMedio.CantMensaje:=_Cero;
 RXHijoMedio.Padre:=PosNew;
 RXHijoMedio.HijoDerecho:=_PosNula;
 RXHijoMedio.HijoIzquierdo:=_PosNula;
 RXHijoMedio.HijoMedio:=_PosNula;
 Seek(Me.X,PosNew);
 Write(Me.X,RX);
 Seek(Me.X,PosNewHMedio);
 Write(Me.X,RXHijoMedio);
 RC.Cant:=RC.Cant+_Uno;
 Seek(Me.C,_Cero);
 Write(Me.C,RC);
End;

//------------------------------------------------------------------------------
//---------------------------------FIN------------------------------------------
//------------------------------------------------------------------------------

End.



unit LO_ArbolBinario;
Interface
uses UTipos, SysUtils, Dialogs, ExtCtrls, StdCtrls;

//------------------------------------------------------------------------------
//-------------Declaración de Funciones y Procedimientos------------------------
//------------------------------------------------------------------------------

Procedure CrearMe(Var Me:TipoMeContactos);
Procedure AbrirMe(Var Me:TipoMeContactos);
Procedure CerrarMe(Var Me:TipoMeContactos);
Function Raiz(Var Me:TipoMeContactos):TPosicion;
Function HijoIzquierdo(Var Me:TipoMeContactos; Pos:TPosicion):TPosicion;
Function HijoDerecho(Var Me:TipoMeContactos; Pos:TPosicion):TPosicion;
Function Padre(Var Me:TipoMeContactos; Pos:TPosicion):TPosicion;
Function MeVacio(Var Me:TipoMeContactos):TBooleano;
Function ExisteRD(Var Me:TipoMeContactos; Num:TEntero; Var Pos:TPosicion):TBooleano;
Function CapturarRC(Var Me:TipoMeContactos):TRCContactos;
Function CapturarRD(Var Me:TipoMeContactos; Pos:TPosicion):TRDContactos;
Procedure InsertarRD(Var Me:TipoMeContactos; Pos:TPosicion; RD:TRDContactos; Num:TEntero);
Procedure ModificarRD(Var Me:TipoMeContactos; Pos:TPosicion; RD:TRDContactos);
Procedure EliminarRD(Var Me:TipoMeContactos; Pos:TPosicion);
Procedure PreOrden(Var Me:TipoMeContactos; Pos:TPosicion; Var Arreglo:Array of TRDContactos;
                   Var Contador:integer; IdUsuarioGlobal:TEntero);

//------------------------------------------------------------------------------
//-------------Implementación de funciones y procedimientos---------------------
//------------------------------------------------------------------------------

Implementation

//------------------------------------------------------------------------------
//---------------------Procedimiento "CrearMe"----------------------------------
//---------------------Crea método estructural----------------------------------
//------------------------------------------------------------------------------

Procedure CrearMe(Var Me:TipoMeContactos);
Var
 RC:TRCContactos;
Begin
 {$I-}
 AssignFile(Me.C,_Ruta+_ArchivoCContactos);
 AssignFile(Me.D,_Ruta+_ArchivoDContactos);
 Reset(Me.C);
 If (IOResult<>_Cero) then
  begin
   ReWrite(Me.C);
   Seek(Me.C,_Cero);
   RC.Raiz:=_PosNula;
   RC.RutaMECompartido:='';
   RC.Borrados:=_PosNula;
   RC.Cantidad:=_Cero;
   RC.HayConexion:=false;
   RC.UltIdInterno:=_Cero;
   Write(Me.C,RC);
  end;
 Reset(Me.D);
 If (IOResult<>_Cero) Then
  ReWrite(Me.D);
 {$I+}
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "AbrirMe"----------------------------------
//---------------------Abre método estructural----------------------------------
//------------------------------------------------------------------------------

Procedure AbrirMe(Var Me:TipoMeContactos);
Begin
 AssignFile(Me.D,_Ruta+_ArchivoDContactos);
 AssignFile(Me.C,_Ruta+_ArchivoCContactos);
 Reset(Me.D);
 Reset(Me.C);
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "CerrarMe"---------------------------------
//--------------------Cierra método estructural---------------------------------
//------------------------------------------------------------------------------

Procedure CerrarMe(Var Me:TipoMeContactos);
Begin
 Close(Me.D);
 Close(Me.C);
End;

//------------------------------------------------------------------------------
//-------------------------Procedimiento "Raiz"---------------------------------
//---------Retorna la posición donde se encuentra el nodo raíz------------------
//------------------------------------------------------------------------------

Function Raiz(Var Me:TipoMeContactos):TPosicion;
Var
 RC:TRCContactos;
Begin
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 Raiz:=RC.Raiz;
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "HijoIzquierdo"----------------------------
//-------Retorna la posición donde se encuentra el nodo izquierdo---------------
//------------------------------------------------------------------------------

Function HijoIzquierdo(Var Me:TipoMeContactos; Pos:TPosicion):TPosicion;
Var
 RD:TRDContactos;
Begin
 Seek(Me.D,Pos);
 Read(Me.D,RD);
 HijoIzquierdo:=RD.Hijo_Izquierdo;
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "HijoDerecho"------------------------------
//---------Retorna la posición donde se encuentra el nodo derecho---------------
//------------------------------------------------------------------------------

Function HijoDerecho(Var Me:TipoMeContactos; Pos:TPosicion):TPosicion;
Var
 RD:TRDContactos;
Begin
 Seek(Me.D,Pos);
 Read(Me.D,RD);
 HijoDerecho:=RD.Hijo_Derecho;
End;

//------------------------------------------------------------------------------
//-----------------------Procedimiento "Padre"----------------------------------
//---------Retorna la posición donde se encuentra el nodo padre-----------------
//------------------------------------------------------------------------------

Function Padre(Var Me:TipoMeContactos; Pos:TPosicion):TPosicion;
Var
 RD:TRDContactos;
Begin
 Seek(Me.D,Pos);
 Read(Me.D,RD);
 Padre:=RD.Padre;
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "MeVacio"----------------------------------
//-------------Según el estado del método estructural---------------------------
//--------Retorna "True" si está vacío, "False" caso contrario.-----------------
//------------------------------------------------------------------------------

Function MeVacio(Var Me:TipoMeContactos):Tbooleano;
Var
 RC:TRCContactos;
Begin
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 MeVacio:=(RC.Raiz=_PosNula);
End;

//------------------------------------------------------------------------------
//--------------------Procedimiento "ExisteRD"----------------------------------
//--------------Retorna "True" si existe el registro de-------------------------
//-----------datos, "False" y "Posnula" en caso contrario-----------------------
//------------------------------------------------------------------------------

Function ExisteRD(Var Me:TipoMeContactos; Num:TEntero; Var Pos:TPosicion):TBooleano;
Var
 RC:TRCContactos;
 RD:TRDContactos;
 PosPadre:TPosicion;
 Encontre:TBooleano;
Begin
 Reset(Me.C);
 Reset(Me.D);
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 Pos:=RC.Raiz;
 PosPadre:=_PosNula;
 Encontre:=false;
 While not(Encontre) and (Pos<>_PosNula) do
  begin
   Seek(Me.D,Pos);
   Read(Me.D,RD);
   If (Num=RD.Numero_Celular) then
    Encontre:=true
   else
    If (Num<RD.Numero_Celular) then
     begin
      PosPadre:=Pos;
      Pos:=RD.Hijo_Izquierdo;
     end
    else
     begin
      Pospadre:=Pos;
      Pos:=RD.Hijo_Derecho;
     end;
   end;
 If not Encontre then
  Pos:=PosPadre;
 ExisteRD:=Encontre;
 Close(Me.C);
 Close(Me.D);
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "CapturarRC"-------------------------------
//-------------------Retorna el registro de control-----------------------------
//------------------------------------------------------------------------------

Function CapturarRC(Var Me:TipoMeContactos):TRCContactos;
Var
 RC:TRCContactos;
Begin
 Reset(Me.C);
 While not (EoF(Me.C))do
  begin
   Seek(Me.C,_Cero);
   Read(Me.C,RC);
   CapturarRC:=RC;
  end;
 Close(Me.C);
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "CapturarRD"-------------------------------
//--------------------Retorna el registro de datos------------------------------
//------------------------------------------------------------------------------

Function CapturarRD(Var Me:TipoMeContactos; Pos:TPosicion):TRDContactos;
Var
 RD:TRDContactos;
Begin
 Reset(Me.D);
 Seek(Me.D,Pos);
 Read(Me.D,RD);
 CapturarRD:=RD;
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "InsertarRD"-------------------------------
//-----Inserta un registro de datos en la posición que llega por parámetro------
//------------------------------------------------------------------------------

Procedure InsertarRD(Var Me:TipoMeContactos; Pos:TPosicion; RD:TRDContactos; Num:TEntero);
Var
 RC:TRCContactos;
 PosNew:TPosicion;
 RDAux:TRDContactos;
Begin
 Reset(Me.D);
 Reset(Me.C);
 Seek(Me.C,_Cero);
 Read(Me.C,RC);
 If (RC.Borrados=_PosNula) then
   PosNew:=Filesize(Me.D)
 else
  begin
   PosNew:=RC.Borrados;
   Seek(Me.D,PosNew);
   Read(Me.D,RDAux);
   RC.Borrados:=RDAux.Hijo_Derecho;
  end;
 If (Pos=_PosNula) then
  begin
   RD.Padre:=_PosNula;
   RD.Hijo_izquierdo:=_PosNula;
   RD.Hijo_Derecho:=_PosNula;
   RC.Raiz:=PosNew;
  end
 else
  begin
   Seek(Me.D,Pos);
   Read(Me.D,RDAux);
   If (RDAux.Numero_Celular>Num) then
    RDAux.Hijo_Izquierdo:=PosNew
   else
    RDAux.Hijo_Derecho:=PosNew;
   Seek(Me.D,Pos);
   Write(Me.D,RDAux);
  end;
 RD.Padre:=Pos;
 RD.Hijo_Izquierdo:=_PosNula;
 RD.Hijo_Derecho:=_PosNula;
 Seek(Me.D,PosNew);
 Write(Me.D,RD);
 RC.cantidad:=RC.Cantidad+_Uno;
 RC.UltIdInterno:=RC.Cantidad;
 Seek(Me.C,_Cero);
 Write(Me.C,RC);
End;

//------------------------------------------------------------------------------
//--------------------Procedimiento "ModificarRD"-------------------------------
//-------------------Modifica un registro de datos------------------------------
//------------------------------------------------------------------------------

Procedure ModificarRD(Var Me:TipoMeContactos; Pos:TPosicion; RD:TRDContactos);
Var
 RDAux:TRDContactos;
Begin
 If (Pos<>_PosNula) then
  begin
   Reset(Me.D);
   Seek(Me.D,Pos);
   Read(Me.D,RDAux);
   RD.Padre:=RDAux.Padre;
   RD.Hijo_Izquierdo:=RDAux.Hijo_Izquierdo;
   RD.Hijo_Derecho:=RDAux.Hijo_Derecho;
   Seek(Me.D,Pos);
   Write(Me.D,RD);
  end;
End;

//------------------------------------------------------------------------------
//--------------------Procedimiento "EliminarRD"--------------------------------
//--------Elimina un registro de datos por sustitución--------------------------
//------------------------------------------------------------------------------

Procedure EliminarRD(Var Me:TipoMeContactos; Pos:TPosicion);
Var
 RD, RDPadre, RDHI, RDHD, RDAux, RDAux2, RDAuxAnt:TRDContactos;
 RC:TRCContactos;
 PosAux:TPosicion;
Begin
 Reset(Me.C);
 Reset(Me.D);
 If (Pos<> _PosNula) then
  begin
   Seek(Me.C,_Cero);
   Read(Me.C,RC);
   Seek(Me.D,Pos);
   Read(Me.D,RD);
   If (Pos=RC.Raiz) and (RC.Cantidad=_Uno) then
    RC.Raiz:=_PosNula
   else
    begin //<Padre>
     If (RD.Padre<>_PosNula) then
      begin
       Seek(Me.D,RD.Padre);
       Read(Me.D,RDPadre);
      end
     else
      begin
       RDPadre.Padre:=_PosNula;
       RDPadre.Hijo_Izquierdo:=_PosNula;
       RDPadre.Hijo_Derecho:=_PosNula;
      end; //</Padre>
     //a
     If (RD.Hijo_Izquierdo=_PosNula) and (RD.Hijo_Derecho=_PosNula) then
      begin
       If (RDPadre.Hijo_Izquierdo=Pos) then
        RDPadre.Hijo_Izquierdo:=_PosNula
       else
        RDPadre.Hijo_Derecho:=_PosNula;
      end //end A
     else
     //b
      begin
       If (RD.Hijo_Izquierdo=_PosNula) then
        begin
         Seek(Me.D,RD.Hijo_Derecho);
         Read(Me.D,RDHD);
         Seek(Me.D,RD.Hijo_Derecho);
         Read(Me.D,RDAux);
         PosAux:=RD.Hijo_Derecho;
         While (RDAux.Hijo_Izquierdo<>_PosNula) do
          begin
           PosAux:=RDAux.Hijo_Izquierdo;
           Seek(Me.D,RDAux.Hijo_Izquierdo);
           Read(Me.D,RDAux);
          end;
         //<Prueba 3>
         If (PosAux=RD.Hijo_Derecho) then
          RDHD.Padre:=RD.Padre
         else
        //</Prueba 3>
         begin
          Seek(Me.D,RDAux.Padre);
          Read(Me.D,RDAuxAnt);
          If (RDAux.Hijo_Derecho<>_PosNula) then
           begin
            Seek(Me.D,RDAux.Hijo_Derecho);
            Read(Me.D,RDAux2);
            RDAux2.Padre:=RDAux.Padre;
            RDAuxAnt.Hijo_Izquierdo:=RDAux.Hijo_Derecho;
            Seek(Me.D,RDAux.Hijo_Derecho);
            Write(Me.D,RDAux2);
           end
          else
           RDAuxAnt.Hijo_Izquierdo:=_PosNula;
          //<Prueba 2>
          If (RDAuxAnt.Id_Interno=RDHD.Id_Interno) then
           RDHD.Hijo_Izquierdo:=RDAuxAnt.Hijo_Izquierdo
          else
           begin
            Seek(Me.D,RDAux.Padre);
            Write(Me.D,RDAuxAnt);
           end;
          //</Prueba 2>
          RDHD.Padre:=PosAux;
          RDAux.Hijo_Izquierdo:=_PosNula;
          RDAux.Hijo_Derecho:=RD.Hijo_Derecho;
          RDAux.Padre:=RD.Padre;
          Seek(Me.D,PosAux);
          Write(Me.D,RDAux);
         end;
       //<prueba>
      If (RDPadre.Hijo_Izquierdo=_PosNula) and (RDPadre.Hijo_Derecho=_PosNula) then
       RC.Raiz:=PosAux
      else
      //</Prueba>
       begin
        If (RDPadre.Hijo_Izquierdo=Pos) then
         RDPadre.Hijo_Izquierdo:=PosAux
        else
         RDPadre.Hijo_Derecho:=PosAux;
       end;
       Seek(Me.D,RD.Hijo_Derecho);
       Write(Me.D,RDHD);
      end//end B
    else
     begin
     //+++Izquierda
      If (RD.Hijo_Derecho=_PosNula) then
       begin
        Seek(Me.D,RD.Hijo_Izquierdo);
        Read(Me.D,RDHI);
        Seek(Me.D,RD.Hijo_Izquierdo);
        Read(Me.D,RDAux);
        PosAux:=RD.Hijo_Izquierdo;
        While (RDAux.Hijo_Derecho<>_PosNula) do
         begin
          PosAux:=RDAux.Hijo_Derecho;
          Seek(Me.D,RDAux.Hijo_Derecho);
          Read(Me.D,RDAux);
         end;
        //<Prueba 3>
        If (PosAux=RD.Hijo_Izquierdo)then
         RDHI.Padre:=RD.Padre
        else
        //</Prueba 3>
         begin
          Seek(Me.D,RDAux.Padre);
          Read(Me.D,RDAuxAnt);
          If (RDAux.Hijo_Izquierdo<>_PosNula) then
           begin
            Seek(Me.D,RDAux.Hijo_Izquierdo);
            Read(Me.D,RDAux2);
            RDAux2.Padre:=RDAux.Padre;
            RDAuxAnt.Hijo_Derecho:=RDAux.Hijo_Izquierdo;
            Seek(Me.D,RDAux.Hijo_Izquierdo);
            Write(Me.D,RDAux2);
           end
          else
           RDAuxAnt.Hijo_Derecho:=_PosNula;
          //<Prueba 2>
          If (RDAuxAnt.Id_Interno=RDHI.Id_Interno) then
           RDHI.Hijo_Derecho:=RDAuxAnt.Hijo_Derecho
          else
           begin
            Seek(Me.D,RDAux.Padre);
            Write(Me.D,RDAuxAnt);
           end;
          //</Prueba 2>
          RDHI.Padre:=PosAux;
          RDAux.Hijo_Izquierdo:=RD.Hijo_Izquierdo;
          RDAux.Hijo_Derecho:=_PosNula;
          RDAux.Padre:=RD.Padre;
          Seek(Me.D,PosAux);
          Write(Me.D,RDAux);
         end;
        //<prueba>
        If (RDPadre.Hijo_Izquierdo=_PosNula) and (RDPadre.Hijo_Derecho=_PosNula) then
         RC.Raiz:=PosAux
        else
        //</Prueba>
         begin
          If (RDPadre.Hijo_Izquierdo=Pos) then
           RDPadre.Hijo_Izquierdo:=PosAux
          else
           RDPadre.Hijo_Derecho:=PosAux;
         end;
        Seek(Me.D,RD.Hijo_Izquierdo);
        Write(Me.D,RDHI);
       end
       else
        begin
        //c)
         Seek(Me.D,RD.Hijo_Izquierdo);
         Read(Me.D,RDHI);
         Seek(Me.D,RD.Hijo_Derecho);
         Read(Me.D,RDHD);
         Seek(Me.D,RD.Hijo_Derecho);
         Read(Me.D,RDAux);
         PosAux:=RD.Hijo_Derecho;
         While (RDAux.Hijo_Izquierdo<>_PosNula) do
          begin
           PosAux:=RDAux.Hijo_Izquierdo;
           Seek(Me.D,RDAux.Hijo_Izquierdo);
           Read(Me.D,RDAux);
          end;
        //<prueba>
         If (RDPadre.Hijo_Izquierdo=_PosNula) and (RDPadre.Hijo_Derecho=_PosNula) then
          RC.Raiz:=PosAux
         else
        //</Prueba>
          begin
           If (RDPadre.Hijo_Izquierdo=Pos) then
            RDPadre.Hijo_Izquierdo:=PosAux
           else
            RDPadre.Hijo_Derecho:=PosAux;
          end;
          //<Prueba 3>
         If (PosAux=RD.Hijo_Derecho) then
          begin
           RDHD.Padre:=RD.Padre;
           RDHD.Hijo_Izquierdo:=RD.Hijo_Izquierdo;
           RDHI.Padre:=RD.Hijo_Derecho;
          end
         else
          begin
           //<Prueba 3>
           Seek(Me.D,RDAux.Padre);
           Read(Me.D,RDAuxAnt);
           If (RDAux.Hijo_Derecho<>_PosNula) then
            begin
             Seek(Me.D,RDAux.Hijo_Derecho);
             Read(Me.D,RDAux2);
             RDAux2.Padre:=RDAux.Padre;
             RDAuxAnt.Hijo_Izquierdo:=RDAux.Hijo_Derecho;
             Seek(Me.D,RDAux.Hijo_Derecho);
             Write(Me.D,RDAux2);
            end
           else
            RDAuxAnt.Hijo_Izquierdo:=_PosNula;
           //<Prueba 2>
           If (RDAuxAnt.Id_Interno=RDHD.Id_Interno) then
            RDHD:=RDAuxAnt
           else
            begin
             Seek(Me.D,RDAux.Padre);
             Write(Me.D,RDAuxAnt);
            end;
           //</Prueba 2>
           RDAux.Padre:=RD.Padre;
           RDAux.Hijo_Izquierdo:=RD.Hijo_Izquierdo;
           RDAux.Hijo_Derecho:=RD.Hijo_Derecho;
           RDHI.Padre:=PosAux;
           RDHD.Padre:=PosAux;
           Seek(Me.D,PosAux);
           Write(Me.D,RDAux);
          end;
          //<Prueba 3> end
         Seek(Me.D,RD.Hijo_Izquierdo);
         Write(Me.D,RDHI);
         Seek(Me.D,RD.Hijo_Derecho);
         Write(Me.D,RDHD);
        end;
     end;//END +++Izquierda
    end;
    //<prueba>
    If (RDPadre.Hijo_Izquierdo<>_PosNula) or (RDPAdre.Hijo_Derecho<>_PosNula) or
       (RDPadre.Padre<>_PosNula) then
     begin
      Seek(Me.D, RD.Padre);
      Write(Me.D, RDPadre);
     end;
    //</Prueba>
  end;
  RD.Hijo_Izquierdo:=RC.Borrados;
  RC.Borrados:=Pos;
  Seek(Me.D,Pos);
  Write(Me.D,RD);
  RC.Cantidad:=RC.Cantidad-_Uno;
  Seek(Me.C,_Cero);
  Write(Me.C,RC);
 end;
End;

//------------------------------------------------------------------------------
//---------------------Procedimiento "PreOrden"---------------------------------
//------Recorre el árbol en preorden e inserta los registros en un arreglo------
//------------------------------------------------------------------------------

Procedure PreOrden(Var Me:TipoMeContactos; Pos:TPosicion; Var Arreglo:Array of TRDContactos;
                   Var Contador:integer;IdUsuarioGlobal:TEntero);
Var
 RD:TRDContactos;
Begin
 If (Pos<>_PosNula) then
  begin
   Seek(Me.D,Pos);
   Read(Me.D,RD);
   //Si el contacto es el mismo que el usuario logueado no lo agrego
   if not (IdUsuarioGlobal = RD.Id_Interno) then
   begin
     Arreglo[Contador].Id_Interno:=RD.Id_Interno;
     Arreglo[Contador].Numero_Celular:=RD.Numero_Celular;
     Arreglo[Contador].Nombre:=RD.Nombre;
     Arreglo[Contador].Apellido:=RD.Apellido;
     Arreglo[Contador].Registrado:=RD.Registrado;
     Arreglo[Contador].Bloqueado:=RD.Bloqueado;
     Arreglo[Contador].Padre:=RD.Padre;
     Arreglo[Contador].Hijo_Izquierdo:=RD.Hijo_Izquierdo;
     Arreglo[Contador].Hijo_Derecho:=RD.Hijo_Derecho;
     Arreglo[Contador].Estado:= RD.Estado;
     Arreglo[Contador].Ultima_Conexion:=RD.Ultima_Conexion;
     Contador:=Contador+_Uno;
   end;
   PreOrden(Me,RD.Hijo_Izquierdo,Arreglo,Contador,IdUsuarioGlobal);
   PreOrden(Me,RD.Hijo_Derecho,Arreglo,Contador,IdUsuarioGlobal);
  end;
End;

//------------------------------------------------------------------------------
//---------------------------------FIN------------------------------------------
//------------------------------------------------------------------------------

End.

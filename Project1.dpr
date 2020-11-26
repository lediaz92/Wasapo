program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UTipos in 'UTipos.pas',
  LO_ArbolBinario in 'LibreriasOperacionales/LO_ArbolBinario.pas',
  LO_Pilas in 'LibreriasOperacionales/LO_Pilas.pas',
  LO_ArbolTrinario in 'LibreriasOperacionales/LO_ArbolTrinario.pas',
  LO_Hash in 'LibreriasOperacionales/LO_Hash.pas',
  LO_LDChatsCompartidos in 'LibreriasOperacionales/LO_LDChatsCompartidos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

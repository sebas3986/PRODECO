unit UHerramientas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons,IniFiles, DB;

  function SoloNumeros(Valor:Char):Char;
  function LlenarCerosIzquierda(CantidadCeros:string; Valor:Integer):string;


implementation

function SoloNumeros(Valor:Char):Char;
begin
  if not (StrScan('0123456789', Valor) <> nil) and (StrScan(#8, Valor)=nil) then
    Result := #0
  else
    Result := Valor;
end;

function LlenarCerosIzquierda(CantidadCeros:string; Valor:Integer):string;
begin
  Result := Format('%0.'+ CantidadCeros + 'd', [Valor]);
end;

end.

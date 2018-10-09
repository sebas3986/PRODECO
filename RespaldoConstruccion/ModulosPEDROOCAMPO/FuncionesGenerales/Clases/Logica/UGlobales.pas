unit UGlobales;

interface

uses
   SysUtils;

   function  SoloNumeros(Valor:Char):Char;


var

  TipoUsuaConeProg : string;
  CodigoCarpetaB   : string;
  idTipoCarpetaB, idSerieDocumentalB, idCarpetaB, idCajaB : Integer;
  Insercion, Eleccion  : Boolean;

implementation

function SoloNumeros(Valor:Char):Char;
begin
  if not (StrScan('0123456789', Valor) <> nil) and (StrScan(#8, Valor)=nil) then
    Result := #0
  else
    Result := Valor;
end;
end.
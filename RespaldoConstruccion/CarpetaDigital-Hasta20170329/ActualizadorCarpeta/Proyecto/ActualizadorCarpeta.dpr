program ActualizadorCarpeta;

uses
  Vcl.Forms,
  windows,
  UActualizadorCarpeta in '..\Presentacion\UActualizadorCarpeta.pas' {FrmActualizadorCarpeta},
  FPGenerales in '..\..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UProcesoActualizador in '..\Logica\UProcesoActualizador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmActualizadorCarpeta, FrmActualizadorCarpeta);
  Application.Run;
end.

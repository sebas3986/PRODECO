unit UActualizaModulo;

interface

uses
  forms,  SysUtils,  StdCtrls,  Vcl.ExtCtrls,  Vcl.Controls,  RxCtrls,
  System.Classes;

type
  TFrmActualizaModulo = class(TForm)
    btnActualizar: TButton;
    btnSalir: TButton;
    LblMensaje: TLabel;
    RpnFondo: TRxPanel;
    tmrEspera: TTimer;
    procedure btnActualizarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrEsperaTimer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Actualiza         : Boolean;
    DescripcionModulo : string;
    MensajeError      : string;
    VersionNueva      : string;
  end;

implementation


{$R *.dfm}

uses
  UDMAplicacion;

procedure TFrmActualizaModulo.btnActualizarClick(Sender: TObject);
begin
  try
    Actualiza:= True;
    tmrEspera.Enabled := false;
    btnActualizar.Visible:= False;
    btnSalir.Visible:=False;
    LblMensaje.Caption:= 'Actualizando M�dulo: ' + '[ ' + DescripcionModulo + ' ] . . . . '
                        + #13#10 + #13#10 + 'Nueva Versi�n: ' + VersionNueva;
    Application.ProcessMessages;
    DMAplicacion.DescargarEjecutable;
    LblMensaje.Caption:= 'El M�dulo: ' + '[ ' + DescripcionModulo + ' ]'
                          + #13#10 + 'Se actualiz� satisfactoriamente.'
                        + #13#10 + #13#10 + 'Nueva Versi�n: ' + VersionNueva;
    btnSalir.visible  := True;
    tmrEspera.Interval:= 10000;
    tmrEspera.Enabled := True;
  except
    on E:Exception do
    begin
      MensajeError:= E.Message;
      Self.Close;
    end;
  end;
end;

procedure TFrmActualizaModulo.btnSalirClick(Sender: TObject);
begin
  if not Actualiza then
    MensajeError:= 'No se actualiz� el M�dulo: [' +DescripcionModulo
                    + '] a la Nueva Versi�n.'
                    + #13#10
                    + 'El proceso de actualizaci�n es necesario para ejecutar el M�dulo.';
  Self.Close;
end;

procedure TFrmActualizaModulo.FormShow(Sender: TObject);
begin
  LblMensaje.Caption:= 'Se ha generado una actualizaci�n del M�dulo:'
                        + #13#10 + '[ ' + DescripcionModulo + ' ]'
                        + #13#10 + #13#10 + 'Nueva Versi�n: ' + VersionNueva;
  MensajeError      := '';
  Actualiza         := False;
  tmrEspera.Interval:= 15000;
  tmrEspera.Enabled := True;
end;

procedure TFrmActualizaModulo.tmrEsperaTimer(Sender: TObject);
begin
  Self.Close;
end;

{$REGION 'CREATE AND DESTRUCTOR'}
{$ENDREGION}
end.

unit UBusquedaCarpeta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, UDMRecepcion, UGlobales,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmBusquedaCarpeta = class(TForm)
    pnl1: TPanel;
    Panel1: TPanel;
    dbgrdCarpetas: TDBGrid;
    dbedtNombresApellidos: TDBEdit;
    dbedtIdentificacion: TDBEdit;
    dbedtTipoId: TDBEdit;
    edtIdentificacion: TEdit;
    btnBuscar: TButton;
    lblIdentificacion: TLabel;
    lblNombresApellidos: TLabel;
    lblIdentificacionL: TLabel;
    lblTipoIdentificacion: TLabel;
    procedure btnBuscarClick(Sender: TObject);
    procedure dbgrdCarpetasDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdCarpetasCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBusquedaCarpeta: TfrmBusquedaCarpeta;

implementation

{$R *.dfm}

procedure TfrmBusquedaCarpeta.btnBuscarClick(Sender: TObject);
begin
  if NOT DMRecepcion.BuscarCarpetasPersona(edtIdentificacion.Text) then
    ShowMessage('No se encontró información para este documento ...');
end;

procedure TfrmBusquedaCarpeta.dbgrdCarpetasCellClick(Column: TColumn);
begin
  Eleccion := True;
end;

procedure TfrmBusquedaCarpeta.dbgrdCarpetasDblClick(Sender: TObject);
begin
  CodigoCarpetaB := DMRecepcion.cdsBuscarCarpeta.FieldByName('CodigoCarpeta').AsString;
  idTipoCarpetaB := DMRecepcion.cdsBuscarCarpeta.FieldByName('idTipoCarpeta').AsInteger;
  idSerieDocumentalB := DMRecepcion.cdsBuscarCarpeta.FieldByName('idSerieDocumental').AsInteger;
  idCajaB := DMRecepcion.cdsBuscarCarpeta.FieldByName('idCaja').AsInteger;
  Eleccion := True;
  Close;
end;

procedure TfrmBusquedaCarpeta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Eleccion := False;
end;

procedure TfrmBusquedaCarpeta.FormShow(Sender: TObject);
begin
  DMRecepcion.BuscarCarpetasPersona('-1');
  Eleccion := False;
end;

end.

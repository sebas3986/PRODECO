unit UActualizadorCarpeta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  UProcesoActualizador;

type
  TFrmActualizadorCarpeta = class(TForm)
    btnActualizar: TButton;
    lstActualiazando: TListBox;
    btnSalir: TButton;
    procedure btnActualizarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmActualizadorCarpeta: TFrmActualizadorCarpeta;
  ProcActu: TProcesoActualizador;

implementation

{$R *.dfm}

procedure TFrmActualizadorCarpeta.btnActualizarClick(Sender: TObject);
begin
  try
    btnActualizar.Visible:= False;
    lstActualiazando.Visible:=True;
    btnSalir.Enabled:=False;
    ProcActu.VerificarArchivos;
    btnSalir.Enabled:=True;
  except
    on E:Exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Advertencia', MB_ICONINFORMATION
                              + MB_OK);
      Application.Terminate;
    end;
  end;
end;

procedure TFrmActualizadorCarpeta.btnSalirClick(Sender: TObject);
begin
  Self.Close;
end;

end.

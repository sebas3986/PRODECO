unit UFrm_Identificacion;

interface

uses
  System.SysUtils,  Vcl.Forms,  Vcl.StdCtrls,  RxLookup,  Vcl.Controls, System.Classes,
  UDAOControlCalidad;

type
  Tfrm_Identificacion = class(TForm)
    rlbIdentificacion: TRxDBLookupCombo;
    lblTipoIdentifiacion: TLabel;
    btnGuardar: TButton;
    procedure btnGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Identificacion: Tfrm_Identificacion;

implementation

uses
  UFrm_ControlCalidad;

{$R *.dfm}

procedure Tfrm_Identificacion.btnGuardarClick(Sender: TObject);
var
   ExpresionInial : TFileName;
   ExpresionFinal : TFileName;
begin
  ExpresionInial := ExtractFilePath(Application.ExeName)+'ImagenesCalidad\'+DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString;
  ExpresionFinal := Copy (ExpresionInial,1, Length (ExpresionInial)-9)+IntToStr(rlbIdentificacion.KeyValue);
  ExpresionFinal := ExpresionFinal+'-V00.tif';
  RenameFile (ExpresionInial, ExpresionFinal);
  Close;
end;

procedure Tfrm_Identificacion.FormShow(Sender: TObject);
begin
  DAOControlCalidad.TipoIdentificacion;
end;

end.

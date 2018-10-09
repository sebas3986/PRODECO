unit UFrm_Testigo;

interface

uses
  Winapi.Windows,  System.SysUtils,  Vcl.Forms,  Vcl.Dialogs,  Vcl.ExtCtrls,
  Vcl.StdCtrls,  Vcl.DBCtrls,  Vcl.Controls, Vcl.Mask, System.Classes,  Vcl.CheckLst,
  UDAOControlCalidad;

type
  Tfrm_Testigo = class(TForm)
    pnl1: TPanel;
    grp1: TGroupBox;
    spl1: TSplitter;
    grp2: TGroupBox;
    grp3: TGroupBox;
    MeObservaciones: TMemo;
    lbl1: TLabel;
    btnGenerarTestigo: TButton;
    btnCancelar: TButton;
    grp4: TGroupBox;
    grp5: TGroupBox;
    dbeCodigoCaja: TDBEdit;
    lbl2: TLabel;
    dbeCodigoCarpeta: TDBEdit;
    lbl3: TLabel;
    dbeCodigoCarpetaAleta: TDBEdit;
    lbl4: TLabel;
    dbeDescripcionSubSerieDocumental: TDBEdit;
    lbl5: TLabel;
    grpDatosCarpeta: TGroupBox;
    lblFoliada: TLabel;
    lbl7: TLabel;
    chkNovedades: TCheckListBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGenerarTestigoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PublicarTestigo (idFolio : integer);

  end;

var
  frm_Testigo: Tfrm_Testigo;

implementation

uses
   UFrm_ControlCalidad;

{$R *.dfm}

procedure Tfrm_Testigo.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Testigo.btnGenerarTestigoClick(Sender: TObject);
var
  idFolio : integer;
begin
  if Application.MessageBox ('Esta acci�n generar� el Testigo de la imagen. Generar� Data en la Base de Datos y lo publicar� en el respositorio. �Desea ejecutar esta acci�n?','Informaci�n', MB_OKCANCEL + MB_ICONINFORMATION) = ID_OK then
    idFolio := DAOControlCalidad.GenerarTestigo(chkNovedades, MeObservaciones.Text);
  if idFolio > 0 then
    begin
      PublicarTestigo(idFolio);
      chkNovedades.Clear;
      MeObservaciones.Text := '';
      Close;
  end else
     ShowMessage('Ya se ha creado un testigo para este folio ...');
end;

procedure Tfrm_Testigo.FormShow(Sender: TObject);
begin
  if DAOControlCalidad.cdsCarpeta.FieldByName('Foliada').AsBoolean then
    lblFoliada.Caption := 'Carpeta Foliada'
  else
    lblFoliada.Caption := 'Carpeta SIN Foliar';
  chkNovedades.Clear;
  DAOControlCalidad.Novedades(chkNovedades);
end;

procedure Tfrm_Testigo.PublicarTestigo(idFolio : integer);
var
  NombreImagen  : string;
  ArchivoImagen : TSearchRec;
  iResultado    : integer;
  Directory     : TFileName;
  NombreArchivo : TFileName;
begin
  NombreImagen := DAOControlCalidad.NombreTestigo(idFolio);

  Directory  := 'C:\Digitalizacion\UNIANDES\CALIDAD\';
  Directory  := StringReplace(Directory, '\\', '\', [rfReplaceAll]);
  Directory  := IncludeTrailingBackslash(Directory);
  iResultado := FindFirst(Directory + '*.*', faAnyFile, ArchivoImagen);

  while (iResultado = 0) do
      begin
        if (ArchivoImagen.Attr and faArchive = faArchive) and (ArchivoImagen.Attr and faDirectory <> faDirectory) then
          begin
            Directory := 'C:\Digitalizacion\UNIANDES\CALIDAD\' + ArchivoImagen.Name;
            NombreArchivo := 'C:\Digitalizacion\UNIANDES\CALIDAD\' +'M'+NombreImagen+'.tif';
            RenameFile (Directory, NombreArchivo);

            Frm_ControlCalidad.PublicarImagen ('C:\Digitalizacion\UNIANDES\CALIDAD\', 'M'+NombreImagen+'.tif', DAOControlCalidad.cdsDatosFolio.FieldByName('RutaFTP').AsString, 'M'+NombreImagen+'-V00'+'.tif');
            DAOControlCalidad.ImagenTestigo(idFolio, 0,0,0,0, DAOControlCalidad.cdsDatosFolio.FieldByName('RutaLocal').AsString, DAOControlCalidad.cdsDatosFolio.FieldByName('RutaFTP').AsString, NombreImagen,'','');

            if NOT DeleteFile ('C:\Digitalizacion\UNIANDES\CALIDAD\'+'M'+NombreImagen+'.tif') then
              ShowMessage(fileName+' Error al borara la imagen original : '+ IntToStr(GetLastError));

        end;
        iResultado := FindNext(ArchivoImagen);
  end;
end;

end.

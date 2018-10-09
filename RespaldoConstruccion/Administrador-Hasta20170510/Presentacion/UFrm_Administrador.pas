unit UFrm_Administrador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnCtrls, Vcl.ToolWin, Vcl.ActnMan, UDMConexion, ShellAPI,
  Vcl.ActnMenus, System.Actions, Vcl.ActnList, Vcl.ImgList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.Menus;

type
  TFrm_FabricaUNIANDES = class(TForm)
    actActionManager: TActionManager;
    ilImageList: TImageList;
    actmmb1: TActionMainMenuBar;
    acttb1: TActionToolBar;
    actRecepcion: TAction;
    actReimpresionSticker: TAction;
    actPublicacion: TAction;
    actControlCalidad: TAction;
    actCaptura: TAction;
    actGeneradorXML: TAction;
    procedure FormShow(Sender: TObject);
    procedure actRecepcionExecute(Sender: TObject);
    procedure actReimpresionStickerExecute(Sender: TObject);
    procedure actPublicacionExecute(Sender: TObject);
    procedure actControlCalidadExecute(Sender: TObject);
    procedure actCapturaExecute(Sender: TObject);
    procedure actGeneradorXMLExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_FabricaUNIANDES: TFrm_FabricaUNIANDES;

implementation

{$R *.dfm}

procedure TFrm_FabricaUNIANDES.actCapturaExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName) + 'Captura\Captura.exe'), PChar('"'+DMConexion.LoginUser +'" "'+'"Captura"'), nil, SW_SHOW);
end;

procedure TFrm_FabricaUNIANDES.actControlCalidadExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName) + 'ControlCalidad\ControlCalidad.exe'), PChar('"'+DMConexion.LoginUser +'" "'+'"ControlCalidad"'), nil, SW_SHOW);

end;

procedure TFrm_FabricaUNIANDES.actGeneradorXMLExecute(Sender: TObject);
begin
   ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName) + 'GenradorXML\GeneradorXML.exe'), PChar('"'+DMConexion.LoginUser +'" "'+'"GeneradorXML"'), nil, SW_SHOW);
end;

procedure TFrm_FabricaUNIANDES.actPublicacionExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName) + 'Publicacion\Publicacion.exe'), PChar('"'+DMConexion.LoginUser +'" "'+'"Publicación"'), nil, SW_SHOW);
end;

procedure TFrm_FabricaUNIANDES.actRecepcionExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName) + 'Recepcion\Recepcion.exe'), PChar('"'+DMConexion.LoginUser +'" "'+'"Recepción"'), nil, SW_SHOW);
end;

procedure TFrm_FabricaUNIANDES.actReimpresionStickerExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName) + 'ReimpresionSticker\ReimpresionSticker.exe'), PChar('"'+DMConexion.LoginUser +'" "'+'"Reimpresión Sticker"'), nil, SW_SHOW);
end;

procedure TFrm_FabricaUNIANDES.FormShow(Sender: TObject);
begin
  Frm_FabricaUNIANDES.Caption := 'Fábrica UNIANDES - Versión 1.1.1 - 06/04/2016 3:33 - Usuario : ' + DMConexion.LoginUser;
end;

end.

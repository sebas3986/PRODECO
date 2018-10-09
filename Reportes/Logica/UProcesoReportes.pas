unit UProcesoReportes;

interface

uses
  UDMAplicacion;

type

  TProcesoReportes = class
    private
      {METODOS PROPIOS}
    public
      {CONSTRUCTORES}
      {PROPIEDADES}
      Procedure VerificarVersion(p_NombModu: string;p_VersModu: string; p_VeriRuta: Boolean);

  end;


implementation


Procedure TProcesoReportes.VerificarVersion(p_NombModu: string;p_VersModu: string; p_VeriRuta: Boolean);
begin
  DMAplicacion.VerificarAplicacion(p_NombModu,p_VersModu, 'REPORTES',p_VeriRuta);
end;

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.

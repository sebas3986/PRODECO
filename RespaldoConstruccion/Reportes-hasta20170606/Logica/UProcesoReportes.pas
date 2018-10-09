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
      Procedure VerificarVersion(p_NombModu: string;p_VersModu: string);

  end;


implementation


Procedure TProcesoReportes.VerificarVersion(p_NombModu: string;p_VersModu: string);
begin
  DMAplicacion.VerificarAplicacion(p_NombModu,p_VersModu, 'REPORTES');
end;

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.

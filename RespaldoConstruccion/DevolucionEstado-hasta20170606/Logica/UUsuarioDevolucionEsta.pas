unit UUsuarioDevolucionEsta;

interface

uses
  Classes;

type

  TUsuarioDevolucionEsta = class
    private
      FCodigoUsuarioDevo     : string;       {CODIGO DEL USUARIO DE DEVOLUCION ESTADO}
      FNombreUsuarioDevo     : string;       {NOMBRE DEL USUARIO DE DEVOLUCION ESTADO}
      FIdPerfilDevo          : Int32;        {ID DEL PERFIL DEL USUARIO DE DEVOLUCION ESTADO}
      FDescripcionPerfilDevo : string;       {DESCRIPCION DEL PERFIL DEL USUARIO DE DEVOLUCION ESTADO}

    public
      property CodigoUsuarioDevo     : string        read FCodigoUsuarioDevo      write FCodigoUsuarioDevo;
      property NombreUsuarioDevo     : string        read FNombreUsuarioDevo      write FNombreUsuarioDevo;
      property IdPerfilDevo          : Int32         read FIdPerfilDevo           write FIdPerfilDevo;
      property DescripcionPerfilDevo : string        read FDescripcionPerfilDevo  write FDescripcionPerfilDevo;

      {CONSTRUCTOR - DESTRUCTOR}



 end;


implementation

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}

{$ENDREGION}


end.

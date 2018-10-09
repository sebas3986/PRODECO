unit UUsuarioCarpetaDigi;

interface

uses
  Classes;

type

  TUsuarioCarpetaDigi = class
    private
      FCodigoUsuarioCarpeta     : string;       {CODIGO DEL USUARIO DE CARPETA DIGITAL}
      FNombreUsuarioCarpeta     : string;       {NOMBRE DEL USUARIO DE CARPETA DIGITAL}
      FIdPerfilCarpeta          : Int32;        {ID DEL PERFIL DEL USUARIO DE CARPETA DIGITAL}
      FDescripcionPerfilCarpeta : string;       {DESCRIPCION DEL PERFIL DEL USUARIO DE CARPETA DIGITAL}
      FHabilitado               : Boolean;      {SI EL USUARIO ESTA HABILITADO O NO}

    public
      property CodigoUsuarioCarpeta     : string        read FCodigoUsuarioCarpeta      write FCodigoUsuarioCarpeta;
      property NombreUsuarioCarpeta     : string        read FNombreUsuarioCarpeta      write FNombreUsuarioCarpeta;
      property IdPerfilCarpeta          : Int32         read FIdPerfilCarpeta           write FIdPerfilCarpeta;
      property DescripcionPerfilCarpeta : string        read FDescripcionPerfilCarpeta  write FDescripcionPerfilCarpeta;
      property Habilitado               : Boolean       read FHabilitado                write FHabilitado;

      {CONSTRUCTOR - DESTRUCTOR}



 end;


implementation

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}

{$ENDREGION}


end.

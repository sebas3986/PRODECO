
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;



namespace Validacion
{
    public class Datos
    {
        NpgsqlConnection con = new NpgsqlConnection("Server=172.17.4.22;Database=UNIANDES;UserName=produniandes;Password=Pr0dUn12015d");

        public int ActualizarFlag(string idfolio, bool FlagXmlTif, string NombreArchivo)
        {
            NpgsqlCommand com = new NpgsqlCommand("update ANDES_PROD.FOLIO set solicitadofirma = "+FlagXmlTif+" , "+
            "firmado = true, archivosolicitudfirma='"+NombreArchivo+"' where idfolio = "+idfolio+"", con);
            try
            {
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
                return 1;
            }
            catch
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                return 0;
            }
        }

        public DataTable ObtenerRuta(string Caja)
        {

            ///NpgsqlDataAdapter da = new NpgsqlDataAdapter(@"SELECT  FOLI.IDFOLIO, IMAG.NOMBREIMAGEN,':\DIGITALIZACION\UNIANDES\IMGUNIANDES\'|| IMAG.RUTAFTP AS RUTA "+
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(@"SELECT  FOLI.IDFOLIO, IMAG.NOMBREIMAGEN,':\DIGITALIZACION\UNIANDES\IMGUNIANDES\' AS RUTARAIZ, IMAG.RUTAFTP "+
           "FROM ANDES_PROD.CARPETA CARP "+
           "INNER JOIN  ANDES_PROD.CAJA ON CAJA.IDCAJA=CARP.IDCAJA "+
           "INNER JOIN  ANDES_PROD.CARPETAALETA CAAL ON CAAL.IDCARPETA=CARP.IDCARPETA "+
           "INNER JOIN  ANDES_PROD.folio FOLI ON FOLI.IDCARPETAALETA=CAAL.IDCARPETAALETA "+
           "INNER JOIN  ANDES_PROD.imagen IMAG ON IMAG.idfolio=foli.Idfolio "+
           "INNER JOIN ANDES_PROD.FLUJO FLUJ ON FLUJ.IDFLUJO = CARP.IDFLUJO "+
           "INNER JOIN ANDES_PROD.TAREA TARE ON TARE.IDTAREA = FLUJ.IDTAREAPROXIMA "+
           "WHERE  CAJA.CODIGOCAJA = '"+Caja+"' "+
            "AND NOT  FOLI.FIRMADO "+
            "AND descripciontarea = 'FIRMA Y ESTAMPA' "+
            "AND CARP.HABILITADO AND CAAL.HABILITADO AND FLUJ.HABILITADO "+
            "AND TARE.HABILITADO "+
            "ORDER BY CODIGOFOLIO ", con);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                GC.Collect();
                return dt;
            }
            catch  
            {
                 return null;
            }

        }
    }
}

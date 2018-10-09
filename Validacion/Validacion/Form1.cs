using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Text;
using System.Windows.Forms;

namespace Validacion
{
    public partial class Form1 : Form
    {
        Datos d = new Datos();
        string UnidadRed = "E";
        string UnidadRedDest = "F";
        public Form1()
        {
            InitializeComponent();
        }

        private void textBoxX1_KeyPress(object sender, KeyPressEventArgs e)
        {
            
            string Archivo = "";
            string RutaOri = "";
            string RutaPDF = "";
            bool FlagTifXml = false;
            if (e.KeyChar == (char)Keys.Enter)
            {
                txtred.Enabled = false;
                txtCaja.Enabled = false;
                Archivo = txtCaja.Text + "_" + System.DateTime.Now.ToString().Replace("/", "").Replace(":", "").Replace(" ", "") + ".txt";
                DataTable dt = d.ObtenerRuta(txtCaja.Text);
                pb1.Minimum = 0;
                pb1.Maximum = dt.Rows.Count;
                for(int i = 0; i < dt.Rows.Count; i++)
                {
                    RutaOri = UnidadRed + dt.Rows[i][2].ToString() + dt.Rows[i][3].ToString() + "/" + dt.Rows[i][1].ToString();
                    RutaPDF = UnidadRedDest + dt.Rows[i][2].ToString() + dt.Rows[i][3].ToString().Insert(4, "FE") + "/" + dt.Rows[i][1].ToString();
                    
                    FlagTifXml = ValidarTifXml(RutaOri);
                    if (ValidarPDFA(RutaPDF) == 1)
                    {
                        d.ActualizarFlag(dt.Rows[i][0].ToString(),FlagTifXml,Archivo);
                    }
                    else
                    {
                        GuardarArchivoPlano(Archivo, dt.Rows[i][0].ToString() + ";" + UnidadRed + dt.Rows[i][2].ToString() + dt.Rows[i][3].ToString() + ";" + dt.Rows[i][1].ToString() + ";"
                                                        + UnidadRedDest + dt.Rows[i][2].ToString() + dt.Rows[i][3].ToString().Insert(4,"FE") + ";" 
                                                        + System.DateTime.Now.Day + "-" + System.DateTime.Now.Month + "-" + System.DateTime.Now.Year + " " 
                                                        + System.DateTime.Now.Hour + ":" + System.DateTime.Now.Minute + ":" + System.DateTime.Now.Second + ":" + ";;;;");
                    }
                    pb1.Value = i+1;
                    lblcont.Text = "Validando "+(i+1).ToString()+" de "+dt.Rows.Count+" Imagenes";
                    lblimagen.Text = RutaOri;
                    Application.DoEvents();
                }
                txtCaja.Enabled = true;
                txtred.Enabled = true;
            }
        }

        private bool ValidarTifXml(string Ruta)
        {
            string RutaXML = Ruta.Replace("tif","xml") ;
            string RutaTif = Ruta;

            if (!File.Exists(RutaXML))
            {
                return false;
            }
            if (!File.Exists(RutaTif))
            {
                return false;
            }
            return true;
        }

        private int ValidarPDFA(string Ruta)
        {
            string RutaPDFA = Ruta.Replace("tif","pdf");
			FileInfo ArchPdfa = new FileInfo(RutaPDFA);
            if (!ArchPdfa.Exists)
            {
                return 0;
            }
			else
			{
				if (ArchPdfa.Length <= 200)
				{
					try
					{
						ArchPdfa.Delete();
					}
					catch (Exception E)
					{
                        MessageBox.Show("IMPOSIBLE RETIRAR EL ARCHIVO : " + RutaPDFA +
                            Environment.NewLine	+ "* " + E.Message);
                        
					}
                    return 0;
				} 
                else
                {
                    return 1;
                }
				
			}
        }

        private int GuardarArchivoPlano(string Archivo,string texto)
        {
            string CarpetaLog = "C:/LOG/";
            if (!Directory.Exists(CarpetaLog))
            {
                Directory.CreateDirectory(CarpetaLog);
            }

            using (StreamWriter outputFile = new StreamWriter(CarpetaLog + @"\"+Archivo, true))
            {
                outputFile.WriteLine(texto);
            }

            return 1;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
           
            txtred.Text = UnidadRed;
            txtredDes.Text = UnidadRedDest;
            
            
        }

        private void Form1_Activated(object sender, EventArgs e)
        {
            
        }

        private void Form1_Shown(object sender, EventArgs e)
        {
            if (!Directory.Exists(UnidadRed + ":\\"))
            {
                MessageBox.Show("Unidad " + UnidadRed + " No existe");
                this.Close();
            }

            if (!Directory.Exists(UnidadRedDest + ":\\"))
            {
                MessageBox.Show("Unidad " + UnidadRedDest + " No existe");
                this.Close();
            }
        }

    }
}

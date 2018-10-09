namespace Validacion
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtCaja = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.label1 = new System.Windows.Forms.Label();
            this.pb1 = new DevComponents.DotNetBar.Controls.ProgressBarX();
            this.label2 = new System.Windows.Forms.Label();
            this.lblimagen = new System.Windows.Forms.Label();
            this.lblcont = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtredDes = new System.Windows.Forms.TextBox();
            this.txtred = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // txtCaja
            // 
            // 
            // 
            // 
            this.txtCaja.Border.Class = "TextBoxBorder";
            this.txtCaja.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtCaja.Location = new System.Drawing.Point(68, 24);
            this.txtCaja.Name = "txtCaja";
            this.txtCaja.PreventEnterBeep = true;
            this.txtCaja.Size = new System.Drawing.Size(160, 20);
            this.txtCaja.TabIndex = 0;
            this.txtCaja.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textBoxX1_KeyPress);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(26, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(36, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "CAJA:";
            // 
            // pb1
            // 
            // 
            // 
            // 
            this.pb1.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.pb1.Location = new System.Drawing.Point(2, 144);
            this.pb1.Name = "pb1";
            this.pb1.Size = new System.Drawing.Size(698, 23);
            this.pb1.TabIndex = 2;
            this.pb1.Text = "progressBarX1";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(26, 73);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(95, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Validando Imagen:";
            // 
            // lblimagen
            // 
            this.lblimagen.AutoSize = true;
            this.lblimagen.Location = new System.Drawing.Point(122, 73);
            this.lblimagen.Name = "lblimagen";
            this.lblimagen.Size = new System.Drawing.Size(0, 13);
            this.lblimagen.TabIndex = 4;
            // 
            // lblcont
            // 
            this.lblcont.AutoSize = true;
            this.lblcont.Location = new System.Drawing.Point(26, 111);
            this.lblcont.Name = "lblcont";
            this.lblcont.Size = new System.Drawing.Size(0, 13);
            this.lblcont.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(-1, 180);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(116, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Unidad de Red Origen:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(245, 180);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(121, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "Unidad de Red Destino:";
            // 
            // txtredDes
            // 
            this.txtredDes.Enabled = false;
            this.txtredDes.Location = new System.Drawing.Point(372, 176);
            this.txtredDes.Name = "txtredDes";
            this.txtredDes.Size = new System.Drawing.Size(38, 20);
            this.txtredDes.TabIndex = 9;
            // 
            // txtred
            // 
            this.txtred.Enabled = false;
            this.txtred.Location = new System.Drawing.Point(121, 176);
            this.txtred.Name = "txtred";
            this.txtred.Size = new System.Drawing.Size(39, 20);
            this.txtred.TabIndex = 10;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(701, 205);
            this.Controls.Add(this.txtred);
            this.Controls.Add(this.txtredDes);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.lblcont);
            this.Controls.Add(this.lblimagen);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.pb1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtCaja);
            this.Name = "Form1";
            this.Text = "Validacion Archivos PDF/A y Firma - Versión [20161117]";
            this.Activated += new System.EventHandler(this.Form1_Activated);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.Shown += new System.EventHandler(this.Form1_Shown);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevComponents.DotNetBar.Controls.TextBoxX txtCaja;
        private System.Windows.Forms.Label label1;
        private DevComponents.DotNetBar.Controls.ProgressBarX pb1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblimagen;
        private System.Windows.Forms.Label lblcont;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtredDes;
        private System.Windows.Forms.TextBox txtred;
    }
}


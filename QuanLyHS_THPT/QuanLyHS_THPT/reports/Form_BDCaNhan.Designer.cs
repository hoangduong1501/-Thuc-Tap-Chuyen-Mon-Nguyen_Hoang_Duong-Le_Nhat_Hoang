namespace QuanLyHS_THPT.reports
{
    partial class Form_BDCaNhan
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.qLHocSinhTHPTDataSet = new QuanLyHS_THPT.QLHocSinhTHPTDataSet();
            this.layBDCaNhanBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.layBD_CaNhanTableAdapter = new QuanLyHS_THPT.QLHocSinhTHPTDataSetTableAdapters.LayBD_CaNhanTableAdapter();
            this.LayBD_CaNhanBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.qLHocSinhTHPTDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layBDCaNhanBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.LayBD_CaNhanBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "DataSet_BDCanNhan";
            reportDataSource1.Value = this.LayBD_CaNhanBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "QuanLyHS_THPT.reports.Report_BDCaNhan.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(800, 450);
            this.reportViewer1.TabIndex = 0;
            // 
            // qLHocSinhTHPTDataSet
            // 
            this.qLHocSinhTHPTDataSet.DataSetName = "QLHocSinhTHPTDataSet";
            this.qLHocSinhTHPTDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // layBDCaNhanBindingSource
            // 
            this.layBDCaNhanBindingSource.DataMember = "LayBD_CaNhan";
            this.layBDCaNhanBindingSource.DataSource = this.qLHocSinhTHPTDataSet;
            // 
            // layBD_CaNhanTableAdapter
            // 
            this.layBD_CaNhanTableAdapter.ClearBeforeFill = true;
            // 
            // LayBD_CaNhanBindingSource
            // 
            this.LayBD_CaNhanBindingSource.DataMember = "LayBD_CaNhan";
            this.LayBD_CaNhanBindingSource.DataSource = this.qLHocSinhTHPTDataSet;
            // 
            // Form_BDCaNhan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.reportViewer1);
            this.Name = "Form_BDCaNhan";
            this.Text = "Form_BDCaNhan";
            this.Load += new System.EventHandler(this.Form_BDCaNhan_Load);
            ((System.ComponentModel.ISupportInitialize)(this.qLHocSinhTHPTDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layBDCaNhanBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.LayBD_CaNhanBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource LayBD_CaNhanBindingSource;
        private QLHocSinhTHPTDataSet qLHocSinhTHPTDataSet;
        private System.Windows.Forms.BindingSource layBDCaNhanBindingSource;
        private QLHocSinhTHPTDataSetTableAdapters.LayBD_CaNhanTableAdapter layBD_CaNhanTableAdapter;
    }
}
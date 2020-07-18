namespace QuanLyHS_THPT.reports
{
    partial class Form_DSDiemCaNam
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
            this.layDSKQCNBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.layDS_KQCNTableAdapter = new QuanLyHS_THPT.QLHocSinhTHPTDataSetTableAdapters.LayDS_KQCNTableAdapter();
            this.LayDS_KQCNBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.qLHocSinhTHPTDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layDSKQCNBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.LayDS_KQCNBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "DataSet1";
            reportDataSource1.Value = this.LayDS_KQCNBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "QuanLyHS_THPT.reports.Report_BDCaNam.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(724, 450);
            this.reportViewer1.TabIndex = 0;
            // 
            // qLHocSinhTHPTDataSet
            // 
            this.qLHocSinhTHPTDataSet.DataSetName = "QLHocSinhTHPTDataSet";
            this.qLHocSinhTHPTDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // layDSKQCNBindingSource
            // 
            this.layDSKQCNBindingSource.DataMember = "LayDS_KQCN";
            this.layDSKQCNBindingSource.DataSource = this.qLHocSinhTHPTDataSet;
            // 
            // layDS_KQCNTableAdapter
            // 
            this.layDS_KQCNTableAdapter.ClearBeforeFill = true;
            // 
            // LayDS_KQCNBindingSource
            // 
            this.LayDS_KQCNBindingSource.DataMember = "LayDS_KQCN";
            this.LayDS_KQCNBindingSource.DataSource = this.qLHocSinhTHPTDataSet;
            // 
            // Form_DSDiemCaNam
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(724, 450);
            this.Controls.Add(this.reportViewer1);
            this.Name = "Form_DSDiemCaNam";
            this.Text = "Form_DSDiemCaNam";
            this.Load += new System.EventHandler(this.Form_DSDiemCaNam_Load);
            ((System.ComponentModel.ISupportInitialize)(this.qLHocSinhTHPTDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layDSKQCNBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.LayDS_KQCNBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource LayDS_KQCNBindingSource;
        private QLHocSinhTHPTDataSet qLHocSinhTHPTDataSet;
        private System.Windows.Forms.BindingSource layDSKQCNBindingSource;
        private QLHocSinhTHPTDataSetTableAdapters.LayDS_KQCNTableAdapter layDS_KQCNTableAdapter;
    }
}
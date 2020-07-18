namespace QuanLyHS_THPT.reports
{
    partial class Form_DSLop
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
            this.layDSKQHKBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.layDS_KQHKTableAdapter = new QuanLyHS_THPT.QLHocSinhTHPTDataSetTableAdapters.LayDS_KQHKTableAdapter();
            this.LayDS_KQHKBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.qLHocSinhTHPTDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layDSKQHKBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.LayDS_KQHKBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "DataSet1";
            reportDataSource1.Value = this.LayDS_KQHKBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "QuanLyHS_THPT.reports.Report_DSLop.rdlc";
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
            // layDSKQHKBindingSource
            // 
            this.layDSKQHKBindingSource.DataMember = "LayDS_KQHK";
            this.layDSKQHKBindingSource.DataSource = this.qLHocSinhTHPTDataSet;
            // 
            // layDS_KQHKTableAdapter
            // 
            this.layDS_KQHKTableAdapter.ClearBeforeFill = true;
            // 
            // LayDS_KQHKBindingSource
            // 
            this.LayDS_KQHKBindingSource.DataMember = "LayDS_KQHK";
            this.LayDS_KQHKBindingSource.DataSource = this.qLHocSinhTHPTDataSet;
            // 
            // Form_DSLop
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.reportViewer1);
            this.Name = "Form_DSLop";
            this.Text = "Form_DSLop";
            this.Load += new System.EventHandler(this.Form_DSLop_Load);
            ((System.ComponentModel.ISupportInitialize)(this.qLHocSinhTHPTDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layDSKQHKBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.LayDS_KQHKBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource LayDS_KQHKBindingSource;
        private QLHocSinhTHPTDataSet qLHocSinhTHPTDataSet;
        private System.Windows.Forms.BindingSource layDSKQHKBindingSource;
        private QLHocSinhTHPTDataSetTableAdapters.LayDS_KQHKTableAdapter layDS_KQHKTableAdapter;
    }
}
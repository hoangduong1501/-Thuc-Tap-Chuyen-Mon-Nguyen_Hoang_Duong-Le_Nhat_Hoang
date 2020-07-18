using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyHS_THPT.reports
{
    public partial class Form_DSDiemCaNam : Form
    {
        public string maNamHoc { get; set; }
        public string maLopHoc { get; set; }

        public Form_DSDiemCaNam()
        {
            InitializeComponent();
        }

        private void Form_DSDiemCaNam_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'qLHocSinhTHPTDataSet.LayDS_KQCN' table. You can move, or remove it, as needed.
            this.layDS_KQCNTableAdapter.Fill(this.qLHocSinhTHPTDataSet.LayDS_KQCN, maNamHoc, maLopHoc);

            this.reportViewer1.RefreshReport();
        }
    }
}

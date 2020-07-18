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
    public partial class Form_DSLop : Form
    {
        public string maNamHoc { get; set; }
        public string maHocKy { get; set; }
        public string maLopHoc { get; set; }

        public Form_DSLop()
        {
            InitializeComponent();
        }

        private void Form_DSLop_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'qLHocSinhTHPTDataSet.LayDS_KQHK' table. You can move, or remove it, as needed.
            this.layDS_KQHKTableAdapter.Fill(this.qLHocSinhTHPTDataSet.LayDS_KQHK,maNamHoc,maHocKy,maLopHoc);

            this.reportViewer1.RefreshReport();
        }
    }
}

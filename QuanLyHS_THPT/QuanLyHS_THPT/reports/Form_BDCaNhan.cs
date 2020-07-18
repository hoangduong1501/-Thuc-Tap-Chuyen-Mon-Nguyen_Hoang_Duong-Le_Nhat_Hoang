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
    public partial class Form_BDCaNhan : Form
    {
        public string maHocSinh { get; set; }
        public string maHocKy { get; set; }
        public string maNamHoc { get; set; }

        public Form_BDCaNhan()
        {
            InitializeComponent();
        }

        private void Form_BDCaNhan_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'qLHocSinhTHPTDataSet.LayBD_CaNhan' table. You can move, or remove it, as needed.
            this.layBD_CaNhanTableAdapter.Fill(this.qLHocSinhTHPTDataSet.LayBD_CaNhan, maHocSinh, maHocKy, maNamHoc);

            this.reportViewer1.RefreshReport();
        }
    }
}

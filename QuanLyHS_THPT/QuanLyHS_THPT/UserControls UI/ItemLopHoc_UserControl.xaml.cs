using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QuanLyHS_THPT.UserControls_UI
{
    /// <summary>
    /// Interaction logic for ItemLopHoc_UserControl.xaml
    /// </summary>
    public partial class ItemLopHoc_UserControl : UserControl
    {
        public string ten_LopHoc { get; set; }
        public string ten_GiaoVien { get; set; }
        public string siso_LopHoc { get; set; }

        public ItemLopHoc_UserControl(string tenLop, string tenGiaoVien, string sisoLop)
        {
            InitializeComponent();
            this.ten_LopHoc = tenLop;
            this.ten_GiaoVien = tenGiaoVien;
            this.siso_LopHoc = sisoLop;
            Load_UI();
        }

        private void Load_UI()
        {
            txt_TenLop.Text = this.ten_LopHoc;
            txt_GiaoVien.Text = this.ten_GiaoVien;
            txt_SiSoLop.Text = this.siso_LopHoc;
        }
    }
}

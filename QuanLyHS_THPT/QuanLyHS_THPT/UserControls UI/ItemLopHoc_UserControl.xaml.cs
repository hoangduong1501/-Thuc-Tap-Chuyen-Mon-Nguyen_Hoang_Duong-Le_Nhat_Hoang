using MaterialDesignThemes.Wpf;
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
        public string ma_LopHoc { get; }
        public string ten_LopHoc;
        public string ten_GiaoVien;
        public string siso_LopHoc;

        public ItemLopHoc_UserControl(string maLop, string tenLop, string tenGiaoVien, string sisoLop)
        {
            InitializeComponent();
            this.ma_LopHoc = maLop;
            this.ten_LopHoc = tenLop;
            this.ten_GiaoVien = tenGiaoVien;
            this.siso_LopHoc = sisoLop;
            Load_UI();
        }


        public Card Get_CardView()
        {
            return this.grp_UI;
        }

        private void Load_UI()
        {
            txt_TenLop.Text = this.ten_LopHoc;
            txt_GiaoVien.Text = this.ten_GiaoVien;
            txt_SiSoLop.Text = this.siso_LopHoc;
        }

        private void grp_UI_MouseEnter(object sender, MouseEventArgs e)
        {
            this.grp_UI.Background = new SolidColorBrush(Color.FromRgb(240, 248, 255));
        }

        private void grp_UI_MouseLeave(object sender, MouseEventArgs e)
        {
            this.grp_UI.Background = Brushes.White;
        }

        //private void UserControl_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        //{
        //    MessageBox.Show("AK");
        //}
    }
}

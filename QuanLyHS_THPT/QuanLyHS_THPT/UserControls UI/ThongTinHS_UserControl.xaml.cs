using Microsoft.Win32;
using QuanLyHS_THPT.View_Model;
using System;
using System.Collections.Generic;
using System.Data;
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
    /// Interaction logic for Home_UserControl.xaml
    /// </summary>
    public partial class ThongTinHS_UserControl : UserControl
    {
        private VM_ThongTinHS vM_ThongTinHS;
        public ThongTinHS_UserControl()
        {
            InitializeComponent();
            vM_ThongTinHS = new VM_ThongTinHS();
            Load_DS();
            Load_Combobox();
        }

        private void Load_DS()
        {
             lvDanhSachHS.ItemsSource = vM_ThongTinHS.DanhSach_HocSinh();

        }
        private void Load_Combobox()
        {
        
            this.cbb_KhoiLop.ItemsSource = this.vM_ThongTinHS.DanhSach_KhoiLop();
            this.cbb_KhoiLop.SelectedValuePath = "makhoiLop";
            this.cbb_KhoiLop.DisplayMemberPath = "ten_KhoiLop";

            this.cbb_TenLop.ItemsSource = this.vM_ThongTinHS.DanhSach_TenLop();
            this.cbb_TenLop.SelectedValuePath = "ma_Lop";
            this.cbb_TenLop.DisplayMemberPath = "ten_Lop";

            this.cbb_NamHoc.ItemsSource = this.vM_ThongTinHS.DanhSach_NamHoc();
            this.cbb_NamHoc.SelectedValuePath = "ma_NamHoc";
            this.cbb_NamHoc.DisplayMemberPath = "ten_NamHoc";

            this.ccb_NgheNghiepCha.ItemsSource = ccb_NgheNghiepMe.ItemsSource = this.vM_ThongTinHS.DanhSach_NgheNghiep();
            this.ccb_NgheNghiepCha.SelectedValuePath = ccb_NgheNghiepMe.SelectedValuePath = "maNgheNghiep";
            this.ccb_NgheNghiepCha.DisplayMemberPath = ccb_NgheNghiepMe.DisplayMemberPath = "tenNgheNghiep";

            cbb_GioiTinh.Items.Add("Nam");
            cbb_GioiTinh.Items.Add("Nữ");
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.ShowDialog();
        }

    }
}

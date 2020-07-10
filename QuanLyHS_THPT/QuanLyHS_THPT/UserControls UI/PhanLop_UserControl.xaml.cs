using QuanLyHS_THPT.View_Model;
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
    /// Interaction logic for PhanLop_UserControl.xaml
    /// </summary>
    public partial class PhanLop_UserControl : UserControl
    {
        private VM_PhanLop vM_PhanLop;
        public PhanLop_UserControl()
        {
            InitializeComponent();
            vM_PhanLop = new VM_PhanLop();
            Load_DS();
            Load_Combobox();
        }
        private void Load_Combobox()
        {
            // Lop Cu
            this.cbb_NamHocCu.ItemsSource = this.vM_PhanLop.DanhSach_NamHoc();
            this.cbb_NamHocCu.SelectedValuePath = "ma_NamHoc";
            this.cbb_NamHocCu.DisplayMemberPath = "ten_NamHoc";

            this.cbb_KhoiLopCu.ItemsSource = this.vM_PhanLop.DanhSach_KhoiLop();
            this.cbb_KhoiLopCu.SelectedValuePath = "makhoiLop";
            this.cbb_KhoiLopCu.DisplayMemberPath = "ten_KhoiLop";

            this.cbb_LopHocCu.ItemsSource = this.vM_PhanLop.DanhSach_TenLop();
            this.cbb_LopHocCu.SelectedValuePath = "ma_Lop";
            this.cbb_LopHocCu.DisplayMemberPath = "ten_Lop";

            //Lop Moi
            this.cbb_NamHocMoi.ItemsSource = this.vM_PhanLop.DanhSach_NamHoc();
            this.cbb_NamHocMoi.SelectedValuePath = "ma_NamHoc";
            this.cbb_NamHocMoi.DisplayMemberPath = "ten_NamHoc";

            this.cbb_KhoiLopMoi.ItemsSource = this.vM_PhanLop.DanhSach_KhoiLop();
            this.cbb_KhoiLopMoi.SelectedValuePath = "makhoiLop";
            this.cbb_KhoiLopMoi.DisplayMemberPath = "ten_KhoiLop";

            this.cbb_LopHocMoi.ItemsSource = this.vM_PhanLop.DanhSach_TenLop();
            this.cbb_LopHocMoi.SelectedValuePath = "ma_Lop";
            this.cbb_LopHocMoi.DisplayMemberPath = "ten_Lop";

        }
        private void Load_DS()
        {
            lvLopCu.ItemsSource = vM_PhanLop.DanhSach_HocSinh();

        }
    }
}

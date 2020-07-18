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
    /// Interaction logic for DiemCaNhan_UserControl.xaml
    /// </summary>
    public partial class DiemCaNhan_UserControl : UserControl
    {
        private VM_DiemCaNhan vM_DiemCaNhan;

        public DiemCaNhan_UserControl()
        {
            InitializeComponent();
            this.vM_DiemCaNhan = new VM_DiemCaNhan();
            Load_Combobox();
        }

        private void Load_Combobox()
        {
            cbb_NamHoc.ItemsSource = this.vM_DiemCaNhan.DanhSach_NamHoc();
            cbb_NamHoc.DisplayMemberPath = "ten_NamHoc";
            cbb_NamHoc.SelectedValuePath = "ma_NamHoc";

            cbb_KhoiLop.ItemsSource = this.vM_DiemCaNhan.DanhSach_KhoiLop();
            cbb_KhoiLop.DisplayMemberPath = "ten_KhoiLop";
            cbb_KhoiLop.SelectedValuePath = "ma_KhoiLop";

            cbb_HocKy.ItemsSource = this.vM_DiemCaNhan.DanhSach_HocKy();
            cbb_HocKy.DisplayMemberPath = "ten_HocKy";
            cbb_HocKy.SelectedValuePath = "ma_HocKy";

            cbb_LopHoc.DisplayMemberPath = "ten_Lop";
            cbb_LopHoc.SelectedValuePath = "ma_Lop";

            cbb_HocSinh.SelectedValuePath = "maHocSinh";
            cbb_HocSinh.DisplayMemberPath = "tenHocSinh";
        }

        private void cbb_NamHoc_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = sender as ComboBox;
            if (comboBox.Name == cbb_NamHoc.Name || comboBox.Name == cbb_KhoiLop.Name)
            {
                if (cbb_NamHoc.SelectedIndex != -1 && cbb_KhoiLop.SelectedIndex != -1)
                {
                    cbb_LopHoc.ItemsSource = vM_DiemCaNhan.LocDanhSach_TenLop(cbb_NamHoc.SelectedValue.ToString(), cbb_KhoiLop.SelectedValue.ToString());
                }
            }
            if (comboBox.Name == cbb_NamHoc.Name || comboBox.Name == cbb_LopHoc.Name)
            {
                if (cbb_NamHoc.SelectedIndex != -1 && cbb_LopHoc.SelectedIndex != -1)
                {
                    cbb_HocSinh.ItemsSource = vM_DiemCaNhan.DanhSach_HocSinh(cbb_NamHoc.SelectedValue.ToString(), cbb_KhoiLop.SelectedValue.ToString(), cbb_LopHoc.SelectedValue.ToString());
                }
            }
        }

        private void btn_Event_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if(button.Name == btn_HienThi.Name && cbb_HocKy.SelectedIndex != -1 && cbb_HocSinh.SelectedIndex != -1 
                && cbb_KhoiLop.SelectedIndex != -1 && cbb_LopHoc.SelectedIndex != -1 && cbb_NamHoc.SelectedIndex != -1)
            {               
                lv_BangDiem.ItemsSource = vM_DiemCaNhan.DanhSach_Mon(cbb_NamHoc.SelectedValue.ToString(), 
                    cbb_HocKy.SelectedValue.ToString(), cbb_HocSinh.SelectedValue.ToString());
            }
            if(button.Name == btn_XuatExcel.Name)
            {

            }
            if(button.Name == btn_XuatReport.Name && cbb_HocKy.SelectedIndex != -1 && cbb_HocSinh.SelectedIndex != -1
                && cbb_KhoiLop.SelectedIndex != -1 && cbb_LopHoc.SelectedIndex != -1 && cbb_NamHoc.SelectedIndex != -1)
            {
                //Todo
                reports.Form_BDCaNhan form_BDCaNhan = new reports.Form_BDCaNhan()
                {
                    maHocSinh = cbb_HocSinh.SelectedValue.ToString(),
                    maHocKy = cbb_HocKy.SelectedValue.ToString(),
                    maNamHoc = cbb_NamHoc.SelectedValue.ToString()
                };
                form_BDCaNhan.Show();
            }
        }
    }
}

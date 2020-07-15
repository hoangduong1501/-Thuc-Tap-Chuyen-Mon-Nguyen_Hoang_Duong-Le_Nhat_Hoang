using QuanLyHS_THPT.models;
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
    /// Interaction logic for ViPham_UserControl.xaml
    /// </summary>
    public partial class ViPham_UserControl : UserControl
    {
        VM_ViPham vM_ViPham;
        private bool status;

        public ViPham_UserControl()
        {
            InitializeComponent();
            vM_ViPham = new VM_ViPham();
            LoadDS_ViPham();
            Load_Combobox();
        }
        private void Load_Combobox()
        {
            this.cbb_NamHoc.ItemsSource = this.vM_ViPham.DanhSach_NamHoc();
            this.cbb_NamHoc.SelectedValuePath = "ma_NamHoc";
            this.cbb_NamHoc.DisplayMemberPath = "ten_NamHoc";

            //this.cbb_Lop.ItemsSource = this.vM_ViPham.DanhSach_LopHoc();
            this.cbb_Lop.SelectedValuePath = "ma_Lop";
            this.cbb_Lop.DisplayMemberPath = "ten_Lop";

            //this.cbb_HocSinh.ItemsSource = this.vM_ViPham.DanhSach_HocSinh();
            this.cbb_HocSinh.SelectedValuePath = "maHocSinh";
            this.cbb_HocSinh.DisplayMemberPath = "tenHocSinh";

            this.cbb_HocKy.ItemsSource = this.vM_ViPham.DanhSach_HocKy();
            this.cbb_HocKy.SelectedValuePath = "ma_HocKy";
            this.cbb_HocKy.DisplayMemberPath = "ma_HocKy";

            this.cbb_KhoiHoc.ItemsSource = this.vM_ViPham.DanhSach_Khoi();
            this.cbb_KhoiHoc.SelectedValuePath = "ma_KhoiLop";
            this.cbb_KhoiHoc.DisplayMemberPath = "ten_KhoiLop";
        }
            private void LoadDS_ViPham()
        {
            lvDS_ViPham.ItemsSource = vM_ViPham.DanhSach_ViPham();
            this.grp_Input.Width = 0;
        }
        private void SelectCurrentItem(object sender, KeyboardFocusChangedEventArgs e)
        {
            ListViewItem item = sender as ListViewItem;
            item.IsSelected = true;
        }
        private string Lay_Ma()
        {
            if (lvDS_ViPham.SelectedIndex != -1)
            {
                var item = ((ViPham_Class)lvDS_ViPham.SelectedItem).ma_HocSinh;
                if (item != null)
                {
                    MessageBox.Show(item.ToString());
                    return (item.ToString());
                }
            }

            return null;
        }
        private void btn_CapNhat_Click(object sender, RoutedEventArgs e)
        {
            if (status)
            {
                if (vM_ViPham.Them_ViPham(cbb_HocSinh.SelectedValue.ToString(), cbb_NamHoc.SelectedValue.ToString(), cbb_Lop.SelectedValue.ToString(),
                    cbb_HocKy.SelectedValue.ToString(), Swap_String(dp_NgayViPham.SelectedDate.ToString()), txt_NoiDungViPham.Text))
                    MessageBox.Show("Thêm thành công thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                else MessageBox.Show("Thêm thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                LoadDS_ViPham();
                //MessageBox.Show(Swap_String(dp_NgayViPham.SelectedDate.ToString()));
            }
            else
            {
                if (vM_ViPham.CapNhat_ViPham(cbb_HocSinh.SelectedValue.ToString(), cbb_NamHoc.SelectedValue.ToString(), cbb_Lop.SelectedValue.ToString(),
                    cbb_HocKy.SelectedValue.ToString(), dp_NgayViPham.SelectedDate.ToString(), txt_NoiDungViPham.Text))
                    MessageBox.Show("Sửa thành công thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                else MessageBox.Show("Sửa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                LoadDS_ViPham();
            }
        }
        private string Swap_String(string str_In)
        {
            str_In = str_In.Substring(0, 10);
            string[] str_Tm = str_In.Split('/');
            if (str_Tm[2].Length == 4)
                return str_Tm[2] + "/" + str_Tm[1] + "/" + str_Tm[0];
            return str_Tm[0] + "/" + str_Tm[1] + "/" + str_Tm[2];
        }

        private void btn_Event_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            switch (button.Name)
            {
                case "btn_Them":
                    this.cbb_HocSinh.Visibility = Visibility.Visible;
                    this.grp_Input.Width = 200;
                    this.status = true;

                    break;
                case "btn_Xoa":
                    if (vM_ViPham.Xoa_ViPham(Lay_Ma()))
                        MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else MessageBox.Show("Xóa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                    break;
                case "btn_LamMoi":
                    LoadDS_ViPham();
                    break;
            }
        }

        private void cbb_NamHoc_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = sender as ComboBox;
            if (comboBox.Name == cbb_NamHoc.Name || comboBox.Name == cbb_KhoiHoc.Name )
            {
                if(cbb_NamHoc.SelectedIndex != -1 && cbb_KhoiHoc.SelectedIndex != -1)
                {
                    cbb_Lop.ItemsSource = vM_ViPham.DanhSach_LopHoc(cbb_NamHoc.SelectedValue.ToString(), cbb_KhoiHoc.SelectedValue.ToString());
                }
            }
            if(comboBox.Name == cbb_Lop.Name && cbb_Lop.SelectedIndex != -1)
            {
                this.cbb_HocSinh.ItemsSource = this.vM_ViPham.DanhSach_HocSinh(cbb_Lop.SelectedValue.ToString());
            }
        }
    }
}

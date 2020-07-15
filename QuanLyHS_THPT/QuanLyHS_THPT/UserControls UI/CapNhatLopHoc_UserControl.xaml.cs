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
    /// Interaction logic for CapNhatLopHoc_UserControl.xaml
    /// </summary>
    public partial class CapNhatLopHoc_UserControl : UserControl
    {
        VM_CapNhatLopHoc vM_CapNhatLopHoc;
        private bool status;  

        public CapNhatLopHoc_UserControl()
        {
            InitializeComponent();
            this.vM_CapNhatLopHoc = new VM_CapNhatLopHoc();
            LoadDS_LopHoc();
            Load_Combobox();
        }

        private void Load_Combobox()
        {
            this.cbb_NamHoc.ItemsSource = this.vM_CapNhatLopHoc.DanhSach_NamHoc();
            this.cbb_NamHoc.SelectedValuePath = "ma_NamHoc";
            this.cbb_NamHoc.DisplayMemberPath = "ten_NamHoc";

            this.cbb_KhoiLop.ItemsSource = this.vM_CapNhatLopHoc.DanhSach_KhoiLop();
            this.cbb_KhoiLop.SelectedValuePath = "ma_KhoiLop";
            this.cbb_KhoiLop.DisplayMemberPath = "ten_KhoiLop";

            this.cbb_GiaoVien.ItemsSource = this.vM_CapNhatLopHoc.DanhSach_GiaoVien();
            this.cbb_GiaoVien.SelectedValuePath = "ma_GiaoVien";
            this.cbb_GiaoVien.DisplayMemberPath = "ten_GiaoVien";

            for (int i = 20; i <= 50; i++)
            {
                this.cbb_SiSo.Items.Add(i);
            }
        }

        private void LoadDS_LopHoc()
        {
            this.lvDS_Lop.ItemsSource = this.vM_CapNhatLopHoc.DanhSach_Lop();
            this.grp_Input.Width = 0;
        }

        private void btn_Event_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            switch (button.Name)
            {
                case "btn_Them":
                    this.txt_MaLopHoc.Visibility = Visibility.Collapsed;
                    this.grp_Input.Width = 200;
                    this.status = true;
                    break;
                case "btn_Sua":
                    this.txt_MaLopHoc.Visibility = Visibility.Visible;
                    this.txt_MaLopHoc.IsReadOnly = true;
                    this.txt_MaLopHoc.Text = Lay_MaLop();
                    this.grp_Input.Width = 200;
                    this.status = false;
                    break;
                case "btn_Xoa":
                    if (vM_CapNhatLopHoc.Xoa_Lop(Lay_MaLop()))
                        MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else MessageBox.Show("Xóa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                    break;
                case "btn_LamMoi":
                    LoadDS_LopHoc();
                    break;
            }
        }

        private void txt_TimKiem_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.Key == Key.Enter)
            {
                lvDS_Lop.ItemsSource = vM_CapNhatLopHoc.Tim_DanhSach_GiaoVien(txt_TimKiem.Text);
            }
        }

        private void btn_CapNhat_Click(object sender, RoutedEventArgs e)
        {
            if (status)
            {
                if(vM_CapNhatLopHoc.Them_Lop(txt_TenLopHoc.Text, cbb_KhoiLop.SelectedValue.ToString(), cbb_NamHoc.SelectedValue.ToString(),
                        int.Parse(cbb_SiSo.Text.Trim()), cbb_GiaoVien.SelectedValue.ToString()))
                    MessageBox.Show("Thêm thành công thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                else MessageBox.Show("Thêm thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                LoadDS_LopHoc();
            }
            else
            {
                if (vM_CapNhatLopHoc.CapNhat_Lop(txt_MaLopHoc.Text, txt_TenLopHoc.Text, cbb_KhoiLop.SelectedValue.ToString(), cbb_NamHoc.SelectedValue.ToString(),
                        int.Parse(cbb_SiSo.Text.Trim()), cbb_GiaoVien.SelectedValue.ToString()))
                    MessageBox.Show("Sửa thành công thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                else MessageBox.Show("Sửa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                LoadDS_LopHoc();
            }
        }

        private void SelectCurrentItem(object sender, KeyboardFocusChangedEventArgs e)
        {
            ListViewItem item = sender as ListViewItem;
            item.IsSelected = true;
        }

        private string Lay_MaLop()
        {
            //try
            //{
            //    var item = ((Lop_Class)lvDS_Lop.SelectedItem).ma_Lop;
            //    if (item != null)
            //    {
            //        MessageBox.Show(item.ToString());
            //        return (item.ToString());
            //    }
            //    return "";
            //}
            //catch (Exception)
            //{
            //    return "";
            //}
            if (lvDS_Lop.SelectedIndex != -1)
            {
                var item = ((Lop_Class)lvDS_Lop.SelectedItem).ma_Lop;
                if (item != null)
                {
                    MessageBox.Show(item.ToString());
                    return (item.ToString());
                }
            }

            return null;
        }
    }
}

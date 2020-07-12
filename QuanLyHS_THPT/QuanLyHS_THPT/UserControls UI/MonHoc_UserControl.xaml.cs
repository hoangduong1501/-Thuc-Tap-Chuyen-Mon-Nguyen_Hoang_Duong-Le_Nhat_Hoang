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
    /// Interaction logic for MonHoc_UserControl.xaml
    /// </summary>
    public partial class MonHoc_UserControl : UserControl
    {
        private VM_MonHoc vM_MonHoc;
        private bool status;

        public MonHoc_UserControl()
        {
            InitializeComponent();
            this.vM_MonHoc = new VM_MonHoc();
            LoadDS_MonHoc();
            Load_UI();
        }

        private void Load_UI()
        {
            for (int i = 30; i <= 90; i += 5) cbb_SoTiet.Items.Add(i);
            for (int j = 1; j <= 3; j++) cbb_HeSo.Items.Add(j);
        }

        private void LoadDS_MonHoc()
        {
            lvDS_MonHoc.ItemsSource = vM_MonHoc.DanhSach_NamHoc();
            this.grp_Input.Width = 0;
        }

        private void btn_Event_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            switch (button.Name)
            {
                case "btn_Them":
                    this.txt_MaMonHoc.Visibility = Visibility.Collapsed;
                    this.grp_Input.Width = 200;
                    txt_MaMonHoc.Text = "";
                    this.status = true;
                    break;
                case "btn_Sua":
                    Sua_MonHoc();
                    break;
                case "btn_Xoa":
                    Xoa_MonHoc();
                    break;
                case "btn_LamMoi":
                    LoadDS_MonHoc();
                    break;
            }
        }

        private void Xoa_MonHoc()
        {
            if(lvDS_MonHoc.SelectedIndex != -1)
            {
                if (vM_MonHoc.Xoa_MonHoc(((MonHoc_Class)lvDS_MonHoc.SelectedItem).ma_MonHoc))
                    MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                else MessageBox.Show("Xóa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                LoadDS_MonHoc();
            }
        }

        private void Sua_MonHoc()
        {
            if (lvDS_MonHoc.SelectedIndex != -1)
            {
                this.txt_MaMonHoc.Visibility = Visibility.Visible;
                this.txt_MaMonHoc.IsReadOnly = true;
                this.grp_Input.Width = 200;
                this.status = false;

                this.txt_MaMonHoc.Text = ((MonHoc_Class)lvDS_MonHoc.SelectedItem).ma_MonHoc;
                this.txt_TenMonHoc.Text = ((MonHoc_Class)lvDS_MonHoc.SelectedItem).ten_MonHoc;
            }
        }

        private void txt_TimKiem_KeyDown(object sender, KeyEventArgs e)
        {
            //if (e.Key == Key.Enter)
            //{
            //    lvDS_Lop.ItemsSource = vM_CapNhatLopHoc.Tim_DanhSach_GiaoVien(txt_TimKiem.Text);
            //}
        }

        private void btn_CapNhat_Click(object sender, RoutedEventArgs e)
        {
            if (status)
            {
                if (txt_TenMonHoc.Text.Trim() != "" && cbb_HeSo.Text != "" && cbb_SoTiet.Text != "")
                {
                    if (vM_MonHoc.Them_MonHoc(txt_TenMonHoc.Text, int.Parse(cbb_HeSo.Text), int.Parse(cbb_SoTiet.Text)))
                        MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else MessageBox.Show("Thêm thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);

                    LoadDS_MonHoc();
                }
                else MessageBox.Show("Hãy nhập đầy đủ thông tin", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                if (txt_MaMonHoc.Text.Trim() != "" && txt_TenMonHoc.Text.Trim() != "" && cbb_HeSo.Text != "" && cbb_SoTiet.Text != "")
                {
                    if (vM_MonHoc.CapNhat_MonHoc(txt_MaMonHoc.Text, txt_TenMonHoc.Text, int.Parse(cbb_HeSo.Text), int.Parse(cbb_SoTiet.Text)))
                        MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else MessageBox.Show("Sửa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);

                    LoadDS_MonHoc();
                }
                else MessageBox.Show("Hãy nhập đầy đủ thông tin", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        //private void SelectCurrentItem(object sender, KeyboardFocusChangedEventArgs e)
        //{
        //    //ListViewItem item = sender as ListViewItem;
        //    //item.IsSelected = true;
        //}

        //private string Lay_MaMon()
        //{
        //    var item = ((MonHoc_Class)lvDS_MonHoc.SelectedItem).ma_MonHoc;
        //    if (item != null)
        //    {
        //        MessageBox.Show(item.ToString());
        //        return (item.ToString());
        //    }
        //    return "";
        //}
    }
}

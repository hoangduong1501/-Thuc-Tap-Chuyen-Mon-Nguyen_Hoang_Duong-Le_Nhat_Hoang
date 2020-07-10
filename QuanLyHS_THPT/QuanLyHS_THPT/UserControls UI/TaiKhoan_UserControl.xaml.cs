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
    /// Interaction logic for TaiKhoan_UserControl.xaml
    /// </summary>
    public partial class TaiKhoan_UserControl : UserControl
    {
        private VM_NguoiDung vM_NguoiDung;
        private bool status;

        public TaiKhoan_UserControl()
        {
            InitializeComponent();
            vM_NguoiDung = new VM_NguoiDung();
            LoadDS_TaiKhoan();
        }

        private void LoadDS_TaiKhoan()
        {
            grp_Input.Width = 0;
            txt_MaTaiKhoan.Text = txt_TenDangNhap.Text = txt_TimKiem.Text = txt_TenNguoiDung.Text = txt_MatKhau.Password = "";
            lvDS_TaiKhoan.ItemsSource = vM_NguoiDung.DanhSach_NguoiDung();

            cbb_Loai.ItemsSource = vM_NguoiDung.DanhSach_LoaiNguoiDung();
            cbb_Loai.SelectedValuePath = "ma_Loai";
            cbb_Loai.DisplayMemberPath = "ten_Loai";
            cbb_Loai.SelectedIndex = -1;
        }

        private void btn_Event_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            switch (button.Name)
            {
                case "btn_Them":
                    this.txt_MaTaiKhoan.Visibility = Visibility.Collapsed;
                    this.grp_Input.Width = 200;
                    this.status = true;
                    break;
                case "btn_Sua":
                    if(Lay_TaiKhoan() != null)
                    {
                        SetText_UI();
                        this.status = false;
                        txt_MaTaiKhoan.Text = Lay_TaiKhoan();
                        this.txt_MaTaiKhoan.Visibility = Visibility.Visible;
                        this.txt_MaTaiKhoan.IsReadOnly = true;
                        
                        this.grp_Input.Width = 200;
                    }
                    break;
                case "btn_Xoa":
                    if (Lay_TaiKhoan() != null)
                    {
                        this.txt_MaTaiKhoan.Visibility = Visibility.Visible;
                        this.grp_Input.Width = 0;
                        if (vM_NguoiDung.Xoa_NguoiDung(Lay_TaiKhoan()))
                            MessageBox.Show("Xóa thành công thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                        else MessageBox.Show("Xóa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);

                        LoadDS_TaiKhoan();
                    }
                    break;
                case "btn_LamMoi":
                    LoadDS_TaiKhoan();
                    break;
            }
        }

        private void SetText_UI()
        {
            txt_MatKhau.Password= ((NguoiDung_Class)lvDS_TaiKhoan.SelectedItem).matKhauDangNhap;
            txt_TenDangNhap.Text = ((NguoiDung_Class)lvDS_TaiKhoan.SelectedItem).tenDangNhap;
            txt_TenNguoiDung.Text = ((NguoiDung_Class)lvDS_TaiKhoan.SelectedItem).tenNguoiDung;
            cbb_Loai.SelectedValue = ((NguoiDung_Class)lvDS_TaiKhoan.SelectedItem).loaiNguoiDung;
        }

        private void btn_CapNhat_Click(object sender, RoutedEventArgs e)
        {
            if (this.status)
            {
                if(this.vM_NguoiDung.Them_NguoiDung(txt_TenNguoiDung.Text, txt_TenDangNhap.Text.Trim(), txt_MatKhau.Password.Trim(), cbb_Loai.SelectedValue.ToString()))
                    MessageBox.Show("Thêm thành công thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                else MessageBox.Show("Thêm thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                LoadDS_TaiKhoan();
            }
            else
            {
                if(this.vM_NguoiDung.CapNhat_NguoiDung(txt_MaTaiKhoan.Text.Trim(), txt_TenNguoiDung.Text, txt_TenDangNhap.Text.Trim(), 
                    txt_MatKhau.Password.Trim(), cbb_Loai.SelectedValue.ToString()))
                    MessageBox.Show("Cập nhật thành công thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                else MessageBox.Show("Cập nhật thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                LoadDS_TaiKhoan();
            }
        }

        private void txt_TimKiem_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.Key == Key.Enter)
            {
                if (txt_TimKiem.Text.Trim() == "") LoadDS_TaiKhoan();
                else lvDS_TaiKhoan.ItemsSource = vM_NguoiDung.TimDanhSach_NguoiDung(txt_TimKiem.Text);
            }
        }

        private string Lay_TaiKhoan()
        {
            if (lvDS_TaiKhoan.SelectedIndex != -1)
            {
                var item = ((NguoiDung_Class)lvDS_TaiKhoan.SelectedItem).maNguoiDung;
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

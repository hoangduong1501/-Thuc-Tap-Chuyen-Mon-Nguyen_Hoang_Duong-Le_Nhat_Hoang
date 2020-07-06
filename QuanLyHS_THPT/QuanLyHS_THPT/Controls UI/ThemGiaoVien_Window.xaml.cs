using MaterialDesignThemes.Wpf;
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
using System.Windows.Shapes;

namespace QuanLyHS_THPT.Controls_UI
{
    /// <summary>
    /// Interaction logic for ThemGiaoVien_Window.xaml
    /// </summary>
    public partial class ThemGiaoVien_Window : Window
    {
        private VM_GiaoVien vM_GiaoVien;
        public ThemGiaoVien_Window()
        {
            InitializeComponent();
            Load_UI();
        }

        private void Load_UI()
        {
            this.vM_GiaoVien = new VM_GiaoVien();
            cbb_ChuyenMon.ItemsSource = this.vM_GiaoVien.DanhSach_MonHoc();
            cbb_ChuyenMon.SelectedValuePath = "ma_MonHoc";
            cbb_ChuyenMon.DisplayMemberPath = "ten_MonHoc";

            cbb_LoaiNguoiDung.ItemsSource = this.vM_GiaoVien.DanhSach_LoaiNguoiDung();
            cbb_LoaiNguoiDung.SelectedValuePath = "ma_Loai";
            cbb_LoaiNguoiDung.DisplayMemberPath = "ten_Loai";
        }

        private void Chip_Click(object sender, RoutedEventArgs e)
        {
            Chip chip = sender as Chip;
            switch (chip.Name)
            {
                case "btn_Thoat":
                    this.Close(); break;
                case "btn_Them":
                    if(txt_TenGiaoVien.Text.Trim() != "" && txt_TenDangNhap.Text.Trim() != "" && txt_SoDienThoai.Text.Trim() != "" && txt_MatKhau.Text.Trim() != "" 
                        && txt_DiaChi.Text.Trim() != "" && cbb_ChuyenMon.Text.Trim() != "" && cbb_LoaiNguoiDung.Text.Trim() != "")
                    {
                       if (vM_GiaoVien.Them_GiaoVien(txt_TenGiaoVien.Text, txt_DiaChi.Text, txt_SoDienThoai.Text.Trim(),
                            cbb_ChuyenMon.SelectedValue.ToString(), txt_TenDangNhap.Text, txt_MatKhau.Text.Trim(), cbb_LoaiNguoiDung.SelectedValue.ToString()))
                        {
                            MessageBox.Show("Thêm thông tin thành công.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                        }
                        else
                        {
                            MessageBox.Show("Thêm thông tin thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                        }
                    }
                    else MessageBox.Show("Hãy Nhập đủ thông tin", "Chú ý", MessageBoxButton.OK,MessageBoxImage.Warning);
                    break;
            }
           
        }
    }
}

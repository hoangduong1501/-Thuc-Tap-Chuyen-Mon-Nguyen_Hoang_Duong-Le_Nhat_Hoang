using MaterialDesignThemes.Wpf;
using QuanLyHS_THPT.View_Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
    /// Interaction logic for SuaGiaoVien_Window.xaml
    /// </summary>
    public partial class SuaGiaoVien_Window : Window
    {
        public string ma_GiaoVien { get; set; }

        private VM_GiaoVien vM_GiaoVien;

        public SuaGiaoVien_Window()
        {
            InitializeComponent();
        }

        private void Chip_Click(object sender, RoutedEventArgs e)
        {
            Chip chip = sender as Chip;
            switch (chip.Name)
            {
                case "btn_CapNhat":
                    CapNhat_GiaoVien();
                    break;
                case "btn_Thoat": this.Close(); break;
            }
            
        }

        private void CapNhat_GiaoVien()
        {
            if(txt_TenGiaoVien.Text.Trim() != "" && txt_MaGiaoVien.Text.Trim() != "" && txt_DiaChi.Text.Trim() != "" && txt_DienThoai.Text.Trim() != "" && cbb_ChuyenMon.Text.Trim() != "")
            {
               if (vM_GiaoVien.CapNhat_GiaoVien(txt_MaGiaoVien.Text.Trim(), txt_TenGiaoVien.Text, txt_DiaChi.Text, txt_DienThoai.Text.Trim(), cbb_ChuyenMon.SelectedValue.ToString()))
                {
                    MessageBox.Show("Cập nhật thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Cập nhật thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }
            else
            {
                MessageBox.Show("Hãy nhập đây đủ thông tin", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void StackPanel_Loaded(object sender, RoutedEventArgs e)
        {
            this.txt_MaGiaoVien.Text = this.ma_GiaoVien;
            this.vM_GiaoVien = new VM_GiaoVien();
            cbb_ChuyenMon.ItemsSource = this.vM_GiaoVien.DanhSach_MonHoc();
            cbb_ChuyenMon.SelectedValuePath = "ma_MonHoc";
            cbb_ChuyenMon.DisplayMemberPath = "ten_MonHoc";
        }
    }
}

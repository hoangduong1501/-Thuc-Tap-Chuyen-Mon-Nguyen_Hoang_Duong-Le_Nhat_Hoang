using MaterialDesignThemes.Wpf;
using QuanLyHS_THPT.Data;
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
    /// Interaction logic for DoiMatKhau_Window.xaml
    /// </summary>
    public partial class DoiMatKhau_Window : Window
    {
        public string ten_DangNhap { get; set; }
        public DoiMatKhau_Window()
        {
            InitializeComponent();
        }

        private void Chip_Click(object sender, RoutedEventArgs e)
        {
            Chip chip = sender as Chip;
            switch (chip.Name)
            {
                case "btn_Huy":
                    this.Close();
                    break;
                case "btn_ThayDoi":
                    CapNhat_MatKhau();
                    break;
            }
        }

        private void CapNhat_MatKhau()
        {
            if (txt_MatKhauMoi.Password.Trim().EndsWith(txt_XacNhan.Password.Trim()) && txt_MatKhauMoi.Password.Trim() != "")
            {
                string query = @"EXEC dbo.CapNhat_MatKhau @ten_DangNhap, @matKhau_Moi";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@ten_DangNhap", ten_DangNhap);
                sqlCommand.Parameters.AddWithValue("@matKhau_Moi", txt_MatKhauMoi.Password.Trim());
                if (Exec_Class.QueryData(sqlCommand))
                    MessageBox.Show("Cập nhật thành công!", "Thông báo", MessageBoxButton.OK,MessageBoxImage.Information);
                this.Close();
            }
            else
            {
                MessageBox.Show("Mật khẩu xác thực và mật khẩu mới không khớp!"+"\nVui lòng nhập lại.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}

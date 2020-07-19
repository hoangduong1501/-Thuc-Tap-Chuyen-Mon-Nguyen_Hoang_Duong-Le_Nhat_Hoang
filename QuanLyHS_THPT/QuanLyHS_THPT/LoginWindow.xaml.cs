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

namespace QuanLyHS_THPT
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Rectangle_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void btn_Close_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btn_Minimize_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (txt_TenDangNhap.Text.Trim() != "" && txt_MatKhau.ToString().Trim() != "")
            {
                VM_NguoiDung vM_NguoiDung = new VM_NguoiDung();
                if (vM_NguoiDung.KiemTra_DangNhap(txt_TenDangNhap.Text.Trim(), txt_MatKhau.Password.Trim()))
                {
                    Controls_UI.AdminWindow adminWindow = new Controls_UI.AdminWindow()
                    {
                        str_TenNguoiDung = vM_NguoiDung.Lay_TenNguoiDung(),
                        str_TenDangNhap = txt_TenDangNhap.Text.Trim()
                    };
                    //MessageBox.Show("ID  " + vM_NguoiDung.Lay_LoaiND());
                    this.Visibility = Visibility.Collapsed;
                    if (vM_NguoiDung.Lay_LoaiND() != "Ban giám hiệu")
                    {
                        if (vM_NguoiDung.Lay_LoaiND() != "Giáo viên")
                        {
                            //adminWindow.btn_ThongTinHS.Visibility = Visibility.Visible;
                            adminWindow.btn_NhapDiem.Visibility = Visibility.Collapsed;
                            adminWindow.btn_TaoHoSo.Visibility = Visibility.Collapsed;
                            //adminWindow.btn_PhanLopHoc.Visibility = Visibility.Visible;
                            adminWindow.btn_CapNhatThongTin.Visibility = Visibility.Collapsed;
                            adminWindow.btn_QuyDinh.Visibility = Visibility.Collapsed;
                            adminWindow.btn_GiaoVien.Visibility = Visibility.Collapsed;
                            adminWindow.btn_BaoCao.Visibility = Visibility.Collapsed;
                            adminWindow.tbk_QuanTriVien.Visibility = Visibility.Collapsed;
                        }
                        else
                        {                     

                            adminWindow.btn_ThongTinHS.Visibility = Visibility.Collapsed;
                            //adminWindow.btn_NhapDiem.Visibility = Visibility.Visible;
                            //adminWindow.btn_TaoHoSo.Visibility = Visibility.Visible;
                            adminWindow.btn_PhanLopHoc.Visibility = Visibility.Collapsed;
                            adminWindow.btn_CapNhatThongTin.Visibility = Visibility.Collapsed;
                            adminWindow.btn_QuyDinh.Visibility = Visibility.Collapsed;
                            adminWindow.btn_GiaoVien.Visibility = Visibility.Collapsed;
                            //adminWindow.btn_BaoCao.Visibility = Visibility.Visible;
                            adminWindow.tbk_QuanTriVien.Visibility = Visibility.Collapsed;
                        }
                    }
                    else
                    {
                        adminWindow.Visibility = Visibility.Visible;
                    }
                    adminWindow.ShowDialog();
                    this.Visibility = Visibility.Visible;
                }
                else
                {
                    this.status.Text = "Tài khoản hoặc mật khẩu không đúng!";
                }
            }
            else
            {
                this.status.Text = "Hãy nhập tài khoản!";
            }
        }
    }
}

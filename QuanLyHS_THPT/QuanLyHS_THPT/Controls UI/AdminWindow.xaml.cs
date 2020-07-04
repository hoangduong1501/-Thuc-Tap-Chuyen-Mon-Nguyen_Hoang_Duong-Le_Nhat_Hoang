using QuanLyHS_THPT.UserControls_UI;
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
    /// Interaction logic for AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        private bool style_Maximaze = false;
        public AdminWindow()
        {
            InitializeComponent();
        }

        private void ButtonOpenMenu_Click(object sender, RoutedEventArgs e)
        {
            ButtonCloseMenu.Visibility = Visibility.Visible;
            ButtonOpenMenu.Visibility = Visibility.Collapsed;
        }

        private void ButtonCloseMenu_Click(object sender, RoutedEventArgs e)
        {
            ButtonCloseMenu.Visibility = Visibility.Collapsed;
            ButtonOpenMenu.Visibility = Visibility.Visible;
        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            switch (button.Name)
            {
                case "btn_Min": this.WindowState = WindowState.Minimized; break;
                case "btn_Max": Control_WindowState(); break;
                case "btn_Close": this.Close(); break;
            }
        }

        private void Grid_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if(e.ClickCount == 2)
            {
                Control_WindowState();
            }            
        }

        private void Control_WindowState()
        {
            if (this.style_Maximaze)
            {
                this.WindowState = WindowState.Normal;
                this.style_Maximaze = false;
            }
            else
            {
                this.WindowState = WindowState.Maximized;
                this.style_Maximaze = true;
            }
        }

        private void ListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (((ListViewItem)((ListView)sender).SelectedItem).Name)
            {
                case "btn_ThongTinHS":
                    UserControls_UI.QuanLyHS_UserControl quanLyHS_UserControl = new QuanLyHS_UserControl();
                    this.Grid_PersonControls.Children.Add(quanLyHS_UserControl);
                    break;
                case "btn_NhapDiem":
                    MessageBox.Show("BangDiem");
                    break;
                case "btn_CapNhatThongTin":
                    UserControls_UI.CapNhat_UserControl capNhat_UserControl = new CapNhat_UserControl();
                    this.Grid_PersonControls.Children.Add(capNhat_UserControl);
                    break;
                case "btn_PhanLopHoc":
                    UserControls_UI.QuanLyLop_UserControl quanLyLop_UserControl = new QuanLyLop_UserControl();
                    this.Grid_PersonControls.Children.Add(quanLyLop_UserControl);
                    break;
                case "btn_PhanCong":
                    MessageBox.Show("PhanCong");
                    break;
                case "btn_QuyDinh":
                    Controls_UI.QuyDinh_Window quyDinh_Window = new QuyDinh_Window();
                    quyDinh_Window.ShowDialog();
                    break;
                case "btn_GiaoVien":
                    UserControls_UI.GiaoVien_UserControl giaoVien_UserControl = new UserControls_UI.GiaoVien_UserControl();
                    this.Grid_PersonControls.Children.Add(giaoVien_UserControl);
                    break;
                case "btn_BaoCao":
                    MessageBox.Show("BaoCao");
                    break;
                    
            }
        }

        private void btn_HuongDan_MouseDown(object sender, MouseButtonEventArgs e)
        {
            MessageBox.Show("HuongDan");
        }
    }
}

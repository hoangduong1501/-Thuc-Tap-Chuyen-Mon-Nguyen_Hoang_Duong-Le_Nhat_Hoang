using MaterialDesignThemes.Wpf;
using QuanLyHS_THPT.models;
using QuanLyHS_THPT.View_Model;
using System;
using System.Collections.Generic;
using System.Data;
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
    /// Interaction logic for ThemGiaoVien_UserControl.xaml
    /// </summary>
    public partial class ThemGiaoVien_UserControl : UserControl
    {
        private VM_GiaoVien vM_GiaoVien;
        public ThemGiaoVien_UserControl()
        {
            InitializeComponent();
            LoadDS_GiaoVien();
        }

        private void LoadDS_GiaoVien()
        {
            vM_GiaoVien = new VM_GiaoVien();
            lvDS_GiaoVien.ItemsSource = vM_GiaoVien.DanhSach_GiaoVien();
        }

        private void Chip_Click(object sender, RoutedEventArgs e)
        {
            Controls_UI.ThemGiaoVien_Window themGiaoVien_Window = new Controls_UI.ThemGiaoVien_Window();
            themGiaoVien_Window.ShowDialog();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int index = -1;
                index = lvDS_GiaoVien.SelectedIndex;
                
                Button button = sender as Button;
                switch (button.Name)
                {
                    case "btn_Sua":                        
                        Controls_UI.SuaGiaoVien_Window suaGiaoVien_Window = new Controls_UI.SuaGiaoVien_Window()
                        {
                            ma_GiaoVien=Lay_MaGiaoVien(),
                        };
                        suaGiaoVien_Window.ShowDialog();
                        break;
                    case "btn_Xoa":
                        if(vM_GiaoVien.Xoa_GiaoVien(Lay_MaGiaoVien()))
                            MessageBox.Show("Xóa thành công thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                        else MessageBox.Show("Xóa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                        break;
                }
                LoadDS_GiaoVien();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void SelectCurrentItem(object sender, KeyboardFocusChangedEventArgs e)
        {
            ListViewItem item = sender as ListViewItem;
            item.IsSelected = true;
        }

        private string Lay_MaGiaoVien()
        {
            try
            {
                var item = ((GiaoVien_Class)lvDS_GiaoVien.SelectedItem).ma_GiaoVien;
                if (item != null)
                {
                    return (item.ToString());
                }
                return "";
            }
            catch (Exception)
            {
                return "";
            }
        }

        private void TextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                lvDS_GiaoVien.ItemsSource = vM_GiaoVien.DanhSach_TimGiaoVien(txt_TimKiem.Text);
            }            
        }
    }
}

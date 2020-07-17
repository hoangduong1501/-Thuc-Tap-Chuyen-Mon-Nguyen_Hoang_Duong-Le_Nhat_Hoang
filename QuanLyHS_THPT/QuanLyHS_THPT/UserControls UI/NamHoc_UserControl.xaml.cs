using MaterialDesignThemes.Wpf;
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
    /// Interaction logic for NamHoc_UserControl.xaml
    /// </summary>
    public partial class NamHoc_UserControl : UserControl
    {
        VM_NamHoc vM_NamHoc;
        public NamHoc_UserControl()
        {
            InitializeComponent();
            vM_NamHoc = new VM_NamHoc();
            Load_UI();
        }

        private void Load_UI()
        {
            lvDS_NamHoc.ItemsSource = vM_NamHoc.DanhSach_NamHoc();
            lvDS_HocKy.ItemsSource = vM_NamHoc.DanhSach_HocKy();
        }

        private void Them_NamHoc()
        {
            if(txt_NamHoc.Text.Trim() != "")
            {
                if (vM_NamHoc.Them_NamHoc(txt_NamHoc.Text.Trim()))
                {
                    MessageBox.Show("Thêm thông tin thành công.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                    txt_NamHoc.Text = "";
                }
                else
                {
                    MessageBox.Show("Thêm thông tin thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }
            else
            {
                MessageBox.Show("Nhập đầy đủ thông tin .", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void btn_ThemNamHoc_Click(object sender, RoutedEventArgs e)
        {
            Chip chip = sender as Chip;
            switch (chip.Name)
            {
                case "btn_ThemNamHoc":
                    Them_NamHoc();
                    break;
                case "btn_ThemHocKy": break;
                case "btn_XoaHocKy": break;
            }
            Load_UI();
        }

        private void SelectCurrentItem(object sender, KeyboardFocusChangedEventArgs e)
        {
            ListViewItem item = sender as ListViewItem;
            item.IsSelected = true;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int index = lvDS_NamHoc.SelectedIndex;
                    
                if (vM_NamHoc.Xoa_NamHoc(Lay_MaNamHoc()))
                {
                    MessageBox.Show("Xóa thành công thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
                else MessageBox.Show("Xóa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                Load_UI();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private string Lay_MaNamHoc()
        {
            if (lvDS_NamHoc.SelectedIndex != -1)
            {
                var item = ((NamHoc_Class)lvDS_NamHoc.SelectedItem).ma_NamHoc;
                if (item != null)
                {
                    return (item.ToString());
                }                
            }
            return "";
        }

        private void btn_ThemHocKy_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}

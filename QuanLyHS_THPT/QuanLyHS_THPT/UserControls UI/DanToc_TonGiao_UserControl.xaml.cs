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
    /// Interaction logic for DanToc_TonGiao_UserControl.xaml
    /// </summary>
    public partial class DanToc_TonGiao_UserControl : UserControl
    {
        VM_DanToc_TonGiao vM_DanToc_TonGiao;
        public DanToc_TonGiao_UserControl()
        {
            InitializeComponent();
            vM_DanToc_TonGiao = new VM_DanToc_TonGiao();
            Load_DSDanToc();
            Load_DSTonGiao();
        }

        private void Load_DSDanToc()
        {
            lvDS_DanToc.ItemsSource = vM_DanToc_TonGiao.DanhSach_DanToc();
        }
        private void Load_DSTonGiao()
        {
            lvDS_TonGiao.ItemsSource = vM_DanToc_TonGiao.DanhSach_TonGiao();
        }

        private void SelectCurrentItem(object sender, KeyboardFocusChangedEventArgs e)
        {
            ListViewItem item = sender as ListViewItem;
            item.IsSelected = true;
        }

        //Dan Toc
        private string Lay_MaDanToc()
        {
            if (lvDS_DanToc.SelectedIndex != -1)
            {
                var item = ((DanToc_Class)lvDS_DanToc.SelectedItem).ma_DanToc;
                if (item != null)
                {
                    MessageBox.Show(item.ToString());
                    return (item.ToString());
                }
            }

            return null;
        }
        private void btn_ThemDanToc_Click(object sender, RoutedEventArgs e)
        {
            if (txt_DanToc.Text.Trim() != "")
            {
                if (vM_DanToc_TonGiao.Them_DanToc(txt_DanToc.Text.Trim()))
                {
                    MessageBox.Show("Thêm thông tin thành công.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                    txt_DanToc.Text = "";
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
            Load_DSDanToc();
        }

        private void btn_XoaDanToc_Click(object sender, RoutedEventArgs e)
        {
            if (vM_DanToc_TonGiao.Xoa_DanToc(Lay_MaDanToc()))
            {
                MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                MessageBox.Show("Xóa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            Load_DSDanToc();
        }

        //Ton Giao
        private string Lay_MaTonGiao()
        {
            if (lvDS_TonGiao.SelectedIndex != -1)
            {
                var item = ((TonGiao_Class)lvDS_TonGiao.SelectedItem).ma_TonGiao;
                if (item != null)
                {
                    MessageBox.Show(item.ToString());
                    return (item.ToString());
                }
            }

            return null;
        }

        private void btn_XoaTonGiao_Click(object sender, RoutedEventArgs e)
        {
            if (vM_DanToc_TonGiao.Xoa_TonGiao(Lay_MaTonGiao()))
            {
                MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                MessageBox.Show("Xóa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            Load_DSTonGiao();
        }

        private void btn_ThemTonGiao_Click_1(object sender, RoutedEventArgs e)
        {
            if (txt_TonGiao.Text.Trim() != "")
            {
                if (vM_DanToc_TonGiao.Them_TonGiao(txt_TonGiao.Text.Trim()))
                {
                    MessageBox.Show("Thêm thông tin thành công.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                    txt_TonGiao.Text = "";
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
            Load_DSTonGiao();
        }
    }
}

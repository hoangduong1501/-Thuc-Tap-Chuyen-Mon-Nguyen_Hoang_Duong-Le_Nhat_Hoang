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
        private VM_PhanCong vM_PhanCong;

        public ThemGiaoVien_UserControl()
        {
            InitializeComponent();
            Load_CBB();
            LoadDS_GiaoVien();
            LoadDS_PhanCong();
        }

        private void Load_UI()
        {
            Load_CBB();
            LoadDS_GiaoVien();
            LoadDS_PhanCong();
        }

        private void Load_CBB()
        {
            this.vM_PhanCong = new VM_PhanCong();
            vM_GiaoVien = new VM_GiaoVien();

            this.cbb_Lop.ItemsSource = this.vM_PhanCong.DanhSach_LopHoc();
            this.cbb_Lop.SelectedValuePath = "ma_Lop";
            this.cbb_Lop.DisplayMemberPath = "ten_Lop";

            this.cbb_Mon.ItemsSource = this.vM_PhanCong.DanhSach_MonHoc();
            this.cbb_Mon.SelectedValuePath = "ma_MonHoc";
            this.cbb_Mon.DisplayMemberPath = "ten_MonHoc";

            this.cbb_NamHoc.ItemsSource = this.vM_PhanCong.DanhSach_NamHoc();
            this.cbb_NamHoc.SelectedValuePath = "ma_NamHoc";
            this.cbb_NamHoc.DisplayMemberPath = "ten_NamHoc";

            this.cbb_GiaoVien.ItemsSource = this.vM_PhanCong.DanhSach_GiaoVien();
            this.cbb_GiaoVien.SelectedValuePath = "ma_GiaoVien";
            this.cbb_GiaoVien.DisplayMemberPath = "ten_GiaoVien";
        }

        private void LoadDS_PhanCong()
        {            
            lvDS_PhanCong.ItemsSource = this.vM_PhanCong.DanhSach_PhanCong();
        }

        private void LoadDS_GiaoVien()
        {            
            lvDS_GiaoVien.ItemsSource = vM_GiaoVien.DanhSach_GiaoVien();
        }

        private void Chip_Click(object sender, RoutedEventArgs e)
        {
            Chip chip = sender as Chip;
            switch (chip.Name)
            {
                case "btn_Them":
                    Controls_UI.ThemGiaoVien_Window themGiaoVien_Window = new Controls_UI.ThemGiaoVien_Window();
                    themGiaoVien_Window.ShowDialog();
                    Load_UI();
                    break;
                case "btn_PhanCong": 
                    if(cbb_GiaoVien.Text.Trim() != "" && cbb_Lop.Text.Trim() != "" && cbb_Mon.Text.Trim() != "" && cbb_NamHoc.Text.Trim() != "")
                    {
                        if (vM_PhanCong.Them_PhanCong(cbb_NamHoc.SelectedValue.ToString(), cbb_Lop.SelectedValue.ToString(),
                            cbb_Mon.SelectedValue.ToString(), cbb_GiaoVien.SelectedValue.ToString()))
                            MessageBox.Show("Thành Công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                        else MessageBox.Show("Thất bại", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    Load_UI();
                    break;
            }
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
                            MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                        else MessageBox.Show("Xóa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                        break;
                    case "btn_XoaPhanCong":
                        if(lvDS_PhanCong.SelectedIndex != -1)
                        {
                            //string namHoc = ((PhanCong_Class)lvDS_PhanCong.SelectedItem).namHoc;
                            //string lopHoc = ((PhanCong_Class)lvDS_PhanCong.SelectedItem).lopHoc;
                            //string monHoc = ((PhanCong_Class)lvDS_PhanCong.SelectedItem).monHoc;
                            //string giaoVien = ((PhanCong_Class)lvDS_PhanCong.SelectedItem).giaoVien;

                            if (vM_PhanCong.Xoa_PhanCong(((PhanCong_Class)lvDS_PhanCong.SelectedItem).so_TT))
                                MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                            else MessageBox.Show("Xóa thất bại", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Warning);
                            //string namHoc = ((PhanCong_Class)lvDS_PhanCong.SelectedItem).so_TT.ToString();
                        }
                        break;
                }
                LoadDS_GiaoVien();
                LoadDS_PhanCong();
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
            if (lvDS_GiaoVien.SelectedIndex != -1)
            {
                var item = ((GiaoVien_Class)lvDS_GiaoVien.SelectedItem).ma_GiaoVien;
                if (item != null)
                {
                    MessageBox.Show(item.ToString());
                    return (item.ToString());
                }
            }

            return null;            
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

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
using System.Windows.Shapes;

namespace QuanLyHS_THPT.Controls_UI
{
    /// <summary>
    /// Interaction logic for QuyDinh_Window.xaml
    /// </summary>
    public partial class QuyDinh_Window : Window
    {
        VM_QuyDinh vM_QuyDinh;
        public QuyDinh_Window()
        {
            InitializeComponent();
            this.vM_QuyDinh = new VM_QuyDinh();
            Create_Item();
            Load_UI();
        }

        private void Load_UI()
        {
            QuyDinh_Class quyDinh = new QuyDinh_Class();
            quyDinh = this.vM_QuyDinh.LayTT_QuyDinh();
            txt_DiaChi.Text = quyDinh.diaChi;
            txt_TenTruong.Text = quyDinh.tenTruong;
            cbb_SLMax.Text = quyDinh.max_SiSo.ToString();
            cbb_SLMin.Text = quyDinh.min_SiSo.ToString();
            cbb_TuoiMax.Text = quyDinh.max_Tuoi.ToString();
            cbb_TuoiMin.Text = quyDinh.min_Tuoi.ToString();

            if (quyDinh.thangDiem.ToString().Trim() == "10") swt_HeSo.IsChecked = false;
            else swt_HeSo.IsChecked = true;
        }

        private void Create_Item()
        {
            List<int> lst_Item = new List<int>();
            for(int i = 0; i <= 100; i++)
            {
                lst_Item.Add(i);
            }

            cbb_SLMin.ItemsSource = lst_Item;
            cbb_SLMax.ItemsSource = lst_Item;
            cbb_TuoiMax.ItemsSource = lst_Item;
            cbb_TuoiMin.ItemsSource = lst_Item;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            switch (button.Name)
            {
                case "btn_ThayDoi":
                    int diem;
                    if (swt_HeSo.IsChecked == true) 
                        diem = 100;
                    else 
                        diem = 10;

                    if (vM_QuyDinh.CapNhat_QuyDinh(int.Parse(cbb_SLMax.Text.Trim()), int.Parse(cbb_SLMin.Text.Trim()), int.Parse(cbb_TuoiMax.Text.Trim()), int.Parse(cbb_TuoiMin.Text.Trim()),
                        diem, txt_TenTruong.Text, txt_DiaChi.Text))
                        MessageBox.Show("Thay đổi thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                    else MessageBox.Show("Thay đổi không  thành công", "Chú ý", MessageBoxButton.OK, MessageBoxImage.Information);

                    break;
                case "btn_Huy":
                    this.Close();
                    break;
            }
        }
    }
}

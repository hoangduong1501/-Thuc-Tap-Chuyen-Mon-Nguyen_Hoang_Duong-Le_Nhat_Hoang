using Microsoft.Win32;
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
    /// Interaction logic for TraCuu_UserControl.xaml
    /// </summary>
    public partial class TraCuu_UserControl : UserControl
    {
        private VM_ThongTinHS vM_ThongTinHS;
        private byte[] img = null;

        public TraCuu_UserControl()
        {
            InitializeComponent();
            vM_ThongTinHS = new VM_ThongTinHS();
            LoadDS_HocSinh();
            Load_Combobox();
        }
        private void Load_Combobox()
        {
            this.cbb_NgheCha.ItemsSource = cbb_NgheMe.ItemsSource = this.vM_ThongTinHS.DanhSach_NgheNghiep();
            this.cbb_NgheCha.SelectedValuePath = cbb_NgheMe.SelectedValuePath = "maNgheNghiep";
            this.cbb_NgheCha.DisplayMemberPath = cbb_NgheMe.DisplayMemberPath = "tenNgheNghiep";

            this.cbb_DanToc.ItemsSource = this.vM_ThongTinHS.DanhSach_DanToc();
            this.cbb_DanToc.DisplayMemberPath = "ten_DanToc";
            this.cbb_DanToc.SelectedValuePath = "ma_DanToc";

            this.cbb_TonGiao.ItemsSource = this.vM_ThongTinHS.DanhSach_TonGiao();
            this.cbb_TonGiao.SelectedValuePath = "ma_TonGiao";
            this.cbb_TonGiao.DisplayMemberPath = "ten_TonGiao";

            cbb_GioiTinh.Items.Add("Nam");
            cbb_GioiTinh.Items.Add("Nữ");
        }
        private void LoadDS_HocSinh()
        {
            lvDanhSachHS.ItemsSource = vM_ThongTinHS.DanhSach_HocSinh();
            this.grp_Input.Width = 0;
            
        }

        private void Chip_Click(object sender, RoutedEventArgs e)
        {
            if (txt_TenHocSinh.Text.Trim() != "" && txt_DiaChi.Text.Trim() != "" && txt_TenMe.Text.Trim() != "" && txt_TenCha.Text.Trim() != "" && img != null && 
                cbb_DanToc.SelectedIndex != -1 && cbb_GioiTinh.SelectedIndex != -1 && cbb_TonGiao.SelectedIndex != -1 && cbb_NgheCha.SelectedIndex != -1 && cbb_NgheMe.SelectedIndex != -1)
            {
                string gioiTinh = "", ngaySinh = Swap_String(dp_NgaySinh.SelectedDate.ToString());
                if (cbb_GioiTinh.Text == "Nam") gioiTinh = "True";
                else gioiTinh = "False";

                bool result = vM_ThongTinHS.CapNhat_HocSinh(txt_MaHocSinh.Text, txt_TenHocSinh.Text.Trim(), gioiTinh, ngaySinh, txt_DiaChi.Text,
                        cbb_DanToc.SelectedValue.ToString(), cbb_TonGiao.SelectedValue.ToString(), txt_TenCha.Text,
                        cbb_NgheCha.SelectedValue.ToString(), txt_TenMe.Text, cbb_NgheMe.SelectedValue.ToString(),  this.img);
                if (result) MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                else MessageBox.Show("Sửa không thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else MessageBox.Show("Sửa không thành công, \nHãy nhập đầy đủ thông tin và chọn ảnh thẻ", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
            this.img = null;
            LoadDS_HocSinh();
        }

        private void btn_Event_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            switch (button.Name)
            {
                case "btn_Sua":
                    Sua_HocSinh();
                    break;
                case "btn_LamMoi":
                    LoadDS_HocSinh();
                    break;
            }
        }

        private void Sua_HocSinh()
        {
            if(lvDanhSachHS.SelectedIndex != -1)
            {
                HocSinh_Class hocSinh = vM_ThongTinHS.DanhSach_HocSinh()[lvDanhSachHS.SelectedIndex];
                this.grp_Input.Width = 370;
                txt_MaHocSinh.Text = hocSinh.maHocSinh;
                txt_TenHocSinh.Text = hocSinh.tenHocSinh;
                txt_DiaChi.Text = hocSinh.diaChi;
                txt_TenCha.Text = hocSinh.hoTenCha;
                txt_TenMe.Text = hocSinh.hoTenMe;
                dp_NgaySinh.Text = hocSinh.ngaySinh;
                cbb_GioiTinh.Text = hocSinh.gioiTinh;
                this.pic_AnhThe.Source = vM_ThongTinHS.ToImage(hocSinh.image);
                this.img = hocSinh.image;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            //openFileDialog.Multiselect = true;
            //openFileDialog.Filter = "Text files (*.txt)|*.txt|All files (*.*)|*.*";
            openFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            if (openFileDialog.ShowDialog() == true)
            {
                this.pic_AnhThe.Source = new BitmapImage(new Uri(openFileDialog.FileName.ToString()));
                this.img = vM_ThongTinHS.ConvertImageToBinary(openFileDialog.FileName.ToString());
            }
        }

        private string Swap_String(string str_In)
        {
            str_In = str_In.Substring(0, 10);
            string[] str_Tm = str_In.Split('/');
            if (str_Tm[2].Length == 4)
                return str_Tm[2] + "/" + str_Tm[1] + "/" + str_Tm[0];
            return str_Tm[0] + "/" + str_Tm[1] + "/" + str_Tm[2];
        }

        private void txt_Tim_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter && txt_Tim.Text.Trim() != "") lvDanhSachHS.ItemsSource = vM_ThongTinHS.Tim_HocSinh(txt_Tim.Text);
            else LoadDS_HocSinh();
        }
    }
}

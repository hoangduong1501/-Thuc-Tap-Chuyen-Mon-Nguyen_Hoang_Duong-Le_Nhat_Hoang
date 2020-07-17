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
    /// Interaction logic for BangDiem_UserControl.xaml
    /// </summary>
    public partial class BangDiem_UserControl : UserControl
    {
        private VM_BangDiem vM_BangDiem;
        private List<BangDiem_Class> lst_BangDiem;

        public BangDiem_UserControl()
        {
            InitializeComponent();
            this.vM_BangDiem = new VM_BangDiem();
            this.lst_BangDiem = new List<BangDiem_Class>();
            Load_UI();
        }

        private void Load_UI()
        {
            cbb_NamHoc.ItemsSource = vM_BangDiem.DanhSach_NamHoc();
            cbb_NamHoc.DisplayMemberPath = "ten_NamHoc";
            cbb_NamHoc.SelectedValuePath = "ma_NamHoc";

            cbb_KhoiLop.ItemsSource = vM_BangDiem.DanhSach_KhoiLop();
            cbb_KhoiLop.DisplayMemberPath = "ten_KhoiLop";
            cbb_KhoiLop.SelectedValuePath = "ma_KhoiLop";

            cbb_HocKy.ItemsSource = vM_BangDiem.DanhSach_HocKy();
            cbb_HocKy.DisplayMemberPath = "ten_HocKy";
            cbb_HocKy.SelectedValuePath = "ma_HocKy";

            cbb_MonHoc.ItemsSource = vM_BangDiem.DanhSach_MonHoc();
            cbb_MonHoc.DisplayMemberPath = "ten_MonHoc";
            cbb_MonHoc.SelectedValuePath = "ma_MonHoc";

            cbb_LopHoc.DisplayMemberPath = "ten_Lop";
            cbb_LopHoc.SelectedValuePath = "ma_Lop";
        }

        private void cbb_Event_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = sender as ComboBox;
            if(comboBox.Name == cbb_NamHoc.Name || comboBox.Name == cbb_KhoiLop.Name)
            {
                if (cbb_NamHoc.SelectedIndex != -1 && cbb_KhoiLop.SelectedIndex != -1)
                {
                    cbb_LopHoc.ItemsSource = vM_BangDiem.LocDanhSach_TenLop(cbb_NamHoc.SelectedValue.ToString(), cbb_KhoiLop.SelectedValue.ToString());                      
                }
            }
        }

        private void btn_Event_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if(button.Name == btn_HienThi.Name)
            {
                if(cbb_HocKy.SelectedIndex != -1 && cbb_KhoiLop.SelectedIndex != -1 && cbb_LopHoc.SelectedIndex != -1 
                    && cbb_MonHoc.SelectedIndex != -1 && cbb_NamHoc.SelectedIndex != -1)
                {
                    lv_BangDiem.ItemsSource = lst_BangDiem = vM_BangDiem.DanhSach_BangDiemMon(cbb_LopHoc.SelectedValue.ToString(), 
                        cbb_HocKy.SelectedValue.ToString(), cbb_MonHoc.SelectedValue.ToString());
                    if (lst_BangDiem.Count == 0)
                    {
                        MessageBox.Show("Table Score is null, Click create a new Table Score, please!");
                        this.btn_ThemBang.Visibility = Visibility.Visible;
                    }
                    else this.btn_ThemBang.Visibility = Visibility.Collapsed;
                }
            }
            if(button.Name == btn_LamMoi.Name)
            {
                MessageBox.Show(Lay_HocSinh().ToString());
            }
            if(button.Name == btn_ThemBang.Name)
            {
                this.btn_ThemBang.Visibility = Visibility.Collapsed;
                List<HocSinh_Class> lst = new List<HocSinh_Class>();
                lst = vM_BangDiem.DanhSach_HocSinh(cbb_NamHoc.SelectedValue.ToString(), cbb_KhoiLop.SelectedValue.ToString(), cbb_LopHoc.SelectedValue.ToString());
                bool result = vM_BangDiem.Tao_BangDiem(cbb_NamHoc.SelectedValue.ToString(), cbb_HocKy.SelectedValue.ToString(),
                    cbb_LopHoc.SelectedValue.ToString(), cbb_MonHoc.SelectedValue.ToString(), lst);
                if (result) MessageBox.Show("Ngon");
                else MessageBox.Show("Ngu roi");
            }
            if(button.Name == btn_Next.Name)
            {
                if (lv_BangDiem.SelectedIndex == lst_BangDiem.Count -1)
                {
                    lv_BangDiem.SelectedIndex = 0;
                    Load_TextBox();
                }
                else
                {
                    lv_BangDiem.SelectedIndex++;
                    Load_TextBox();
                }
                this.txt_DiemMieng.Focus();
            }
            if(btn_Update.Name == button.Name)
            {
                if(txt_DiemMieng.Text.Trim() != "" && txt_15L1.Text.Trim() != "" && txt_15L2.Text.Trim() != "" && txt_15L3.Text.Trim() != "" && txt_45L1.Text.Trim() != ""
                    && txt_45L2.Text.Trim() != "" && txt_Thi.Text.Trim() != "")
                {
                    int selectedIndex = Lay_HocSinh();
                    Update_Diem();
                    lv_BangDiem.ItemsSource = null;
                    lv_BangDiem.ItemsSource = lst_BangDiem;
                    lv_BangDiem.SelectedIndex = selectedIndex;
                }                
                else MessageBox.Show("Bảng điểm bạn nhập còn thiếu.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            if(button.Name == btn_LuuBang.Name)
            {
                bool result = vM_BangDiem.CapNhat_BangDiem(cbb_HocKy.SelectedValue.ToString(), cbb_LopHoc.SelectedValue.ToString(), cbb_MonHoc.SelectedValue.ToString(), lst_BangDiem);
                if (result) MessageBox.Show("Lưu bảng điểm thành công.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                else MessageBox.Show("Lưu bảng điểm thất bại.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void Update_Diem()
        {
            float DTB = float.Parse(txt_DiemMieng.Text.Trim()) + float.Parse(txt_15L1.Text.Trim()) + float.Parse(txt_15L2.Text.Trim()) +
                float.Parse(txt_15L3.Text.Trim()) + float.Parse(txt_45L1.Text.Trim()) * 2 + float.Parse(txt_45L2.Text.Trim()) * 2 +
                float.Parse(txt_Thi.Text.Trim()) * 3;

            lst_BangDiem[Lay_HocSinh()].diem_Mieng = float.Parse(txt_DiemMieng.Text.Trim());
            lst_BangDiem[Lay_HocSinh()].diem_15p_1 = float.Parse(txt_15L1.Text.Trim());
            lst_BangDiem[Lay_HocSinh()].diem_15p_2 = float.Parse(txt_15L2.Text.Trim());
            lst_BangDiem[Lay_HocSinh()].diem_15p_3 = float.Parse(txt_15L3.Text.Trim());
            lst_BangDiem[Lay_HocSinh()].diem_45p_1 = float.Parse(txt_45L1.Text.Trim());
            lst_BangDiem[Lay_HocSinh()].diem_45p_2 = float.Parse(txt_45L2.Text.Trim());
            lst_BangDiem[Lay_HocSinh()].diem_ThiHK = float.Parse(txt_Thi.Text.Trim());
            lst_BangDiem[Lay_HocSinh()].diem_TBM = (float)Math.Round((DTB / 11),2);

            MessageBox.Show(lst_BangDiem[Lay_HocSinh()].diem_TBM.ToString());
        }

        private int Lay_HocSinh()
        {
            if(lv_BangDiem.SelectedIndex != -1)
            {
                return lv_BangDiem.SelectedIndex;
            }
            return -2;
        }

        private void lv_BangDiem_MouseDown(object sender, MouseButtonEventArgs e)
        {
            MessageBox.Show(Lay_HocSinh().ToString());
        }

        private void ListViewItem_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var item = sender as ListViewItem;
            if (item != null && item.IsSelected)
            {
                Load_TextBox();
                //MessageBox.Show(lst_BangDiem[Lay_HocSinh()].diem_Mieng.ToString());
            }
        }

        private void Load_TextBox()
        {
            txt_MaHocSinh.Text = lst_BangDiem[Lay_HocSinh()].ma_HocSinh;
            txt_HoTen.Text = lst_BangDiem[Lay_HocSinh()].ten_HocSinh;
            txt_DiemMieng.Text = lst_BangDiem[Lay_HocSinh()].diem_Mieng.ToString();
            txt_15L1.Text = lst_BangDiem[Lay_HocSinh()].diem_15p_1.ToString();
            txt_15L2.Text = lst_BangDiem[Lay_HocSinh()].diem_15p_2.ToString();
            txt_15L3.Text = lst_BangDiem[Lay_HocSinh()].diem_15p_3.ToString();
            txt_45L1.Text = lst_BangDiem[Lay_HocSinh()].diem_45p_1.ToString();
            txt_45L2.Text = lst_BangDiem[Lay_HocSinh()].diem_45p_2.ToString();
            txt_Thi.Text = lst_BangDiem[Lay_HocSinh()].diem_ThiHK.ToString();
            txt_TBM.Text = lst_BangDiem[Lay_HocSinh()].diem_TBM.ToString();
        }
    }
}

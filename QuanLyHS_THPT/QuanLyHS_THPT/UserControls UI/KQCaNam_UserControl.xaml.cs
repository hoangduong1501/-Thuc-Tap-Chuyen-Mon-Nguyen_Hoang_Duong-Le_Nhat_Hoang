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
    /// Interaction logic for KQCaNam_UserControl.xaml
    /// </summary>
    public partial class KQCaNam_UserControl : UserControl
    {
        private VM_BangDiem vM_BangDiem;
        private VM_KQHocKy vM_KQHocKy;
        private VM_DiemCaNhan vM_DiemCaNhan;
        private VM_KQCaNam vM_KQCaNam;
        private List<KQCN_Class> lst_KQCN;
        private List<HocSinh_Class> lst_HocSinh;

        public KQCaNam_UserControl()
        {
            InitializeComponent();
            vM_BangDiem = new VM_BangDiem();
            vM_KQHocKy = new VM_KQHocKy();
            vM_DiemCaNhan = new VM_DiemCaNhan();
            vM_KQCaNam = new VM_KQCaNam();
            lst_KQCN = new List<KQCN_Class>();
            Load_Combobox();
        }
        
        private void Load_Combobox()
        {
            cbb_NamHoc.ItemsSource = vM_BangDiem.DanhSach_NamHoc();
            cbb_NamHoc.DisplayMemberPath = "ten_NamHoc";
            cbb_NamHoc.SelectedValuePath = "ma_NamHoc";

            cbb_KhoiLop.ItemsSource = vM_BangDiem.DanhSach_KhoiLop();
            cbb_KhoiLop.DisplayMemberPath = "ten_KhoiLop";
            cbb_KhoiLop.SelectedValuePath = "ma_KhoiLop";

            cbb_HocLuc.ItemsSource = vM_KQHocKy.DanhSach_HocLuc();
            cbb_HocLuc.DisplayMemberPath = "ten_HocLuc";
            cbb_HocLuc.SelectedValuePath = "ma_HocLuc";

            cbb_Hanhkiem.ItemsSource = vM_KQHocKy.DanhSach_HanhKiem();
            cbb_Hanhkiem.DisplayMemberPath = "ten_HanhKiem";
            cbb_Hanhkiem.SelectedValuePath = "ma_HanhKiem";

            cbb_KetQua.ItemsSource = vM_KQCaNam.DanhSach_KetQua();
            cbb_KetQua.SelectedValuePath = "ma_KetQua";
            cbb_KetQua.DisplayMemberPath = "ten_KetQua";

            cbb_LopHoc.DisplayMemberPath = "ten_Lop";
            cbb_LopHoc.SelectedValuePath = "ma_Lop";
        }

        private int Lay_HocSinh()
        {
            if (lv_BangDiem.SelectedIndex != -1)
            {
                return lv_BangDiem.SelectedIndex;
            }
            return -2;
        }

        private void ListViewItem_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var item = sender as ListViewItem;
            if (item != null && item.IsSelected)
            {
                Load_TextBox();
                this.cbb_Hanhkiem.Focus();
            }
        }

        private void Load_TextBox()
        {
            txt_MaHocSinh.Text = lst_KQCN[Lay_HocSinh()].ma_HocSinh;
            txt_HoTen.Text = lst_KQCN[Lay_HocSinh()].ten_HocSinh;
            txt_DTB.Text = lst_KQCN[Lay_HocSinh()].diem_TB;
            cbb_Hanhkiem.Text = lst_KQCN[Lay_HocSinh()].ten_HanhKiem;
            cbb_HocLuc.Text = lst_KQCN[Lay_HocSinh()].ten_HocLuc;
            cbb_KetQua.Text = lst_KQCN[Lay_HocSinh()].ten_KetQua;
        }

        private void cbb_Event_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = sender as ComboBox;
            if (comboBox.Name == cbb_NamHoc.Name || comboBox.Name == cbb_KhoiLop.Name)
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
            if (button.Name == btn_HienThi.Name)
            {
                lv_BangDiem.ItemsSource = lst_KQCN = vM_KQCaNam.DanhSach_KQCN(cbb_NamHoc.SelectedValue.ToString(), cbb_LopHoc.SelectedValue.ToString());
                if (lst_KQCN.Count == 0)
                {
                    MessageBox.Show("Bảng điểm lớp bạn chọn chưa tồn tại. \nHãy bấm tạo bảng để tiếp tục.", "Thông báo",MessageBoxButton.OK, MessageBoxImage.Information);
                    btn_ThemBang.Visibility = Visibility.Visible;
                }
                else btn_ThemBang.Visibility = Visibility.Collapsed;
            }
            if (button.Name == btn_ThemBang.Name)
            {
                if (cbb_NamHoc.SelectedIndex != -1 && cbb_LopHoc.SelectedIndex != -1)
                {
                    ThemBang_KQCN();
                    btn_ThemBang.Visibility = Visibility.Collapsed;
                }
            }
            if (button.Name == btn_LuuBang.Name)
            {
                CapNhat_KQCN();
            }
            if (button.Name == btn_Update.Name)
            {
                ChinhSua_HocSinh();
            }
            if (button.Name == btn_Next.Name)
            {
                if (lv_BangDiem.SelectedIndex == lst_KQCN.Count - 1)
                {
                    lv_BangDiem.SelectedIndex = 0;
                    Load_TextBox();
                }
                else
                {
                    lv_BangDiem.SelectedIndex++;
                    Load_TextBox();
                }
                this.cbb_Hanhkiem.Focus();
            }
            if (button.Name == btn_XuatReport.Name)
            {
                //
               if(lst_KQCN.Count > 0)
                {
                    reports.Form_DSDiemCaNam form_DSDiemCaNam = new reports.Form_DSDiemCaNam()
                    {
                        maNamHoc = cbb_NamHoc.SelectedValue.ToString(),
                        maLopHoc = cbb_LopHoc.SelectedValue.ToString(),
                    };
                    form_DSDiemCaNam.Show();
                }
            }
        }

        private void CapNhat_KQCN()
        {
            if (txt_MaHocSinh.Text.Trim() != "")
            {
                bool result = vM_KQCaNam.capNhat_QKCN(cbb_LopHoc.SelectedValue.ToString(), lst_KQCN);
                if (result) MessageBox.Show("Lưu thành công","Thông báo", MessageBoxButton.OK,MessageBoxImage.Information);
                else MessageBox.Show("Lưu thất bại", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void ChinhSua_HocSinh()
        {
            int index_HS = Lay_HocSinh();
            lst_KQCN[index_HS].ma_HanhKiem = cbb_Hanhkiem.SelectedValue.ToString();
            lst_KQCN[index_HS].ten_HanhKiem = cbb_Hanhkiem.Text;

            lst_KQCN[index_HS].ma_HocLuc = cbb_HocLuc.SelectedValue.ToString();
            lst_KQCN[index_HS].ten_HocLuc = cbb_HocLuc.Text;

            lst_KQCN[index_HS].ma_KetQua = cbb_KetQua.SelectedValue.ToString();
            lst_KQCN[index_HS].ten_KetQua = cbb_KetQua.Text;

            lv_BangDiem.ItemsSource = null;
            lv_BangDiem.ItemsSource = lst_KQCN;
            lv_BangDiem.SelectedIndex = index_HS;
        }

        private void ThemBang_KQCN()
        {
            this.lst_HocSinh = new List<HocSinh_Class>();
            this.lst_HocSinh = vM_DiemCaNhan.DanhSach_HocSinh(cbb_NamHoc.SelectedValue.ToString(), cbb_KhoiLop.SelectedValue.ToString(), cbb_LopHoc.SelectedValue.ToString());

            if (lst_HocSinh.Count > 0)
            {
                vM_KQCaNam.Them_QKCN(cbb_NamHoc.SelectedValue.ToString(), cbb_LopHoc.SelectedValue.ToString(), lst_HocSinh);
            }

        }
        private void LayDS_KQHK()
        {
          
        }
    }
}

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
    /// Interaction logic for KQHocKy_UserControl.xaml
    /// </summary>
    public partial class KQHocKy_UserControl : UserControl
    {
        private VM_BangDiem vM_BangDiem;
        private VM_KQHocKy vM_KQHocKy;
        private VM_DiemCaNhan vM_DiemCaNhan;
        private List<KQHK_Class> lst_KQHK;
        private List<HocSinh_Class> lst_HocSinh;

        public KQHocKy_UserControl()
        {
            InitializeComponent();
            vM_BangDiem = new VM_BangDiem();
            vM_KQHocKy = new VM_KQHocKy();
            vM_DiemCaNhan = new VM_DiemCaNhan();
            lst_KQHK = new List<KQHK_Class>();
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

            cbb_HocKy.ItemsSource = vM_BangDiem.DanhSach_HocKy();
            cbb_HocKy.DisplayMemberPath = "ten_HocKy";
            cbb_HocKy.SelectedValuePath = "ma_HocKy";

            cbb_HocLuc.ItemsSource = vM_KQHocKy.DanhSach_HocLuc();
            cbb_HocLuc.DisplayMemberPath = "ten_HocLuc";
            cbb_HocLuc.SelectedValuePath = "ma_HocLuc";

            cbb_Hanhkiem.ItemsSource = vM_KQHocKy.DanhSach_HanhKiem();
            cbb_Hanhkiem.DisplayMemberPath = "ten_HanhKiem";
            cbb_Hanhkiem.SelectedValuePath = "ma_HanhKiem";

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
            txt_MaHocSinh.Text = lst_KQHK[Lay_HocSinh()].ma_HocSinh;
            txt_HoTen.Text = lst_KQHK[Lay_HocSinh()].ten_HocSinh;
            txt_DTB.Text = lst_KQHK[Lay_HocSinh()].diem_TBM;
            cbb_Hanhkiem.Text = lst_KQHK[Lay_HocSinh()].ten_HanhKiem;
            cbb_HocLuc.Text = lst_KQHK[Lay_HocSinh()].ten_HocLuc;
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
            if(button.Name == btn_HienThi.Name)
            {
                LayDS_KQHK();
                if(lst_KQHK.Count == 0)
                {
                    MessageBox.Show("Bảng điểm lớp bạn chọn chưa tồn tại. \nHãy bấm tạo bảng để tiếp tục.", "Thông báo",MessageBoxButton.OK, MessageBoxImage.Information);
                    btn_ThemBang.Visibility = Visibility.Visible;
                }
                else btn_ThemBang.Visibility = Visibility.Collapsed;
            }
            if(button.Name == btn_ThemBang.Name)
            {
                if (cbb_NamHoc.SelectedIndex != -1 && cbb_LopHoc.SelectedIndex != -1)
                {
                    ThemBang_KQHK();
                    btn_ThemBang.Visibility = Visibility.Collapsed;
                }
            }
            if(button.Name == btn_LuuBang.Name)
            {
                CapNhat_KQHK();
            }
            if(button.Name == btn_Update.Name)
            {
                ChinhSua_HocSinh();
            }
            if(button.Name == btn_Next.Name)
            {
                if (lv_BangDiem.SelectedIndex == lst_KQHK.Count - 1)
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
            if(button.Name == btn_XuatReport.Name)
            {
                //
                if(lst_KQHK.Count != 0)
                {
                    reports.Form_DSLop form_DSLop = new reports.Form_DSLop()
                    {
                        maHocKy = cbb_HocKy.SelectedValue.ToString(),
                        maNamHoc = cbb_NamHoc.SelectedValue.ToString(),
                        maLopHoc = cbb_LopHoc.SelectedValue.ToString()
                    };
                    form_DSLop.Show();
                }
            }
        }

        private void CapNhat_KQHK()
        {
            if(txt_MaHocSinh.Text.Trim() != "")
            {
                bool result = vM_KQHocKy.CapNhat_QKHK(cbb_HocKy.SelectedValue.ToString(), cbb_LopHoc.SelectedValue.ToString(), lst_KQHK);
                if (result) MessageBox.Show("Cập nhật thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                else MessageBox.Show("Cập nhật không thành công", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void ChinhSua_HocSinh()
        {
            int index_HS = Lay_HocSinh();
            lst_KQHK[index_HS].ma_HanhKiem = cbb_Hanhkiem.SelectedValue.ToString();
            lst_KQHK[index_HS].ten_HanhKiem = cbb_Hanhkiem.Text;

            lst_KQHK[index_HS].ma_HocLuc = cbb_HocLuc.SelectedValue.ToString();
            lst_KQHK[index_HS].ten_HocLuc = cbb_HocLuc.Text;

            lv_BangDiem.ItemsSource = null;
            lv_BangDiem.ItemsSource = lst_KQHK;
            lv_BangDiem.SelectedIndex = index_HS;
        }

        private void ThemBang_KQHK()
        {
            this.lst_HocSinh = new List<HocSinh_Class>();
            this.lst_HocSinh = vM_DiemCaNhan.DanhSach_HocSinh(cbb_NamHoc.SelectedValue.ToString(), cbb_KhoiLop.SelectedValue.ToString(), cbb_LopHoc.SelectedValue.ToString());

            if(lst_HocSinh.Count > 0)
            {
                vM_KQHocKy.Them_QKHK(cbb_NamHoc.SelectedValue.ToString(), cbb_HocKy.SelectedValue.ToString(), cbb_LopHoc.SelectedValue.ToString(), lst_HocSinh);
            }
        }
        private void LayDS_KQHK()
        {
            lv_BangDiem.ItemsSource = lst_KQHK = vM_KQHocKy.DanhSach_KQHK(cbb_NamHoc.SelectedValue.ToString(), cbb_HocKy.SelectedValue.ToString(), 
                                                                                cbb_LopHoc.SelectedValue.ToString());

        }
    }
}

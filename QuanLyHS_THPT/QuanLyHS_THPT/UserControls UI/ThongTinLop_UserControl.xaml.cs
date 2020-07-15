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
    /// Interaction logic for ThongTinLop_UserControl.xaml
    /// </summary>
    public partial class ThongTinLop_UserControl : UserControl
    {
        private List<Lop_Class> lst_LopHoc;
        private VM_ThongTinLop vM_ThongTinLop;

        public ThongTinLop_UserControl()
        {
            InitializeComponent();
            lst_LopHoc = new List<Lop_Class>();
            vM_ThongTinLop = new VM_ThongTinLop();
            Load_UI();
        }

        private void Load_UI()
        {
            //UserControls_UI.ItemLopHoc_UserControl item = new UserControls_UI.ItemLopHoc_UserControl("12A1","Nguyen Hoang Khanh Lan","12");
            //this.Grid_ItemLop.Children.Add(item);
            cbb_KhoiLop.ItemsSource = vM_ThongTinLop.DanhSach_KhoiLop();
            cbb_KhoiLop.DisplayMemberPath = "ten_KhoiLop";
            cbb_KhoiLop.SelectedValuePath = "ma_KhoiLop";

            cbb_NamHoc.ItemsSource = vM_ThongTinLop.DanhSach_NamHoc();
            cbb_NamHoc.DisplayMemberPath = "ten_NamHoc";
            cbb_NamHoc.SelectedValuePath = "ma_NamHoc";
        }

        private void LoadDS_LopHoc()
        {
            this.Grid_ItemLop.Children.Clear();
           foreach(Lop_Class item in lst_LopHoc)
            {
                UserControls_UI.ItemLopHoc_UserControl itemLopHoc_UserControl = new UserControls_UI.ItemLopHoc_UserControl(item.ma_Lop,item.ten_Lop, item.ma_GiaoVien, item.siSo.ToString());
                itemLopHoc_UserControl.MouseDoubleClick += new System.Windows.Input.MouseButtonEventHandler(this.grp_UI_MouseDoubleClick);
                this.Grid_ItemLop.Children.Add(itemLopHoc_UserControl);
            }
        }

        private void grp_UI_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            UserControls_UI.ItemLopHoc_UserControl itemLopHoc_UserControl = sender as UserControls_UI.ItemLopHoc_UserControl;
            lvDanhSachHS.ItemsSource = vM_ThongTinLop.DanhSach_HocSinh(cbb_NamHoc.SelectedValue.ToString(), cbb_KhoiLop.SelectedValue.ToString(), itemLopHoc_UserControl.ma_LopHoc);
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            this.lst_LopHoc.Clear();
            if(cbb_KhoiLop.SelectedIndex != -1 && cbb_NamHoc.SelectedIndex != -1)
            {
                this.lst_LopHoc = vM_ThongTinLop.LocDanhSach_TenLop(cbb_NamHoc.SelectedValue.ToString(), cbb_KhoiLop.SelectedValue.ToString());
            }
            LoadDS_LopHoc();
        }
    }
}

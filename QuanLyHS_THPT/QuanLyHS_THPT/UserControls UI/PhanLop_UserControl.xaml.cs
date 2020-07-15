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
    /// Interaction logic for PhanLop_UserControl.xaml
    /// </summary>
    public partial class PhanLop_UserControl : UserControl
    {
        private VM_PhanLop vM_PhanLop;
        public PhanLop_UserControl()
        {
            InitializeComponent();
            vM_PhanLop = new VM_PhanLop();
            Load_Combobox();
        }
        private void Load_Combobox()
        {
            // Lop Cu
            this.cbb_NamHocCu.ItemsSource = this.vM_PhanLop.DanhSach_NamHoc();
            this.cbb_NamHocCu.SelectedValuePath = "ma_NamHoc";
            this.cbb_NamHocCu.DisplayMemberPath = "ten_NamHoc";

            this.cbb_KhoiLopCu.ItemsSource = this.vM_PhanLop.DanhSach_KhoiLop();
            this.cbb_KhoiLopCu.SelectedValuePath = "ma_KhoiLop";
            this.cbb_KhoiLopCu.DisplayMemberPath = "ten_KhoiLop";

            //Lop Moi
            this.cbb_NamHocMoi.ItemsSource = this.vM_PhanLop.DanhSach_NamHoc();
            this.cbb_NamHocMoi.SelectedValuePath = "ma_NamHoc";
            this.cbb_NamHocMoi.DisplayMemberPath = "ten_NamHoc";

            this.cbb_KhoiLopMoi.ItemsSource = this.vM_PhanLop.DanhSach_KhoiLop();
            this.cbb_KhoiLopMoi.SelectedValuePath = "ma_KhoiLop";
            this.cbb_KhoiLopMoi.DisplayMemberPath = "ten_KhoiLop";            
        }

        private void cbb_Event_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = sender as ComboBox;

            if (comboBox.Name == this.cbb_NamHocCu.Name || comboBox.Name == this.cbb_KhoiLopCu.Name)
            {
                if (cbb_NamHocCu.SelectedIndex != -1 && cbb_KhoiLopCu.SelectedIndex != -1)
                {
                    this.cbb_LopHocCu.ItemsSource = this.vM_PhanLop.LocDanhSach_TenLop(cbb_NamHocCu.SelectedValue.ToString(), cbb_KhoiLopCu.SelectedValue.ToString());
                    this.cbb_LopHocCu.SelectedValuePath = "ma_Lop";
                    this.cbb_LopHocCu.DisplayMemberPath = "ten_Lop";
                }
            }

            if (comboBox.Name == this.cbb_NamHocMoi.Name || comboBox.Name == this.cbb_KhoiLopMoi.Name)
            {
                if (cbb_NamHocMoi.SelectedIndex != -1 && cbb_KhoiLopMoi.SelectedIndex != -1)
                {
                    this.cbb_LopHocMoi.ItemsSource = this.vM_PhanLop.LocDanhSach_TenLop(cbb_NamHocMoi.SelectedValue.ToString(), cbb_KhoiLopMoi.SelectedValue.ToString());
                    this.cbb_LopHocMoi.SelectedValuePath = "ma_Lop";
                    this.cbb_LopHocMoi.DisplayMemberPath = "ten_Lop";
                }
            }

            if(comboBox.Name == cbb_LopHocCu.Name)
            {
                if (cbb_LopHocCu.SelectedIndex != -1)
                    LoadDS_Lop(cbb_NamHocCu.SelectedValue.ToString(), cbb_KhoiLopCu.SelectedValue.ToString(), cbb_LopHocCu.SelectedValue.ToString(), lvLopCu);
            }

            if (comboBox.Name == cbb_LopHocMoi.Name)
            {
                if (cbb_LopHocMoi.SelectedIndex != -1) 
                    LoadDS_Lop(cbb_NamHocMoi.SelectedValue.ToString(), cbb_KhoiLopMoi.SelectedValue.ToString(), cbb_LopHocMoi.SelectedValue.ToString(), lvLopMoi);                   
            }
        }

        private void LoadDS_Lop(string maNamHoc, string maKhoiLop, string maLopHoc, ListView listView)
        {
            listView.ItemsSource = vM_PhanLop.DanhSach_HocSinh(maNamHoc, maKhoiLop, maLopHoc);
        }

        private List<HocSinh_Class> Lay_HocSinh(ListView lstView)
        {
            var lst = lstView.SelectedItems;
            List<HocSinh_Class> lst_HS = new List<HocSinh_Class>();
            foreach(HocSinh_Class selectedItem in lst)
            {
                //MessageBox.Show(selectedItem.maHocSinh.Trim());
                lst_HS.Add(selectedItem);
            }
            return lst_HS;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
           if(button.Name == btn_Them.Name)
            {
                vM_PhanLop.Them_PhanLop(Lay_HocSinh(lvLopCu), cbb_KhoiLopMoi.SelectedValue.ToString(), cbb_NamHocMoi.SelectedValue.ToString(),cbb_LopHocMoi.SelectedValue.ToString());
                LoadDS_Lop(cbb_NamHocMoi.SelectedValue.ToString(), cbb_KhoiLopMoi.SelectedValue.ToString(), cbb_LopHocMoi.SelectedValue.ToString(), lvLopMoi);
            }
           if(button.Name == btn_Xoa.Name)
            {
                vM_PhanLop.Xoa_PhanLop(Lay_HocSinh(lvLopMoi), cbb_LopHocMoi.SelectedValue.ToString());
                LoadDS_Lop(cbb_NamHocMoi.SelectedValue.ToString(), cbb_KhoiLopMoi.SelectedValue.ToString(), cbb_LopHocMoi.SelectedValue.ToString(), lvLopMoi);
            }           
           if(button.Name == btn_LamMoi.Name)
            {
                LoadDS_Lop(cbb_NamHocMoi.SelectedValue.ToString(), cbb_KhoiLopMoi.SelectedValue.ToString(), cbb_LopHocMoi.SelectedValue.ToString(), lvLopMoi);
                LoadDS_Lop(cbb_NamHocMoi.SelectedValue.ToString(), cbb_KhoiLopMoi.SelectedValue.ToString(), cbb_LopHocMoi.SelectedValue.ToString(), lvLopMoi);
            }
        }
    }
}

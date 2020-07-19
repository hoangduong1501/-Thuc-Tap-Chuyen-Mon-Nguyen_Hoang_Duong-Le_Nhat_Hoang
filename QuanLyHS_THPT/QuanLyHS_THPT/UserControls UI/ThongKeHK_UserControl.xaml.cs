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
    /// Interaction logic for ThongKeHK_UserControl.xaml
    /// </summary>
    public partial class ThongKeHK_UserControl : UserControl
    {
        private VM_DiemCaNhan vM_DiemCaNhan;
        private VM_KQHocKy vM_KQHocKy;
        private VM_ThongKe_HocKy vM_ThongKe_HocKy;
        private List<ThongKeHK_Class> lstHK;

        public ThongKeHK_UserControl()
        {
            InitializeComponent();
            vM_DiemCaNhan = new VM_DiemCaNhan();
            vM_KQHocKy = new VM_KQHocKy();
            vM_ThongKe_HocKy = new VM_ThongKe_HocKy();
            Load_Combobox();

            this.lstHK = new List<ThongKeHK_Class>();
        }

        private void showColumnChart()
        {
            float a = lstHK[0].diem_Loc;
            float b = lstHK[0].diem_Tong;

            int c = (int)((a / b) * 100);

            List<KeyValuePair<string, int>> valueList = new List<KeyValuePair<string, int>>();
            valueList.Add(new KeyValuePair<string, int>(cbb_HocLuc.Text, c));
            valueList.Add(new KeyValuePair<string, int>("Tổng", 100-c));
            
            // Setting data for pie chart
            pieChart.DataContext = valueList;

        }

        private void Load_Combobox()
        {
            cbb_NamHoc.ItemsSource = this.vM_DiemCaNhan.DanhSach_NamHoc();
            cbb_NamHoc.DisplayMemberPath = "ten_NamHoc";
            cbb_NamHoc.SelectedValuePath = "ma_NamHoc";

            cbb_HocKy.ItemsSource = this.vM_DiemCaNhan.DanhSach_HocKy();
            cbb_HocKy.DisplayMemberPath = "ten_HocKy";
            cbb_HocKy.SelectedValuePath = "ma_HocKy";

            cbb_HocLuc.ItemsSource = vM_KQHocKy.DanhSach_HocLuc();
            cbb_HocLuc.DisplayMemberPath = "ten_HocLuc";
            cbb_HocLuc.SelectedValuePath = "ma_HocLuc";
        }

        private void btn_HienThi_Click(object sender, RoutedEventArgs e)
        {
            lstHK = vM_ThongKe_HocKy.DanhSanh_ThongKE(cbb_NamHoc.SelectedValue.ToString(), cbb_HocKy.SelectedValue.ToString(), cbb_HocLuc.SelectedValue.ToString());
            lv_BangDiem.ItemsSource = lstHK;

            ThongKeHK_Class thongKeHK_Class = new ThongKeHK_Class();
            if(lstHK.Count > 0)
            {                
                showColumnChart();
            }
            
        }
    }
}

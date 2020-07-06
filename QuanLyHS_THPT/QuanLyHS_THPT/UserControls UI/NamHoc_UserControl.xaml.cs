using MaterialDesignThemes.Wpf;
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
    /// Interaction logic for NamHoc_UserControl.xaml
    /// </summary>
    public partial class NamHoc_UserControl : UserControl
    {
        VM_NamHoc vM_NamHoc;
        public NamHoc_UserControl()
        {
            InitializeComponent();
            vM_NamHoc = new VM_NamHoc();
            Load_UI();
        }

        private void Load_UI()
        {
            lvDS_NamHoc.ItemsSource = vM_NamHoc.DanhSach_NamHoc();
        }

        private void btn_Event_Click(object sender, RoutedEventArgs e)
        {
            Chip chip = new Chip();
            switch (chip.Name)
            {
                case "btn_ThemNamHoc": break;
                case "btn_XoaNamHoc": break;
                case "btn_ThemHocKy": break;
                case "btn_XoaHocKy": break;
            }
        }
    }
}

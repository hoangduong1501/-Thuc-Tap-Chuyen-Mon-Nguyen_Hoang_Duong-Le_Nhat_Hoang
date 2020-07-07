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
    /// Interaction logic for CapNhatLopHoc_UserControl.xaml
    /// </summary>
    public partial class CapNhatLopHoc_UserControl : UserControl
    {
        VM_CapNhatLopHoc vM_CapNhatLopHoc;
        public CapNhatLopHoc_UserControl()
        {
            InitializeComponent();
            this.vM_CapNhatLopHoc = new VM_CapNhatLopHoc();
            Load_UI();
        }

        private void Load_UI()
        {
            this.lvDS_Lop.ItemsSource = this.vM_CapNhatLopHoc.DanhSach_Lop();
            this.grp_Input.IsEnabled = false;
        }

        private void btn_Event_Click(object sender, RoutedEventArgs e)
        {
            this.grp_Input.IsEnabled = true;
        }
    }
}

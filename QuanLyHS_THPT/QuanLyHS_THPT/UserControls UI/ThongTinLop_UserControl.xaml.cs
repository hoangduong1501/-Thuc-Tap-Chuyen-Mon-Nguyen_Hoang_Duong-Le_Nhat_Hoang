using QuanLyHS_THPT.models;
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

        public ThongTinLop_UserControl()
        {
            InitializeComponent();
            lst_LopHoc = new List<Lop_Class>();
            LoadA();
        }

        private void LoadA()
        {
            UserControls_UI.ItemLopHoc_UserControl item = new UserControls_UI.ItemLopHoc_UserControl("AAA","BB","123");
            this.Grid_ItemLop.Children.Add(item);
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(cbb_KhoiLop.SelectedIndex != -1 && cbb_NamHoc.SelectedIndex != -1)
            {
                
            }
        }
    }
}

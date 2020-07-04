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
    /// Interaction logic for GiaoVien_UserControl.xaml
    /// </summary>
    public partial class GiaoVien_UserControl : UserControl
    {
        public GiaoVien_UserControl()
        {
            InitializeComponent();
            Load_UI();
        }

        private void swt_ThemGiaoVien_Click(object sender, RoutedEventArgs e)
        {
            Load_UI();
        }

        private void Load_UI()
        {
            UserControls_UI.ThemGiaoVien_UserControl themGiaoVien_UserControl = new ThemGiaoVien_UserControl();
            this.GridMain.Children.Add(themGiaoVien_UserControl);
        }
    }
}

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
    /// Interaction logic for QuanLyLop_UserControl.xaml
    /// </summary>
    public partial class QuanLyLop_UserControl : UserControl
    {
        public QuanLyLop_UserControl()
        {
            InitializeComponent();
        }

        private void btn_PhanLop_Click(object sender, RoutedEventArgs e)
        {
            UserControls_UI.PhanLop_UserControl phanLop_UserControl = new PhanLop_UserControl();
            this.Grid_Person.Children.Add(phanLop_UserControl);
        }
    }
}

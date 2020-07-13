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
    /// Interaction logic for QuanLyHS_UserControl.xaml
    /// </summary>
    public partial class QuanLyHS_UserControl : UserControl
    {
        public QuanLyHS_UserControl()
        {
            InitializeComponent();
        }

        private void btn_HoSo_Click(object sender, RoutedEventArgs e)
        {
            RadioButton radioButton = sender as RadioButton;
            switch (radioButton.Name)
            {
                case "btn_HoSo":
                    UserControls_UI.ThongTinHS_UserControl thongTinHS_UserControl = new ThongTinHS_UserControl();
                    this.Grid_Person.Children.Add(thongTinHS_UserControl);
                    break;
                case "btn_TraCuu":
                    UserControls_UI.TraCuu_UserControl traCuu_UserControl = new TraCuu_UserControl();
                    this.Grid_Person.Children.Add(traCuu_UserControl);
                    break;
                case "btn_ThanhTichKiLuat": break;
            }
        }
    }
}

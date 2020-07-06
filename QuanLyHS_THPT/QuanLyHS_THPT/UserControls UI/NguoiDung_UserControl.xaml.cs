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
    /// Interaction logic for NguoiDung_UserControl.xaml
    /// </summary>
    public partial class NguoiDung_UserControl : UserControl
    {
        public NguoiDung_UserControl()
        {
            InitializeComponent();
        }

        private void btn_TaiKhoan_Click(object sender, RoutedEventArgs e)
        {
            RadioButton radioButton = sender as RadioButton;
            switch (radioButton.Name)
            {
                case "btn_GiaoVien":
                    UserControls_UI.GiaoVien_UserControl giaoVien_UserControl = new UserControls_UI.GiaoVien_UserControl();
                    this.Grid_Person.Children.Add(giaoVien_UserControl);
                    break;
                case "btn_TaiKhaon": 
                    
                    break;
            }
        }
    }
}

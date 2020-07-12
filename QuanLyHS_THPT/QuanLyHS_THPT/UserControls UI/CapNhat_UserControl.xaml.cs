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
    /// Interaction logic for CapNhat_UserControl.xaml
    /// </summary>
    public partial class CapNhat_UserControl : UserControl
    {
        public CapNhat_UserControl()
        {
            InitializeComponent();
        }

        private void btn_NamHoc_Click(object sender, RoutedEventArgs e)
        {
            RadioButton radioButton = sender as RadioButton;
            Load_UI(radioButton.Name.Trim());
            
        }

        private void Load_UI(string name)
        {
            switch (name)
            {
                case "btn_NamHoc":
                    UserControls_UI.NamHoc_UserControl namHoc_UserControl = new NamHoc_UserControl();
                    this.GridPerson.Children.Add(namHoc_UserControl);
                    break;
                case "btn_LopHoc":
                    UserControls_UI.CapNhatLopHoc_UserControl capNhatLopHoc_UserControl = new CapNhatLopHoc_UserControl();
                    this.GridPerson.Children.Add(capNhatLopHoc_UserControl);
                    break;
                case "btn_MonHoc":
                    UserControls_UI.MonHoc_UserControl monHoc_UserControl = new MonHoc_UserControl();
                    this.GridPerson.Children.Add(monHoc_UserControl);
                    break;
                case "btn_DanToc": break;
                case "btn_KetQua": break;
            }
        }
    }
}

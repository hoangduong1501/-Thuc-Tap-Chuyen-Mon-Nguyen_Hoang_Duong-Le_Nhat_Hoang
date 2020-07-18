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
    /// Interaction logic for QuanLyDiem_UserControl.xaml
    /// </summary>
    public partial class QuanLyDiem_UserControl : UserControl
    {
        public QuanLyDiem_UserControl()
        {
            InitializeComponent();
        }

        private void btn_PhanLop_Click(object sender, RoutedEventArgs e)
        {
            RadioButton radioButton = sender as RadioButton;

            if(radioButton.Name == btn_CaNhan.Name)
            {
                UserControls_UI.DiemCaNhan_UserControl bangDiem_UserControl = new DiemCaNhan_UserControl();
                this.Grid_Person.Children.Add(bangDiem_UserControl);
            }
            if(radioButton.Name == btn_Lop.Name)
            {

            }
            if(radioButton.Name == btn_NhapDiem.Name)
            {
                UserControls_UI.BangDiem_UserControl bangDiem_UserControl = new BangDiem_UserControl();
                this.Grid_Person.Children.Add(bangDiem_UserControl);
            }
            if(radioButton.Name == btn_KetQuaHK.Name)
            {
                UserControls_UI.KQHocKy_UserControl bangDiem_UserControl = new KQHocKy_UserControl();
                this.Grid_Person.Children.Add(bangDiem_UserControl);
            }
            if(radioButton.Name == btn_KetQuaCN.Name)
            {
                UserControls_UI.KQCaNam_UserControl bangDiem_UserControl = new KQCaNam_UserControl();
                this.Grid_Person.Children.Add(bangDiem_UserControl);
            }
        }
    }
}

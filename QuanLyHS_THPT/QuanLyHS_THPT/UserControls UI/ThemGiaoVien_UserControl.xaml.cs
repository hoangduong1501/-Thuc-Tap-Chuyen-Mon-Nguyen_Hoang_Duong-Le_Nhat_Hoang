using MaterialDesignThemes.Wpf;
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
    /// Interaction logic for ThemGiaoVien_UserControl.xaml
    /// </summary>
    public partial class ThemGiaoVien_UserControl : UserControl
    {
        public ThemGiaoVien_UserControl()
        {
            InitializeComponent();

        }

        private void Chip_Click(object sender, RoutedEventArgs e)
        {
            Chip chip = sender as Chip;
            switch (chip.Name.Trim())
            {
                case "btn_Them":
                    Controls_UI.ThemGiaoVien_Window themGiaoVien_Window = new Controls_UI.ThemGiaoVien_Window();
                    themGiaoVien_Window.ShowDialog();
                    break;
                case "btn_Sua":
                    Controls_UI.SuaGiaoVien_Window suaGiaoVien_Window = new Controls_UI.SuaGiaoVien_Window();
                    suaGiaoVien_Window.ShowDialog();
                    break;
            }
           
        }
    }
}

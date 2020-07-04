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
using System.Windows.Shapes;

namespace QuanLyHS_THPT.Controls_UI
{
    /// <summary>
    /// Interaction logic for SuaGiaoVien_Window.xaml
    /// </summary>
    public partial class SuaGiaoVien_Window : Window
    {
        public SuaGiaoVien_Window()
        {
            InitializeComponent();
        }

        private void Chip_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

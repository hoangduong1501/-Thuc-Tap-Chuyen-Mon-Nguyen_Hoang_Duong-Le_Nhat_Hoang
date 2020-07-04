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
    /// Interaction logic for QuyDinh_Window.xaml
    /// </summary>
    public partial class QuyDinh_Window : Window
    {
        public QuyDinh_Window()
        {
            InitializeComponent();
            Create_Item();
        }

        private void Create_Item()
        {
            List<int> lst_Item = new List<int>();
            for(int i = 0; i <= 100; i++)
            {
                lst_Item.Add(i);
            }

            cbb_SLMin.ItemsSource = lst_Item;
            cbb_SLMax.ItemsSource = lst_Item;
            cbb_TuoiMax.ItemsSource = lst_Item;
            cbb_TuoiMin.ItemsSource = lst_Item;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

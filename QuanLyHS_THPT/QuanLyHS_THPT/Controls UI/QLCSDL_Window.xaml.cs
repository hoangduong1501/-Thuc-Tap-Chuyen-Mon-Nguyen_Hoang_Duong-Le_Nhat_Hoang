using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;
using System.Diagnostics;
using System.IO;
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
    /// Interaction logic for QLCSDL_Window.xaml
    /// </summary>
    public partial class QLCSDL_Window : Window
    {
        private string serverName;

        public QLCSDL_Window()
        {
            InitializeComponent();
        }

        private void btn_Update_Click(object sender, RoutedEventArgs e)
        {
            List<string> lst_NameSever = new List<string>();

            SqlDataSourceEnumerator instance = SqlDataSourceEnumerator.Instance;
            DataTable table = instance.GetDataSources();

            //MessageBox.Show(table.Rows[0]["ServerName"].ToString() + "**" + table.Rows[0]["InstanceName"].ToString());

            foreach (DataRow dataRow in table.Rows)
            {
                lst_NameSever.Add(dataRow[0].ToString() + "\\" + dataRow[1].ToString());
            }

            cbb_SeverName.ItemsSource = lst_NameSever;
            cbb_SeverName.SelectedIndex = 0;
            this.serverName = cbb_SeverName.Text;
        }

        private void btn_TaoCSDL_Click(object sender, RoutedEventArgs e)
        {
            Process proc = null;
            try
            {
                //string batDir = string.Format(@"D:\");
                proc = new Process();
                //proc.StartInfo.WorkingDirectory = batDir;
                proc.StartInfo.FileName = "Data\\a.bat";
                proc.StartInfo.CreateNoWindow = false;
                proc.Start();
                proc.WaitForExit();
                MessageBox.Show("Tạo Dữ Liệu Thành Công !!");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace.ToString());
            }
        }

        private void btn_KetNoi_Click(object sender, RoutedEventArgs e)
        {
            string connect = "Data Source=" + this.serverName + ";Initial Catalog=QLHocSinhTHPT;Integrated Security=True";

            using (StreamWriter sw = new StreamWriter("conString"))
            {
                sw.WriteLine(connect);
            }
            MessageBox.Show("Tạo Kết Nối Thành Công !!");
        }
    }
}

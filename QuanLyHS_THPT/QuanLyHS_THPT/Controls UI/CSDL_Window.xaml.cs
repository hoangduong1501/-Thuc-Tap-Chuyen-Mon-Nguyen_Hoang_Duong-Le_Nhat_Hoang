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
    /// Interaction logic for CSDL_Window.xaml
    /// </summary>
    public partial class CSDL_Window : Window
    {
        public CSDL_Window()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            //if(button.Name == btn_TaoCSDL.Name)
            //{
            //    Process proc = null;
            //    try
            //    {
            //        //string batDir = string.Format(@"D:\");
            //        proc = new Process();
            //        //proc.StartInfo.WorkingDirectory = batDir;
            //        proc.StartInfo.FileName = "a.bat";
            //        proc.StartInfo.CreateNoWindow = false;
            //        proc.Start();
            //        proc.WaitForExit();
            //        MessageBox.Show("Tạo Dữ Liệu Thành Công !!");
            //    }
            //    catch (Exception ex)
            //    {
            //        Console.WriteLine(ex.StackTrace.ToString());
            //    }
            //}
            //if(button.Name == btn_TaoKetNoi.Name)
            //{
            //    SqlDataSourceEnumerator instance = SqlDataSourceEnumerator.Instance;
            //    DataTable table = instance.GetDataSources();

            //    string severName = "" + table.Rows[0][0].ToString() + "\\" + table.Rows[0][0].ToString();
            //    string connect = "Data Source="+severName+";Initial Catalog=QLHocSinhTHPT;Integrated Security=True";

            //    using (StreamWriter sw = new StreamWriter("textfile.txt"))
            //    {
            //        sw.WriteLine(connect);
            //    }


            //    MessageBox.Show(connect);

            //}
        }

        private void Chip_Click(object sender, RoutedEventArgs e)
        {
            List<string> lst_NameSever = new List<string>();

            SqlDataSourceEnumerator instance = SqlDataSourceEnumerator.Instance;
            DataTable table = instance.GetDataSources();

            MessageBox.Show(table.Rows[0]["ServerName"].ToString() + "**" + table.Rows[0]["InstanceName"].ToString());

            foreach (DataRow dataRow in table.Rows)
            {
                lst_NameSever.Add(dataRow[0].ToString() + "\\" + dataRow[1].ToString());
            }

            cbb_SeverName.ItemsSource = lst_NameSever;
            cbb_SeverName.SelectedIndex = 0;
        }
    }
}

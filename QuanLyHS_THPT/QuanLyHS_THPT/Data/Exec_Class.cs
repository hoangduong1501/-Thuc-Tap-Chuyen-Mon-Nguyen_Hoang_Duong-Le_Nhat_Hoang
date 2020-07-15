using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyHS_THPT.Data
{
    public static class Exec_Class
    {
        private static string connect_String = @"Data Source=DESKTOP-QEN4LJI;Initial Catalog=QLHocSinhTHPT;Integrated Security=True";
        //private static string connect_String = @"Data Source=DESKTOP-RGEGQ1F\SQLEXPRESS;Initial Catalog=QLHocSinhTHPT;Integrated Security=True";

        //thuc hien cac cau try van insert, delete, update
        public static bool QueryData(SqlCommand sqlCommand)
        {
            using(SqlConnection sqlConnection = new SqlConnection(connect_String))
            {
                try
                {
                    sqlConnection.Open();
                    sqlCommand.Connection = sqlConnection;
                    sqlCommand.CommandType = System.Data.CommandType.Text;
                    sqlCommand.ExecuteNonQuery();
                    sqlConnection.Close();

                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        //thuc hien cau truy van tra ve bang du lieu
        public static DataTable GetData(SqlCommand sqlCommand)
        {
            using (SqlConnection sqlConnection = new SqlConnection(connect_String))
            {
                try
                {
                    sqlConnection.Open();
                    sqlCommand.Connection = sqlConnection;
                    sqlCommand.CommandType = System.Data.CommandType.Text;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand);
                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);
                    sqlConnection.Close();

                    return dataTable;
                }
                catch (Exception)
                {
                    return null;
                }
            }            
        }
    }
}

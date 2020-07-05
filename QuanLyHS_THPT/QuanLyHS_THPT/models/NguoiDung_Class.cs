using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace QuanLyHS_THPT.models
{
    class NguoiDung_Class
    {
        public string tenDangNhap { get; set; }
        public string matKhauDangNhap { get; set; }

        public bool KiemTraDangNhap(string str_TenDangNhap, string str_MatKhau)
        {
            if (tenDangNhap == str_TenDangNhap && matKhauDangNhap == str_MatKhau)
                return true;
            else return false;
        }

        public bool LayThongTin()
        {
            string query = @"EXEC dbo.ThongTinDangNhap @tenDangNhap";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;
            sqlCommand.Parameters.AddWithValue("@tenDangNhap", tenDangNhap);
            DataTable dataTable = new DataTable();
            dataTable = Data.Exec_Class.GetData(sqlCommand);

            string str_TenDangNhap = dataTable.Rows[0][3].ToString();
            string str_MatKhau = dataTable.Rows[0][4].ToString();

            if (KiemTraDangNhap(str_TenDangNhap, str_MatKhau)) return true;
            else return false;            
        }
    }
}

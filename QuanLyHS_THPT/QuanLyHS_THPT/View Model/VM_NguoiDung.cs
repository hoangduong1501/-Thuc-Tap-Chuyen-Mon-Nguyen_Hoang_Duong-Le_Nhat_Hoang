using QuanLyHS_THPT.models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace QuanLyHS_THPT.View_Model
{
    class VM_NguoiDung
    {
        private NguoiDung_Class nguoiDung;

        public bool KiemTra_DangNhap(string str_TenDangNhap, string str_MatKhau)
        {
            Lay_ThongTinNguoiDung(str_TenDangNhap);
            if (nguoiDung.tenDangNhap == str_TenDangNhap && nguoiDung.matKhauDangNhap == str_MatKhau)
                return true;
            else return false;
        }

        public string Lay_TenNguoiDung()
        {
            return nguoiDung.tenNguoiDung;
        }

        private void Lay_ThongTinNguoiDung(string str_TenDangNhap)
        {
            nguoiDung = new NguoiDung_Class();

            string query = @"EXEC dbo.ThongTinDangNhap @tenDangNhap";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;
            sqlCommand.Parameters.AddWithValue("@tenDangNhap", str_TenDangNhap);
            DataTable dataTable = new DataTable();
            dataTable = Data.Exec_Class.GetData(sqlCommand);

            nguoiDung.tenNguoiDung = dataTable.Rows[0][2].ToString();
            nguoiDung.tenDangNhap = dataTable.Rows[0][3].ToString();
            nguoiDung.matKhauDangNhap = dataTable.Rows[0][4].ToString();
            nguoiDung.loaiNguoiDung = dataTable.Rows[0][6].ToString();
        }
    }
}

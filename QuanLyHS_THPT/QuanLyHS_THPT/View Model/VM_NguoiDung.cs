using QuanLyHS_THPT.Data;
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

        public bool Them_NguoiDung(string tenNguoiDung, string tenDangNhap, string matKhau, string loaiNguoiDung)
        {
            string query = @"EXEC dbo.Them_NguoiDung @maLoai, @ten_NguoiDung, @ten_DangNhap, @matKhau";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Parameters.AddWithValue("@maLoai", loaiNguoiDung);
            sqlCommand.Parameters.AddWithValue("@ten_NguoiDung", tenNguoiDung);
            sqlCommand.Parameters.AddWithValue("@ten_DangNhap", tenDangNhap);
            sqlCommand.Parameters.AddWithValue("@matKhau", matKhau);
            sqlCommand.CommandText = query;
            return Data.Exec_Class.QueryData(sqlCommand);
        }

        public bool Xoa_NguoiDung(string maNguoiDung)
        {
            string query = @"EXEC Xoa_NguoiDung @maNguoiDung";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;
            sqlCommand.Parameters.AddWithValue("@maNguoiDung", maNguoiDung);
            return Data.Exec_Class.QueryData(sqlCommand);
        }

        public bool CapNhat_NguoiDung(string maNguoiDung, string tenNguoiDung, string tenDangNhap, string matKhau, string loaiNguoiDung)
        {
            string query = @"EXEC dbo.CapNhat_NguoiDung @maNguoiDung, @maLoai, @ten_NguoiDung, @ten_DangNhap, @matKhau";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Parameters.AddWithValue("@maNguoiDung", maNguoiDung);
            sqlCommand.Parameters.AddWithValue("@maLoai", loaiNguoiDung);
            sqlCommand.Parameters.AddWithValue("@ten_NguoiDung", tenNguoiDung);
            sqlCommand.Parameters.AddWithValue("@ten_DangNhap", tenDangNhap);
            sqlCommand.Parameters.AddWithValue("@matKhau", matKhau);
            sqlCommand.CommandText = query;
            return Data.Exec_Class.QueryData(sqlCommand);
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

        public List<NguoiDung_Class> DanhSach_NguoiDung()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_NguoiDung");

            List<NguoiDung_Class> lst = new List<NguoiDung_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new NguoiDung_Class()
                {
                    maNguoiDung = dataRow[0].ToString().Trim(),
                    loaiNguoiDung = dataRow[1].ToString(),
                    tenNguoiDung = dataRow[2].ToString().Trim(),
                    tenDangNhap = dataRow[3].ToString().Trim(),
                    matKhauDangNhap = dataRow[4].ToString().Trim()
                });
            }

            return lst;
        }

        public List<LoaiNguoiDung_Class> DanhSach_LoaiNguoiDung()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC LayDS_LoaiNguoiDung");

            List<LoaiNguoiDung_Class> lst = new List<LoaiNguoiDung_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new LoaiNguoiDung_Class()
                {
                    ma_Loai = dataRow[0].ToString().Trim(),
                    ten_Loai = dataRow[1].ToString()
                });
            }

            return lst;
        }

        public List<NguoiDung_Class> TimDanhSach_NguoiDung(string value)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"	EXEC dbo.Tim_NguoiDung N'" + value + "'");

            List<NguoiDung_Class> lst = new List<NguoiDung_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new NguoiDung_Class()
                {
                    maNguoiDung = dataRow[0].ToString().Trim(),
                    loaiNguoiDung = dataRow[1].ToString(),
                    tenNguoiDung = dataRow[2].ToString().Trim(),
                    tenDangNhap = dataRow[3].ToString().Trim(),
                    matKhauDangNhap = dataRow[4].ToString().Trim()
                });
            }

            return lst;
        }

        private DataTable LayDS_Query(string query)
        {
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }
    }
}

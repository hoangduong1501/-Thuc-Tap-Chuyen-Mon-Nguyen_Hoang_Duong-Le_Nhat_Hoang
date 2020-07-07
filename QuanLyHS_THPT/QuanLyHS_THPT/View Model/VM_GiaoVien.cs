using QuanLyHS_THPT.Data;
using QuanLyHS_THPT.models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyHS_THPT.View_Model
{
    class VM_GiaoVien
    {
        public bool Xoa_GiaoVien(string maGiaoVien)
        {
            try
            {
                string query = @"EXEC dbo.Xoa_GiaoVien @maGiaoVien";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Parameters.AddWithValue("@maGiaoVien", maGiaoVien);
                sqlCommand.CommandText = query;
                Data.Exec_Class.QueryData(sqlCommand);
                return true;
            }
            catch (Exception) { return false; }
        }

        public bool Them_GiaoVien(string tenGiaoVien, string diaChi, string dienThoai, string maMon, string tenDangNhap, string matKhau, string maLoai)
        {
            try
            {
                string query = @"EXEC dbo.Them_GiaoVien @ten_GiaoVien, @diaChi_GiaoVien, @dienThoai_GiaoVien, @ma_MonHoc, @ten_DangNhap, @matkhau_DangNhap, @maLoai";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Parameters.AddWithValue("@ten_GiaoVien", tenGiaoVien);
                sqlCommand.Parameters.AddWithValue("@diaChi_GiaoVien", diaChi);
                sqlCommand.Parameters.AddWithValue("@dienThoai_GiaoVien", dienThoai);
                sqlCommand.Parameters.AddWithValue("@ma_MonHoc", maMon);
                sqlCommand.Parameters.AddWithValue("@ten_DangNhap", tenDangNhap);
                sqlCommand.Parameters.AddWithValue("@matkhau_DangNhap", matKhau);
                sqlCommand.Parameters.AddWithValue("@maLoai", maLoai);
                sqlCommand.CommandText = query;
                Data.Exec_Class.QueryData(sqlCommand);
                return true;
            }
            catch (Exception) { return false; }
        }

        public bool CapNhat_GiaoVien(string maGiaoVien, string tenGiaoVien, string diaChi, string dienThoai, string maMon)
        {
            try
            {
                string a = maGiaoVien + tenGiaoVien + diaChi + dienThoai + maMon;
                string query = @"EXEC dbo.CapNhat_GiaoVien @ma_GiaoVien, @ten_GiaoVien, @diaChi, @dienThoai, @maMon";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@ma_GiaoVien", maGiaoVien);
                sqlCommand.Parameters.AddWithValue("@ten_GiaoVien", tenGiaoVien);
                sqlCommand.Parameters.AddWithValue("@diaChi", diaChi);
                sqlCommand.Parameters.AddWithValue("@dienThoai", dienThoai);
                sqlCommand.Parameters.AddWithValue("@maMon", maMon);
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<GiaoVien_Class> DanhSach_GiaoVien()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_GiaoVien();

            List<GiaoVien_Class> lst = new List<GiaoVien_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new GiaoVien_Class()
                {
                    ma_GiaoVien = dataRow[0].ToString().Trim(),
                    ten_GiaoVien = dataRow[1].ToString().Trim(),
                    diachi_GiaoVien = dataRow[2].ToString().Trim(),
                    dienthoai_GiaoVien = dataRow[3].ToString().Trim(),
                    ten_MonHoc = dataRow[4].ToString().Trim()
                });
            }

            return lst;
        }

        private DataTable LayDS_GiaoVien()
        {
            string query = @"EXEC dbo.LayDS_GiaoVien";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }

        public List<MonHoc_Class> DanhSach_MonHoc()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_MonHoc();

            List<MonHoc_Class> lst = new List<MonHoc_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new MonHoc_Class()
                {
                    ma_MonHoc = dataRow[0].ToString().Trim(),
                    ten_MonHoc = dataRow[1].ToString().Trim(),
                    so_TietHoc = int.Parse(dataRow[2].ToString().Trim()),
                    heSo_MonHoc = int.Parse(dataRow[3].ToString().Trim())
                }); ;
            }

            return lst;
        }

        private DataTable LayDS_MonHoc()
        {
            string query = @"EXEC dbo.LayDS_MonHoc";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }

        public List<LoaiNguoiDung_Class> DanhSach_LoaiNguoiDung()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_LoaiNguoiDung();

            List<LoaiNguoiDung_Class> lst_LoaiNguoiDung = new List<LoaiNguoiDung_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst_LoaiNguoiDung.Add(new LoaiNguoiDung_Class()
                {
                    ma_Loai = dataRow[0].ToString().Trim(),
                    ten_Loai = dataRow[1].ToString().Trim()
                }); ;
            }

            return lst_LoaiNguoiDung;
        }

        private DataTable LayDS_LoaiNguoiDung()
        {
            string query = @"EXEC dbo.LayDS_LoaiNguoiDung";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }

        public List<GiaoVien_Class> DanhSach_TimGiaoVien(string value)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_TimGiaoVien(value);

            List<GiaoVien_Class> lst = new List<GiaoVien_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new GiaoVien_Class()
                {
                    ma_GiaoVien = dataRow[0].ToString().Trim(),
                    ten_GiaoVien = dataRow[1].ToString().Trim(),
                    diachi_GiaoVien = dataRow[2].ToString().Trim(),
                    dienthoai_GiaoVien = dataRow[3].ToString().Trim(),
                    ten_MonHoc = dataRow[4].ToString().Trim()
                });
            }

            return lst;
        }

        private DataTable LayDS_TimGiaoVien(string value)
        {
            string query = @"EXEC dbo.Tim_GiaoVien @value";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Parameters.AddWithValue("@value", value);
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }
    }
}

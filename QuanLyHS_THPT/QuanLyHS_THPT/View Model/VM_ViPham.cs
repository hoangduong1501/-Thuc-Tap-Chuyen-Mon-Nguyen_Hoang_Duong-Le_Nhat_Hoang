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
    class VM_ViPham
    {
        public List<ViPham_Class> DanhSach_ViPham()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_ViPham");

            List<ViPham_Class> lst = new List<ViPham_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new ViPham_Class()
                {
                    ma_HocSinh = dataRow[0].ToString().Trim(),
                    ten_HocSinh= dataRow[1].ToString().Trim(),
                    ma_NamHoc = dataRow[9].ToString().Trim(),
                    ten_NamHoc= dataRow[4].ToString().Trim(),
                    ma_LopHoc = dataRow[7].ToString().Trim(),
                    ten_LopHoc= dataRow[2].ToString().Trim(),
                    ma_HocKy = dataRow[8].ToString().Trim(),
                    ten_HocKy= dataRow[3].ToString().Trim(),
                    ngay_ViPham = dataRow[5].ToString().Substring(0, 10),
                    noidung_ViPham = dataRow[6].ToString().Trim()
                });
            }

            return lst;
        }
        public List<NamHoc_Class> DanhSach_NamHoc()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_NamHoc");

            List<NamHoc_Class> lst = new List<NamHoc_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new NamHoc_Class()
                {
                    ma_NamHoc = dataRow[0].ToString().Trim(),
                    ten_NamHoc = dataRow[1].ToString()
                });
            }

            return lst;
        }
        public List<Lop_Class> DanhSach_LopHoc(string ma_Nam, string ma_Khoi)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.Loc_Lop '"+ma_Nam+"', '"+ma_Khoi+"'");

            List<Lop_Class> lst = new List<Lop_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new Lop_Class()
                {
                    ma_Lop = dataRow[0].ToString().Trim(),
                    ten_Lop = dataRow[1].ToString()
                });
            }

            return lst;
        }
        public List<HocSinh_Class> DanhSach_HocSinh(string ma_Lop)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC LocDS_HocSinh '" + ma_Lop+"'");

            List<HocSinh_Class> lst = new List<HocSinh_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new HocSinh_Class()
                {
                    maHocSinh = dataRow[0].ToString().Trim(),
                    tenHocSinh = dataRow[1].ToString()
                });
            }

            return lst;
        }
        public List<KhoiLop_Class> DanhSach_Khoi()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_KhoiLop");

            List<KhoiLop_Class> lst = new List<KhoiLop_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new KhoiLop_Class()
                {
                    ma_KhoiLop = dataRow[0].ToString().Trim(),
                    ten_KhoiLop = dataRow[1].ToString()
                });
            }

            return lst;
        }

        public List<HocKy_Class> DanhSach_HocKy()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_HocKy");

            List<HocKy_Class> lst = new List<HocKy_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new HocKy_Class()
                {
                    ma_HocKy = dataRow[0].ToString().Trim(),
                    ten_HocKy = dataRow[1].ToString()
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
        public bool CapNhat_ViPham(string ma_HocSinh, string ma_NamHoc, string ma_LopHoc, string ma_HocKy, string ngay_ViPham, string noidung_ViPham)
        {
            try
            {
                string query = @"EXEC dbo.CapNhat_ViPham @ma_HocSinh, @ma_NamHoc, @ma_LopHoc, @ma_HocKy, @ngay_ViPham, @noidung_ViPham";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Parameters.AddWithValue("@ma_HocSinh", ma_HocSinh);
                sqlCommand.Parameters.AddWithValue("@ma_NamHoc", ma_NamHoc);
                sqlCommand.Parameters.AddWithValue("@ma_LopHoc", ma_LopHoc);
                sqlCommand.Parameters.AddWithValue("@ma_HocKy", ma_HocKy);
                sqlCommand.Parameters.AddWithValue("@ngay_ViPham", ngay_ViPham);
                sqlCommand.Parameters.AddWithValue("@noidung_ViPham", noidung_ViPham);
                sqlCommand.CommandText = query;
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception) { return false; }
        }

        public bool Them_ViPham(string ma_HocSinh, string ma_NamHoc, string ma_LopHoc, string ma_HocKy, string ngay_ViPham, string noidung_ViPham)
        {
            try
            {
                string query = @"EXEC [Them_ViPham] @ma_HocSinh, @ma_NamHoc, @ma_LopHoc, @ma_HocKy, @ngay_ViPham, @noidung_ViPham";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Parameters.AddWithValue("@ma_HocSinh", ma_HocSinh);
                sqlCommand.Parameters.AddWithValue("@ma_NamHoc", ma_NamHoc);
                sqlCommand.Parameters.AddWithValue("@ma_LopHoc", ma_LopHoc);
                sqlCommand.Parameters.AddWithValue("@ma_HocKy", ma_HocKy);
                sqlCommand.Parameters.AddWithValue("@ngay_ViPham", ngay_ViPham);
                sqlCommand.Parameters.AddWithValue("@noidung_ViPham", noidung_ViPham);
                sqlCommand.CommandText = query;
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception) { return false; }
        }

        public bool Xoa_ViPham(string ma_HocSinh)
        {
            try
            {
                string query = @"EXEC Xoa_ViPham @ma_HocSinh";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@ma_HocSinh", ma_HocSinh);
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}

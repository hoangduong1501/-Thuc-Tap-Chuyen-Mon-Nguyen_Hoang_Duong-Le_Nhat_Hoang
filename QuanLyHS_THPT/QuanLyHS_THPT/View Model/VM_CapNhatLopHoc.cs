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
    class VM_CapNhatLopHoc
    {
        public bool CapNhat_Lop(string ma_Lop, string ten_Lop, string ma_KhoiLop, string ma_NamHoc, int siSo, string ma_GiaoVien)
        {
            try
            {
                string query = @"EXEC dbo.CapNhat_Lop @maLop, @tenLop, @maKhoi, @maNamHoc, @siSo, @maGiaoVien";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Parameters.AddWithValue("@maLop", ma_Lop);
                sqlCommand.Parameters.AddWithValue("@tenLop", ten_Lop);
                sqlCommand.Parameters.AddWithValue("@maKhoi", ma_KhoiLop);
                sqlCommand.Parameters.AddWithValue("@maNamHoc", ma_NamHoc);
                sqlCommand.Parameters.AddWithValue("@siSo", siSo);
                sqlCommand.Parameters.AddWithValue("@maGiaoVien", ma_GiaoVien);
                sqlCommand.CommandText = query;
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception) { return false; }
        }

        public bool Them_Lop(string ten_Lop, string ma_KhoiLop, string ma_NamHoc, int siSo, string ma_GiaoVien)
        {
            try
            {
                string query = @"EXEC dbo.Them_Lop @tenLop, @maKhoi, @maNamHoc, @siSo, @maGiaoVien";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Parameters.AddWithValue("@tenLop", ten_Lop);
                sqlCommand.Parameters.AddWithValue("@maKhoi", ma_KhoiLop);
                sqlCommand.Parameters.AddWithValue("@maNamHoc", ma_NamHoc);
                sqlCommand.Parameters.AddWithValue("@siSo", siSo);
                sqlCommand.Parameters.AddWithValue("@maGiaoVien", ma_GiaoVien);
                sqlCommand.CommandText = query;
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception) { return false; }
        }

        public List<Lop_Class> DanhSach_Lop()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_Lop");

            List<Lop_Class> lst = new List<Lop_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new Lop_Class()
                {
                    ma_Lop = dataRow[0].ToString().Trim(),
                    ten_Lop = dataRow[1].ToString(),
                    ma_KhoiLop = dataRow[2].ToString().Trim(),
                    ma_NamHoc = dataRow[3].ToString().Trim(),
                    siSo=int.Parse(dataRow[4].ToString().Trim()),
                    ma_GiaoVien = dataRow[5].ToString().Trim()
                });
            }

            return lst;
        }

        public List<NamHoc_Class> DanhSach_NamHoc()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.Lay_NamHoc");

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

        public List<KhoiLop_Class> DanhSach_KhoiLop()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.Lay_KhoiLop");

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

        public List<GiaoVien_Class> DanhSach_GiaoVien()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_GiaoVien");

            List<GiaoVien_Class> lst = new List<GiaoVien_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new GiaoVien_Class()
                {
                    ma_GiaoVien = dataRow[0].ToString().Trim(),
                    ten_GiaoVien = dataRow[1].ToString(),
                    diachi_GiaoVien = dataRow[2].ToString(),
                    dienthoai_GiaoVien = dataRow[3].ToString(),
                    ten_MonHoc = dataRow[4].ToString(),
                });
            }

            return lst;
        }

        public List<Lop_Class> Tim_DanhSach_GiaoVien(string value)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.Tim_LopHoc '" +value+"'");

            List<Lop_Class> lst = new List<Lop_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new Lop_Class()
                {
                    ma_Lop = dataRow[0].ToString().Trim(),
                    ten_Lop = dataRow[1].ToString(),
                    ma_KhoiLop = dataRow[2].ToString().Trim(),
                    ma_NamHoc = dataRow[3].ToString().Trim(),
                    siSo = int.Parse(dataRow[4].ToString().Trim()),
                    ma_GiaoVien = dataRow[5].ToString().Trim()
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

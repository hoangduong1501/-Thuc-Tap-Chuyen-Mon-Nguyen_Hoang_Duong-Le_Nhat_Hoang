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
    class VM_PhanLop
    {
        public void Them_PhanLop(List<HocSinh_Class> lst, string maKhoi, string maNam, string maLopHoc)
        {
            string query = @"EXEC dbo.Them_PhanLop @maNam,@maKhoi,@maLop,@maHocSinh";            

            foreach (HocSinh_Class item in lst)
            {
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@maNam", maNam);
                sqlCommand.Parameters.AddWithValue("@maKhoi", maKhoi);
                sqlCommand.Parameters.AddWithValue("@maLop", maLopHoc);
                sqlCommand.Parameters.AddWithValue("@maHocSinh", item.maHocSinh);
                Data.Exec_Class.QueryData(sqlCommand);
            }
        }

        public void Xoa_PhanLop(List<HocSinh_Class> lst, string maLopHoc)
        {
            string query = @"EXEC dbo.Xoa_PhanLop @maLop,@maHocSinh";

            foreach (HocSinh_Class item in lst)
            {
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@maLop", maLopHoc);
                sqlCommand.Parameters.AddWithValue("@maHocSinh", item.maHocSinh);
                Data.Exec_Class.QueryData(sqlCommand);
            }
        }

        public List<HocSinh_Class> DanhSach_HocSinh(string maNam, string maKhoi, string maLop)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LocDS_Lop '"+maNam+"','"+maKhoi+"','"+maLop+"'");

            List<HocSinh_Class> lst = new List<HocSinh_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new HocSinh_Class()
                {
                    maHocSinh = dataRow[0].ToString().Trim(),
                    tenHocSinh = dataRow[1].ToString().Trim(),
                    maLop = dataRow[2].ToString().Trim()
                });
            }

            return lst;
        }
        public List<KhoiLop_Class> DanhSach_KhoiLop()
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
        public List<Lop_Class> LocDanhSach_TenLop(string ma_Nam, string ma_Lop)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC [dbo].[Loc_Lop] '"+ma_Nam+"','"+ma_Lop+"'");

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
        public List<Lop_Class> DanhSach_TenLop()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_Lop");

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
        private DataTable LayDS_Query(string query)
        {
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }
    }
}

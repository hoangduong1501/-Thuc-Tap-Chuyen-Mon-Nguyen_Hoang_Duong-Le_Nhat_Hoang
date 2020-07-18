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
    class VM_DiemCaNhan
    {
        public List<DiemCaNhan_Class> DanhSach_Mon(string maNam, string maKy, string maHocSinh)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayBD_CaNhan '" + maHocSinh + "','" + maKy + "','" + maNam + "'");

            List<DiemCaNhan_Class> lst = new List<DiemCaNhan_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new DiemCaNhan_Class()
                {
                    ten_HocSinh = dataRow[0].ToString().Trim(),
                    ten_Lop = dataRow[1].ToString().Trim(),
                    ten_Mon = dataRow[2].ToString().Trim(),
                    diem_Mieng = dataRow[3].ToString().Trim(),
                    diem_151 = dataRow[4].ToString().Trim(),
                    diem_152 = dataRow[5].ToString().Trim(),
                    diem_153 = dataRow[6].ToString().Trim(),
                    diem_451 = dataRow[7].ToString().Trim(),
                    diem_452 = dataRow[8].ToString().Trim(),
                    diem_Thi = dataRow[9].ToString().Trim(),
                    diem_TBM = dataRow[10].ToString().Trim()
                });
            }

            return lst;
        }
        public List<HocSinh_Class> DanhSach_HocSinh(string maNam, string maKhoi, string maLop)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LocDS_Lop '" + maNam + "','" + maKhoi + "','" + maLop + "'");

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
            dataTable = LayDS_Query(@"EXEC [dbo].[Loc_Lop] '" + ma_Nam + "','" + ma_Lop + "'");

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
        public List<MonHoc_Class> DanhSach_MonHoc()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_MonHoc");

            List<MonHoc_Class> lst = new List<MonHoc_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new MonHoc_Class()
                {
                    ma_MonHoc = dataRow[0].ToString().Trim(),
                    ten_MonHoc = dataRow[1].ToString()
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

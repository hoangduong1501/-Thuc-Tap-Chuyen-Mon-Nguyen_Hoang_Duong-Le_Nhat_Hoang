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
    class VM_BangDiem
    {
        public bool CapNhat_BangDiem(string maHocKy, string maLopHoc, string maMonHoc, List<BangDiem_Class> lst)
        {
            string query = @"EXEC dbo.CapNhat_BangDiem @maHocSinh, @maHocKy, @maLop, @maMon, @diemMieng, @15L1, @15L2, @15L3, @45L1, @45L2, @DiemThi, @DTB";
            try
            {
                foreach (BangDiem_Class item in lst)
                {
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.CommandText = query;
                    sqlCommand.Parameters.AddWithValue("@maHocSinh", item.ma_HocSinh);
                    sqlCommand.Parameters.AddWithValue("@maHocKy", maHocKy);
                    sqlCommand.Parameters.AddWithValue("@maLop", maLopHoc);
                    sqlCommand.Parameters.AddWithValue("@maMon", maMonHoc);
                    sqlCommand.Parameters.AddWithValue("@diemMieng", item.diem_Mieng);
                    sqlCommand.Parameters.AddWithValue("@15L1", item.diem_15p_1);
                    sqlCommand.Parameters.AddWithValue("@15L2", item.diem_15p_2);
                    sqlCommand.Parameters.AddWithValue("@15L3", item.diem_15p_3);
                    sqlCommand.Parameters.AddWithValue("@45L1", item.diem_45p_1);
                    sqlCommand.Parameters.AddWithValue("@45L2", item.diem_45p_2);
                    sqlCommand.Parameters.AddWithValue("@DiemThi", item.diem_ThiHK);
                    sqlCommand.Parameters.AddWithValue("@DTB", item.diem_TBM);

                    Data.Exec_Class.QueryData(sqlCommand);
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Tao_BangDiem(string maNam, string maHocKy, string maLop, string maMonHoc, List<HocSinh_Class> lst)
        {
            string query = @"dbo.Them_BangDiem @maHocSinh, @maNam, @maKy, @maLop, @maMon";

            try
            {
                foreach (HocSinh_Class item in lst)
                {
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.CommandText = query;
                    sqlCommand.Parameters.AddWithValue("@maHocSinh", item.maHocSinh);
                    sqlCommand.Parameters.AddWithValue("@maNam", maNam);
                    sqlCommand.Parameters.AddWithValue("@maKy", maHocKy);
                    sqlCommand.Parameters.AddWithValue("@maLop", maLop);
                    sqlCommand.Parameters.AddWithValue("@maMon", maMonHoc);
                    Data.Exec_Class.QueryData(sqlCommand);
                }
                 return true;
            }
            catch (Exception)
            {
                return false;
            }
           
        }
        public List<BangDiem_Class> DanhSach_BangDiemMon(string maLop, string ma_HocKy, string ma_MonHoc)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC LayDS_BangDiem_Mon '"+maLop+"' ,'"+ma_HocKy+"' ,'"+ma_MonHoc+"'");

            List<BangDiem_Class> lst = new List<BangDiem_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                float a = float.Parse(dataRow[5].ToString());
                lst.Add(new BangDiem_Class()
                {
                    ma_HocSinh = dataRow[0].ToString().Trim(),
                    ten_HocSinh = dataRow[1].ToString(),
                    ma_HocKy = dataRow[2].ToString(),
                    ma_LopHoc = dataRow[3].ToString(),
                    ma_MonHoc = dataRow[4].ToString(),

                    diem_Mieng = float.Parse(dataRow[5].ToString()),
                    diem_15p_1 = float.Parse(dataRow[6].ToString()),
                    diem_15p_2 = float.Parse(dataRow[7].ToString()),
                    diem_15p_3 = float.Parse(dataRow[8].ToString()),
                    diem_45p_1 = float.Parse(dataRow[9].ToString()),
                    diem_45p_2 = float.Parse(dataRow[10].ToString()),
                    diem_ThiHK = float.Parse(dataRow[11].ToString()),
                    diem_TBM = float.Parse(dataRow[12].ToString()),
                });
            }

            return lst;
        }
        public List<HocSinh_Class>DanhSach_HocSinh(string maNam, string maKhoi, string maLop)
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

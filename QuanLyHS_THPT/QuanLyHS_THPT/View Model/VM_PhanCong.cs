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
    class VM_PhanCong
    {
        public bool Xoa_PhanCong(int STT)
        {
            try
            {
                string query = @"EXEC dbo.Xoa_PhanCong @STT";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Parameters.AddWithValue("@STT", STT);
                sqlCommand.CommandText = query;
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception) { return false; }
        }

        public bool Them_PhanCong(string maNamHoc, string maLop, string maMonHoc, string maGiaoVien)
        {
            try
            {
                string query = @"EXEC dbo.Them_PhanCong @maNamHoc,@maLop,@maMonHoc,@maGiaoVien";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Parameters.AddWithValue("@maNamHoc", maNamHoc);
                sqlCommand.Parameters.AddWithValue("@maLop", maLop);
                sqlCommand.Parameters.AddWithValue("@maMonHoc", maMonHoc);
                sqlCommand.Parameters.AddWithValue("@maGiaoVien", maGiaoVien);
                sqlCommand.CommandText = query;
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception) { return false; }
        }

        public List<PhanCong_Class> DanhSach_PhanCong()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_PhanCong");

            List<PhanCong_Class> lst = new List<PhanCong_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new PhanCong_Class()
                {
                    so_TT = int.Parse(dataRow[0].ToString().Trim()),
                    namHoc = dataRow[1].ToString().Trim(),
                    lopHoc = dataRow[2].ToString().Trim(),
                    monHoc = dataRow[3].ToString().Trim(),
                    giaoVien = dataRow[4].ToString().Trim(),

                }); ;
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
                    ten_MonHoc = dataRow[1].ToString().Trim(),
                    so_TietHoc= int.Parse(dataRow[2].ToString()),
                    heSo_MonHoc = int.Parse(dataRow[3].ToString())

                });
            }

            return lst;
        }

        public List<Lop_Class> DanhSach_LopHoc()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_Lop");

            List<Lop_Class> lst = new List<Lop_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new Lop_Class()
                {
                    ma_Lop = dataRow[0].ToString().Trim(),
                    ten_Lop = dataRow[1].ToString().Trim(),

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
                    ten_GiaoVien = dataRow[1].ToString().Trim(),

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
                    ten_NamHoc = dataRow[1].ToString().Trim(),

                }); 
            }

            return lst;
        }

        private DataTable LayDS_Query(string query)
        {
            //string query = @"EXEC dbo.LayDS_MonHoc";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }
    }
}

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
    class VM_KQHocKy
    {
        public bool CapNhat_QKHK(string maHocKy, string maLopHoc, List<KQHK_Class> lst)
        {
            string query = @"EXEC [dbo].[CapNhat_KQHK] @maHocSinh, @maKy, @maLop, @maHanhKiem, @maHocLuc";

            try
            {
                foreach (KQHK_Class item in lst)
                {
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.CommandText = query;
                    sqlCommand.Parameters.AddWithValue("@maHocSinh", item.ma_HocSinh);
                    sqlCommand.Parameters.AddWithValue("@maKy", maHocKy);
                    sqlCommand.Parameters.AddWithValue("@maLop", maLopHoc);
                    sqlCommand.Parameters.AddWithValue("@maHanhKiem", item.ma_HanhKiem);
                    sqlCommand.Parameters.AddWithValue("@maHocLuc", item.ma_HocLuc);

                    Data.Exec_Class.QueryData(sqlCommand);
                }

                return true;
            }
            catch (Exception) { return false; }

        }

        public bool Them_QKHK(string maNamHoc, string maHocKy, string maLopHoc, List<HocSinh_Class> lst)
        {
            string query = @"EXEC [dbo].[Them_KQHK] @maHocSinh, @maNam, @maKy, @maLop";

            try
            {
                foreach (HocSinh_Class item in lst)
                {
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.CommandText = query;
                    sqlCommand.Parameters.AddWithValue("@maHocSinh", item.maHocSinh);
                    sqlCommand.Parameters.AddWithValue("@maNam", maNamHoc);
                    sqlCommand.Parameters.AddWithValue("@maKy", maHocKy);
                    sqlCommand.Parameters.AddWithValue("@maLop", maLopHoc);
                    Data.Exec_Class.QueryData(sqlCommand);
                }

                return true;
            }catch(Exception) { return false; }
            
        }

        public List<HanhKiem_Class> DanhSach_HanhKiem()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_HanhKiem");

            List<HanhKiem_Class> lst = new List<HanhKiem_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new HanhKiem_Class()
                {
                    ma_HanhKiem = dataRow[0].ToString(),
                    ten_HanhKiem = dataRow[1].ToString()
                });
            }

            return lst;
        }

        public List<HocLuc_Class> DanhSach_HocLuc()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_HocLuc");

            List<HocLuc_Class> lst = new List<HocLuc_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new HocLuc_Class()
                {
                    ma_HocLuc = dataRow[0].ToString(),
                    ten_HocLuc = dataRow[1].ToString(),
                    diem_CanTren = dataRow[2].ToString(),
                    diem_CanDuoi = dataRow[3].ToString(),
                    diem_KhongChe = dataRow[4].ToString()
                });
            }

            return lst;
        }

        public List<KQHK_Class> DanhSach_KQHK(string maNamHoc, string maHocKy, string maLopHoc)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_KQHK '" + maNamHoc + "' ,'" + maHocKy + "' ,'" + maLopHoc + "'");

            List<KQHK_Class> lst = new List<KQHK_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new KQHK_Class()
                {
                    ma_HocSinh = dataRow[0].ToString(),
                    ten_HocSinh = dataRow[1].ToString(),
                    diem_TBM = dataRow[2].ToString(),
                    ma_HocLuc = dataRow[3].ToString(),
                    ten_HocLuc = dataRow[4].ToString(),
                    ma_HanhKiem = dataRow[5].ToString(),
                    ten_HanhKiem = dataRow[6].ToString()
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

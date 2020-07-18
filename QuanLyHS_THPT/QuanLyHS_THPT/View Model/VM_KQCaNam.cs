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
    class VM_KQCaNam
    {
        public bool capNhat_QKCN(string maLopHoc, List<KQCN_Class> lst)
        {
            string query = @"EXEC [dbo].[CapNhat_KQCN] @maHocSinh, @maLop, @maHanhKiem, @maHocLuc, @maKetQua";

            try
            {
                foreach (KQCN_Class item in lst)
                {
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.CommandText = query;
                    sqlCommand.Parameters.AddWithValue("@maHocSinh", item.ma_HocSinh);
                    sqlCommand.Parameters.AddWithValue("@maLop", maLopHoc);
                    sqlCommand.Parameters.AddWithValue("@maHanhKiem", item.ma_HanhKiem);
                    sqlCommand.Parameters.AddWithValue("@maHocLuc", item.ma_HocLuc);
                    sqlCommand.Parameters.AddWithValue("@maKetQua", item.ma_KetQua);

                    Data.Exec_Class.QueryData(sqlCommand);
                }

                return true;
            }
            catch (Exception) { return false; }

        }
        public bool Them_QKCN(string maNamHoc, string maLopHoc, List<HocSinh_Class> lst)
        {
            string query = @"EXEC [dbo].[Them_KQCN] @maHocSinh, @maNam, @maLop";

            try
            {
                foreach (HocSinh_Class item in lst)
                {
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.CommandText = query;
                    sqlCommand.Parameters.AddWithValue("@maHocSinh", item.maHocSinh);
                    sqlCommand.Parameters.AddWithValue("@maNam", maNamHoc);
                    sqlCommand.Parameters.AddWithValue("@maLop", maLopHoc);
                    Data.Exec_Class.QueryData(sqlCommand);
                }

                return true;
            }
            catch (Exception) { return false; }

        }
        public List<KQCN_Class> DanhSach_KQCN(string maNamHoc, string maLopHoc)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_KQCN '" + maNamHoc + "' ,'" + maLopHoc + "'");

            List<KQCN_Class> lst = new List<KQCN_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new KQCN_Class()
                {
                    ma_HocSinh = dataRow[0].ToString(),
                    ten_HocSinh = dataRow[1].ToString(),
                    ma_LopHoc = dataRow[2].ToString(),
                    diem_TB = dataRow[3].ToString(),
                    ma_HanhKiem = dataRow[4].ToString(),
                    ten_HanhKiem = dataRow[5].ToString(),
                    ma_HocLuc = dataRow[6].ToString(),
                    ten_HocLuc = dataRow[7].ToString(),
                    ma_KetQua = dataRow[8].ToString(),
                    ten_KetQua = dataRow[9].ToString(),
                });
            }

            return lst;
        }
        public List<KetQua_Class> DanhSach_KetQua()
        {
            string query = @"EXEC dbo.LayDS_KetQua";
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(query);

            List<KetQua_Class> lst = new List<KetQua_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new KetQua_Class()
                {
                    ma_KetQua = dataRow[0].ToString(),
                    ten_KetQua = dataRow[1].ToString()
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

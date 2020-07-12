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
    class VM_MonHoc
    {
        public bool Xoa_MonHoc(string maMonHoc)
        {
            string query = @"EXEC dbo.Xoa_MonHoc @maMon";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;
            sqlCommand.Parameters.AddWithValue("@maMon", maMonHoc);
            return Data.Exec_Class.QueryData(sqlCommand);
        }

        public bool Them_MonHoc(string tenMon, int heSo, int soTiet)
        {
            string query = @"EXEC dbo.Them_MonHoc @tenMon, @tietHoc, @heSo";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;
            sqlCommand.Parameters.AddWithValue("@tenMon", tenMon);
            sqlCommand.Parameters.AddWithValue("@tietHoc", soTiet);
            sqlCommand.Parameters.AddWithValue("@heSo", heSo);
            return Data.Exec_Class.QueryData(sqlCommand);
        }

        public bool CapNhat_MonHoc(string maMon, string tenMon, int heSo, int soTiet)
        {
            string query = @"EXEC dbo.Sua_MonHoc @maMon, @tenMon, @tietHoc, @heSo";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;
            sqlCommand.Parameters.AddWithValue("@maMon", maMon);
            sqlCommand.Parameters.AddWithValue("@tenMon", tenMon);
            sqlCommand.Parameters.AddWithValue("@tietHoc", soTiet);
            sqlCommand.Parameters.AddWithValue("@heSo", heSo);
            return Data.Exec_Class.QueryData(sqlCommand);
        }

        public List<MonHoc_Class> DanhSach_NamHoc()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_MonHoc();

            List<MonHoc_Class> lst = new List<MonHoc_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new MonHoc_Class()
                {
                    ma_MonHoc = dataRow[0].ToString().Trim(),
                    ten_MonHoc = dataRow[1].ToString(),
                    heSo_MonHoc = int.Parse(dataRow[3].ToString().Trim()),
                    so_TietHoc = int.Parse(dataRow[2].ToString().Trim())
                });
            }

            return lst;
        }

        private DataTable LayDS_MonHoc()
        {
            string query = @" EXEC dbo.LayDS_MonHoc";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }
    }
}

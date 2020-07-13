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
    class VM_NamHoc
    {
        public List<HocKy_Class> DanhSach_HocKy()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_HocKy();

            List<HocKy_Class> lst = new List<HocKy_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new HocKy_Class()
                {
                    ma_HocKy = dataRow[0].ToString().Trim(),
                    ten_HocKy = dataRow[1].ToString().Trim(),
                    heSo = int.Parse(dataRow[2].ToString().Trim())
                });
            }

            return lst;
        }

        private DataTable LayDS_HocKy()
        {
            string query = @"EXEC dbo.LayDS_HocKy";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }

        public bool Xoa_NamHoc(string ma_NamHoc)
        {
            try
            {
                string query = @"DELETE FROM NAMHOC WHERE MaNamHoc = @ma_NamHoc";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@ma_NamHoc", ma_NamHoc);
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Them_NamHoc(string tenNamHoc)
        {
            try
            {
                string query = @"EXEC Them_NamHoc @ten_NamHoc";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@ten_NamHoc", tenNamHoc);
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception)
            {
                return false;
            }            
        }

        public List<NamHoc_Class> DanhSach_NamHoc()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_NamHoc();

            List<NamHoc_Class> lst = new List<NamHoc_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new NamHoc_Class()
                {
                    ma_NamHoc = dataRow[0].ToString().Trim(),
                    ten_NamHoc = dataRow[1].ToString().Trim()
                });
            }

            return lst;
        }

        private DataTable LayDS_NamHoc()
        {
            string query = @"EXEC dbo.LayDS_NamHoc";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }
    }
}

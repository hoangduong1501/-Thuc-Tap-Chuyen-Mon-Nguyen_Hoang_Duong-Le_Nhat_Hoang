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
    class VM_DanToc_TonGiao
    {
        //Dan Toc
        public List<DanToc_Class> DanhSach_DanToc()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_DanToc();

            List<DanToc_Class> lst = new List<DanToc_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new DanToc_Class()
                {
                    ma_DanToc = dataRow[0].ToString().Trim(),
                    ten_DanToc = dataRow[1].ToString().Trim()
                });
            }

            return lst;
        }

        private DataTable LayDS_DanToc()
        {
            string query = @"EXEC dbo.LayDS_DanToc";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }

        public bool Them_DanToc(string tenDanToc)
        {
            try
            {
                string query = @"EXEC Them_DanToc @tenDanToc";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@tenDanToc", tenDanToc);
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Xoa_DanToc(string maDanToc)
        {
            try
            {
                string query = @"EXEC Xoa_DanToc @maDanToc";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@maDanToc", maDanToc);
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Ton Giao
        public List<TonGiao_Class> DanhSach_TonGiao()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_TonGiao();

            List<TonGiao_Class> lst = new List<TonGiao_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new TonGiao_Class()
                {
                    ma_TonGiao = dataRow[0].ToString().Trim(),
                    ten_TonGiao = dataRow[1].ToString().Trim()
                });
            }

            return lst;
        }

        private DataTable LayDS_TonGiao()
        {
            string query = @"EXEC dbo.LayDS_TonGiao";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }

        public bool Them_TonGiao(string tenTonGiao)
        {
            try
            {
                string query = @"EXEC Them_TonGiao @tenTonGiao";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@tenTonGiao", tenTonGiao);
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Xoa_TonGiao(string maTonGiao)
        {
            try
            {
                string query = @"EXEC Xoa_TonGiao @maTonGiao";
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = query;
                sqlCommand.Parameters.AddWithValue("@maTonGiao", maTonGiao);
                return Data.Exec_Class.QueryData(sqlCommand);
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}

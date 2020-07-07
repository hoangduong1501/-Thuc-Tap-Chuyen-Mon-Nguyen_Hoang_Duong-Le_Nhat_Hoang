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
        public List<Lop_Class> DanhSach_Lop()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Lop();

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

        private DataTable LayDS_Lop()
        {
            string query = @"EXEC dbo.LayDS_Lop";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;

            return Exec_Class.GetData(sqlCommand);
        }
    }
}

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
    class VM_ThongKe_HocKy
    {
        public List<ThongKeHK_Class> DanhSanh_ThongKE(string maNam, string maKy, string maHocLuc)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC ThongKe_HocKy '" + maKy + "' ,'" + maNam + "' ,'" + maHocLuc + "'");

            List<ThongKeHK_Class> lst = new List<ThongKeHK_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new ThongKeHK_Class()
                {
                    ma_HocSinh = dataRow[0].ToString().Trim(),
                    ten_HocSinh = dataRow[1].ToString(),
                    ten_Lop = dataRow[3].ToString(),

                    diem_TB = float.Parse(dataRow[2].ToString()),
                    diem_Loc = float.Parse(dataRow[4].ToString()),
                    diem_Tong = float.Parse(dataRow[5].ToString()),
                    diem_TyLe = float.Parse(dataRow[6].ToString()),
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

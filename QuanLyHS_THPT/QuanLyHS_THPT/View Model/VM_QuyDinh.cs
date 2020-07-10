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
    class VM_QuyDinh
    {
        public QuyDinh_Class LayTT_QuyDinh()
        {
            string query = @"SELECT * FROM QUYDINH";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;
            DataTable dataTable = new DataTable();
            dataTable = Data.Exec_Class.GetData(sqlCommand);

            return new QuyDinh_Class()
            {
                max_Tuoi = int.Parse(dataTable.Rows[0][0].ToString()),
                min_Tuoi = int.Parse(dataTable.Rows[0][1].ToString()),
                max_SiSo = int.Parse(dataTable.Rows[0][2].ToString()),
                min_SiSo = int.Parse(dataTable.Rows[0][3].ToString()),
                thangDiem = int.Parse(dataTable.Rows[0][4].ToString()),
                tenTruong = dataTable.Rows[0][5].ToString(),
                diaChi = dataTable.Rows[0][6].ToString()
            };
        }

        public bool CapNhat_QuyDinh(int max_SiSo, int min_SiSo, int max_Tuoi, int min_Tuoi, int thangDiem, string tenTruong, string diaChi)
        {
            string query = @"EXEC dbo.CapNhat_QuyDinh "+max_SiSo+","+min_SiSo+","+max_Tuoi+","+min_Tuoi+","+thangDiem+",N'"+tenTruong+"',N'"+diaChi+"'";
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;
            //sqlCommand.Parameters.AddWithValue("@max_SiSo", max_SiSo);
            //sqlCommand.Parameters.AddWithValue("@mon_SiSo", min_SiSo);
            //sqlCommand.Parameters.AddWithValue("@max_Tuoi", max_Tuoi);
            //sqlCommand.Parameters.AddWithValue("@min_Tuoi", min_Tuoi);
            //sqlCommand.Parameters.AddWithValue("@thangDiem", thangDiem);
            //sqlCommand.Parameters.AddWithValue("@tenTruong", tenTruong);
            //sqlCommand.Parameters.AddWithValue("@diaChi", diaChi);

            return Data.Exec_Class.QueryData(sqlCommand);
        }
    }
}

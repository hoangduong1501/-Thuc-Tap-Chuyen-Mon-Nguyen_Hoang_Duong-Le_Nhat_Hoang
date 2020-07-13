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

        public List<MonHoc_Class> DanhSach_MonHoc()
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

        public void xuatExcel()
        {
            List<MonHoc_Class> lst = DanhSach_MonHoc();
            Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);
            Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
            worksheet = workbook.Sheets["Sheet1"];
            worksheet = workbook.ActiveSheet;
            app.Visible = true;
            worksheet.Cells[1, 1] = "DANH SÁCH MÔN HỌC";
            worksheet.Cells[3, 1] = "STT";
            worksheet.Cells[3, 2] = "Mã";
            worksheet.Cells[3, 3] = "Tên Môn";
            worksheet.Cells[3, 4] = "Số Tiết";
            worksheet.Cells[3, 5] = "Hệ Số";

            for (int i = 0; i < lst.Count; i++)
            {
                worksheet.Cells[i + 4, 1] = i + 1;
                worksheet.Cells[i + 4, 2] = lst[i].ma_MonHoc;
                worksheet.Cells[i + 4, 3] = lst[i].ten_MonHoc;
                worksheet.Cells[i + 4, 4] = lst[i].so_TietHoc.ToString();
                worksheet.Cells[i + 4, 5] = lst[i].heSo_MonHoc.ToString();
            }
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

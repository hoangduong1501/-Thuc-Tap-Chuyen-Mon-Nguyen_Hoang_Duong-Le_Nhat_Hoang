using MaterialDesignThemes.Wpf;
using QuanLyHS_THPT.Data;
using QuanLyHS_THPT.models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Documents;
using System.Windows.Media.Imaging;

namespace QuanLyHS_THPT.View_Model
{
    class VM_ThongTinHS
    {
        private HocSinh_Class hocSinh_Class;

        public bool CapNhat_HocSinh(string maHocSinh, string tenHocSinh, string gioiTinh, string ngaySinh, string diaChi, string danToc, string tonGiao, string tenCha,
                                    string ngheCha, string tenMe, string ngheMe, byte[] img_Card)
        {
            string query = @"EXEC CapNhat_HocSinh @maHocSinh, @tenHocSinh, @gioiTinh, @ngaySinh, @diaChi, @danToc, @tonGiao, @tenCha,
            @ngheCha, @tenMe, @ngheMe, @imgAnh";

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;
            sqlCommand.Parameters.AddWithValue("@maHocSinh", maHocSinh);
            sqlCommand.Parameters.AddWithValue("@tenHocSinh", tenHocSinh);
            sqlCommand.Parameters.AddWithValue("@gioiTinh", gioiTinh);
            sqlCommand.Parameters.AddWithValue("@ngaySinh", ngaySinh);
            sqlCommand.Parameters.AddWithValue("@diaChi", diaChi);
            sqlCommand.Parameters.AddWithValue("@danToc", danToc);
            sqlCommand.Parameters.AddWithValue("@tonGiao", tonGiao);
            sqlCommand.Parameters.AddWithValue("@tenCha", tenCha);
            sqlCommand.Parameters.AddWithValue("@ngheCha", ngheCha);
            sqlCommand.Parameters.AddWithValue("@tenMe", tenMe);
            sqlCommand.Parameters.AddWithValue("@ngheMe", ngheMe);
            sqlCommand.Parameters.AddWithValue("@imgAnh", img_Card);
            return Data.Exec_Class.QueryData(sqlCommand);
            //return true;
        }

        public bool Them_HocSinh(string tenHocSinh, string gioiTinh, string ngaySinh, string diaChi, string danToc, string tonGiao, string tenCha,
                                    string ngheCha, string tenMe, string ngheMe, string maKhoi, string maLop, string namHoc, byte[] img_Card)
        {
            string query = @"EXEC Them_HocSinh @tenHocSinh, @gioiTinh, @ngaySinh, @diaChi, @danToc, @tonGiao, @tenCha,
            @ngheCha, @tenMe, @ngheMe, @maKhoi, @maLop, @namHoc, @imgAnh";

            //byte[] img_arr = ConvertImageToBinary(img_Path);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandText = query;
            sqlCommand.Parameters.AddWithValue("@tenHocSinh", tenHocSinh);
            sqlCommand.Parameters.AddWithValue("@gioiTinh", gioiTinh);
            sqlCommand.Parameters.AddWithValue("@ngaySinh", ngaySinh);
            sqlCommand.Parameters.AddWithValue("@diaChi", diaChi);
            sqlCommand.Parameters.AddWithValue("@danToc", danToc);
            sqlCommand.Parameters.AddWithValue("@tonGiao", tonGiao);
            sqlCommand.Parameters.AddWithValue("@tenCha", tenCha);
            sqlCommand.Parameters.AddWithValue("@ngheCha", ngheCha);
            sqlCommand.Parameters.AddWithValue("@tenMe", tenMe);
            sqlCommand.Parameters.AddWithValue("@ngheMe", ngheMe);
            sqlCommand.Parameters.AddWithValue("@maKhoi", maKhoi);
            sqlCommand.Parameters.AddWithValue("@maLop", maLop);
            sqlCommand.Parameters.AddWithValue("@namHoc", namHoc);
            sqlCommand.Parameters.AddWithValue("@imgAnh", img_Card);
            return Data.Exec_Class.QueryData(sqlCommand);
            //return true;
        }

        public byte[] ConvertImageToBinary(string image)
        {
            FileStream stream = File.OpenRead(image);
            byte[] file_ArrByte = new byte[stream.Length];
            stream.Read(file_ArrByte, 0, file_ArrByte.Length);
            stream.Close();
            return file_ArrByte;
        }

        public bool CapNhat_HocSinh()
        {

            return true;
        }

        public List<HocSinh_Class> Tim_HocSinh(string value)
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.Tim_HocSinh '"+value+"'");

            List<HocSinh_Class> lst = new List<HocSinh_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                var gt = "";
                if (dataRow[2].ToString() == "True")
                    gt = "Nam";
                else gt = "Nữ";
                lst.Add(new HocSinh_Class()
                {
                    maHocSinh = dataRow[0].ToString().Trim(),
                    tenHocSinh = dataRow[1].ToString().Trim(),
                    gioiTinh = gt,
                    ngaySinh = dataRow[3].ToString().Substring(0, 10),
                    diaChi = dataRow[4].ToString().Trim(),
                    danToc = dataRow[5].ToString().Trim(),
                    tonGiao = dataRow[6].ToString().Trim(),
                    hoTenCha = dataRow[7].ToString().Trim(),
                    hoTenMe = dataRow[8].ToString().Trim(),
                });
            }

            return lst;
        }

        public List<HocSinh_Class> DanhSach_HocSinh()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_HocSinh");

            List<HocSinh_Class> lst = new List<HocSinh_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                var gt = "";
                if (dataRow[2].ToString() == "True")
                    gt = "Nam";
                else gt = "Nữ";

                lst.Add(new HocSinh_Class()
                {
                    maHocSinh = dataRow[0].ToString().Trim(),
                    tenHocSinh = dataRow[1].ToString().Trim(),
                    gioiTinh = gt,          
                    ngaySinh = dataRow[3].ToString().Substring(0,10),
                    diaChi = dataRow[4].ToString().Trim(),
                    danToc = dataRow[5].ToString().Trim(),
                    tonGiao = dataRow[6].ToString().Trim(),
                    hoTenCha = dataRow[7].ToString().Trim(),
                    hoTenMe = dataRow[8].ToString().Trim(),
                    image = (byte[])dataRow[9]
                });
                
            }

            return lst;
        }

        public BitmapImage ToImage(byte[] array)
        {
            try
            {
                using (var ms = new System.IO.MemoryStream(array))
                {
                    var image = new BitmapImage();
                    image.BeginInit();
                    image.CacheOption = BitmapCacheOption.OnLoad; // here
                    image.StreamSource = ms;
                    image.EndInit();
                    return image;
                }
            }
            catch (Exception) { return null; }
        }

        public List<KhoiLop_Class> DanhSach_KhoiLop()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_KhoiLop");

            List<KhoiLop_Class> lst = new List<KhoiLop_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new KhoiLop_Class()
                {
                    ma_KhoiLop = dataRow[0].ToString().Trim(),
                    ten_KhoiLop = dataRow[1].ToString()
                    
                });
            }

            return lst;
        }
        public List<Lop_Class> DanhSach_TenLop()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_Lop");

            List<Lop_Class> lst = new List<Lop_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new Lop_Class()
                {
                    ma_Lop = dataRow[0].ToString().Trim(),
                    ten_Lop = dataRow[1].ToString()
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
                    ten_NamHoc = dataRow[1].ToString()
                });
            }

            return lst;
        }
        public List<NgheNghiep_Class> DanhSach_NgheNghiep()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"SELECT * FROM NGHENGHIEP ");

            List<NgheNghiep_Class> lst = new List<NgheNghiep_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new NgheNghiep_Class()
                {
                    maNgheNghiep = dataRow[0].ToString().Trim(),
                    tenNgheNghiep = dataRow[1].ToString()
                });
            }

            return lst;
        }
        public List<DanToc_Class> DanhSach_DanToc()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_DanToc");

            List<DanToc_Class> lst = new List<DanToc_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new DanToc_Class()
                {
                    ma_DanToc = dataRow[0].ToString().Trim(),
                    ten_DanToc = dataRow[1].ToString()
                });
            }

            return lst;
        }
        public List<TongGiao_Class> DanhSach_TonGiao()
        {
            DataTable dataTable = new DataTable();
            dataTable = LayDS_Query(@"EXEC dbo.LayDS_TonGiao");

            List<TongGiao_Class> lst = new List<TongGiao_Class>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                lst.Add(new TongGiao_Class()
                {
                    ma_TonGiao = dataRow[0].ToString().Trim(),
                    ten_TonGiao = dataRow[1].ToString()
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
        public void xuatExcelTraCuu()
        {
            List<HocSinh_Class> lst = DanhSach_HocSinh();
            Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);
            Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
            worksheet = workbook.Sheets["Sheet1"];
            worksheet = workbook.ActiveSheet;
            app.Visible = true;
            worksheet.Cells[1, 1] = "DANH SÁCH HỌC SINH";
            worksheet.Cells[3, 1] = "STT";
            worksheet.Cells[3, 2] = "Mã";
            worksheet.Cells[3, 3] = "Họ Tên";
            worksheet.Cells[3, 4] = "Giới";
            worksheet.Cells[3, 5] = "Ngày Sinh";
            worksheet.Cells[3, 6] = "Địa Chỉ";
            worksheet.Cells[3, 7] = "Dân Tộc";
            worksheet.Cells[3, 8] = "Tôn Giáo";

            for (int i = 0; i < lst.Count; i++)
            {
                worksheet.Cells[i + 4, 1] = i + 1;
                worksheet.Cells[i + 4, 2] = lst[i].maHocSinh;
                worksheet.Cells[i + 4, 3] = lst[i].tenHocSinh;
                worksheet.Cells[i + 4, 4] = lst[i].gioiTinh;
                worksheet.Cells[i + 4, 5] = lst[i].ngaySinh;
                worksheet.Cells[i + 4, 6] = lst[i].diaChi;
                worksheet.Cells[i + 4, 7] = lst[i].danToc;
                worksheet.Cells[i + 4, 8] = lst[i].tonGiao;
            }
        }

        public void xuatExcelHoSo()
        {
            List<HocSinh_Class> lst = DanhSach_HocSinh();
            Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);
            Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
            worksheet = workbook.Sheets["Sheet1"];
            worksheet = workbook.ActiveSheet;
            app.Visible = true;
            worksheet.Cells[1, 1] = "DANH SÁCH HỌC SINH";
            worksheet.Cells[3, 1] = "STT";
            worksheet.Cells[3, 2] = "Mã";
            worksheet.Cells[3, 3] = "Họ Tên";
            worksheet.Cells[3, 4] = "Giới";
            worksheet.Cells[3, 5] = "Ngày Sinh";
            worksheet.Cells[3, 6] = "Địa Chỉ";

            for (int i = 0; i < lst.Count; i++)
            {
                worksheet.Cells[i + 4, 1] = i + 1;
                worksheet.Cells[i + 4, 2] = lst[i].maHocSinh;
                worksheet.Cells[i + 4, 3] = lst[i].tenHocSinh;
                worksheet.Cells[i + 4, 4] = lst[i].gioiTinh;
                worksheet.Cells[i + 4, 5] = lst[i].ngaySinh;
                worksheet.Cells[i + 4, 6] = lst[i].diaChi;
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace QuanLyHS_THPT.models
{
    class NguoiDung_Class
    {
        public string maNguoiDung { get; set; }
        public string tenDangNhap { get; set; }
        public string matKhauDangNhap { get; set; }
        public string tenNguoiDung { get; set; }     
        public string loaiNguoiDung { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyHS_THPT.models
{
    class BangDiem_Class
    {
        public string ma_HocSinh { get; set; }
        public string ten_HocSinh { get; set; }
        public string ma_HocKy { get; set; }
        public string ma_LopHoc { get; set; }
        public string ma_MonHoc { get; set; }

        public float diem_Mieng { get; set; }   // điểm kiểm tra miệng
        public float diem_15p_1 { get; set; }  // 15 phút lần 1
        public float diem_15p_2 { get; set; }  // 15 phút lần 2
        public float diem_15p_3 { get; set; }  // 15 phút lần 3
        public float diem_45p_1 { get; set; }  // 1 tiết lần 1 
        public float diem_45p_2 { get; set; }  // 1 tiết lần 2
        public float diem_ThiHK { get; set; }  //điểm thi cuối kì
        public float diem_TBM { get; set; } // điểm trung bình môn
    }
}

   M S B A M L   `   `   `  ����H  DQuanLyHS_THPT, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:QuanLyHS_THPT.UserControls_UIQuanLyHS_THPT.UserControls_UI  5      7    1QuanLyHS_THPT.UserControls_UI.KQCaNam_UserControl   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      7local+clr-namespace:QuanLyHS_THPT.UserControls_UI  5      .��5
      � 
�������  � ColumnDefinitions  5   
   �� 5      $	��120 �6   �� 5      $��* �6   .+�5   
   �� .+�5      �� $��Chọn Lớp��6   $��18(�6(   $��Center=�66   $��0,40,0,0q�6S   �� 5      -   5         ��Name$ 
cbb_NamHoc��5      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 
Năm Học��5      $��90��6:    �� 
IsEditable . $��0,10,0,0q�5   #   �� 5      -   5        $ cbb_KhoiLop��5      $ Khối Lớp��5      $��90��6;    . $��0,10,0,0q�5   #   �� 5      -   5        $ 
cbb_LopHoc��5      $ Lớp Học��5      $��90��6:    . $��0,10,0,0q�5   #   �� 5      -   5         ��Name$ btn_HienThi��5      $��	0,10,0,20q�6*    0  ,MaterialDesignFloatingActionMiniAccentButton#��[  5       � ToolTip$ Mở Bảng Điểm��5      .��5      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ CardSearchOutline=�6*   $��24��6C   $��24��6O   5      �� 5      -   5        $ btn_ThemBang��5      $��0,0,0,0q�6+   $y�	Collapsed=�6<   #��[  5       $ Thêm��5!      .��5"        $ 	TablePlus=�6*   $��24��6;   $��24��6G   5#      �� 5$      -   5        $ btn_LuuBang��5$      $��0,10,0,0q�6*   #��[  5%      $ Lưu Bảng Điểm��5&      .��5'        $ ContentSaveAllOutline=�6*   $��24��6G   $��24��6S   5(      �� 5)      -   5        $ 
btn_LamMoi��5)      $��0,10,0,0q�6)   #��[  5*      $ 
Làm Mới��5+      .��5,        $ Refresh=�6*   $��24��69   $��24��6E   5-      �� 5.      -   5        $ btn_Xuat��5.      $��0,10,0,0q�6'   #��[  5/      $ 
Làm Mới��50      .��51        $ MicrosoftExcel=�6*   $��24��6@   $��24��6L   52      �� 53      -	   5        $ btn_XuatReport��53      $��0,10,0,0q�6-   #��[  54      $ Xuất Báo Cáo��55      .��56        $ 	FileChart=�6*   $��24��6;   $��24��6G   57      59      � 5:   
   $��1��6    � RowDefinitions 5;      �� 5<      $��70 �6    �� 5=      $��* �6    .+�5?      � .+�5@      �� -
   5         ��Name$ txt_MaHocSinh��5@       % !MaterialDesignFloatingHintTextBox#��[ 5A      $	��Top=�5B      $	��100��6-   	 �� 
IsReadOnly	 . $
��Left=�5C      $��5,0,0,0q�60   .��6A    5D      �� 5E      
 �� Orientation$
 
Horizontal=�6%   $��-2 0 0 0q�6>   .+�5F        $ BarcodeScan=�66   �� 5G      $	��Mã��6(   5H      .��5I   6   5J      �� 5K      -   5        $ 	txt_HoTen��5K      #��[ 5L      $	��Top=�5M      $	��175��6-   	 . $
��Left=�5N      $��	115,0,0,0q�60   .��6C    5O      �� 5P      $
 
Horizontal=�6%   $��-2 0 0 0q�6>   .+�5Q        $ CommentAccountOutline=�66   �� 5R      $��	Họ tên��6(   5S      .��5T   6   5U      �� 5V      -   5        $ txt_DTB��5V      #��[ 5W      $	��Top=�5X      $	��100��6-   	 . $
��Left=�5Y      $��	302,0,0,0q�60   .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton . $��0��5Z   J   .��6W    5[      �� 5\      $
 
Horizontal=�6%   $��-2 0 0 0q�6>   .+�5]        $ CodeTags=�66   �� 5^      $
��ĐTB��6(   5_      .��5`   6   5a      �� 5b      -   5        $ cbb_Hanhkiem��5b       & "MaterialDesignFloatingHintComboBox#��[ 5c      $ Hạnh Kiểm��5d      $��90��6@    . $��	416,3,0,0q�5e      $	��Top=�6(   $
��Left=�6@   �� 5f      -   5        $ 
cbb_HocLuc��5f      #��[ 5g      $ Học Lực��5h      $��90��6>    . $��	528,3,0,0q�5i      $	��Top=�6(   $
��Left=�6@   �� 5j      -   5        $ 
btn_Update��5j        MaterialDesignIconButton#��[ 5k      $��	0,8,100,0q�5l      $ Kế tiếp��5m      $��Right=�6'   $	��Top=�6C    ( $MaterialDesignTextFieldBoxBackground#���  5n      $��7��6Y   .��5o        $! ArrowDownBoldHexagonOutline=�6.   5p      �� 5q      -   5        $ btn_Next��5q      #��[ 5r      $��0,8,36,0q�5s      $ Kế tiếp��5t      $��Right=�6'   $	��Top=�6C   #���  5u      $��8��6Y   .��5v        $ ChevronRight=�6.   5w      �� 5x      -   5        $ 
cbb_KetQua��5x      #��[ 5y      $ Kết quả��5z      $��90��6>    . $��	634,3,0,0q�5{      $	��Top=�6(   $
��Left=�6@   5|      � 5~      $��1��6   .+�5      �� -   5         ��Name$ lv_BangDiem��5       �� View 5�      �� 5�      .P�5�      �� $	��Mã��6-    �� Width$	 100��69    �� DisplayMemberBinding 6E   �� *
ma_HocSinh+�� 5�      $��	Họ tên��6-   $	 190��6=    6I   �� *ten_HocSinh+�� 5�      $��Điểm��6-   $	 120��6;    6G   �� *	diem_TB+�� 5�      $��Hạnh kiểm��6-   $	 120��6@    6L   �� *ten_HanhKiem+�� 5�      $��Học lực��6-   $	 120��6>    6J   �� *
ten_HocLuc+�� 5�      $��Kết quả��6-   $	 120��6>    6J   �� *
ten_KetQua+5�      ��5�      �� 5�       �� 
TargetType" ��6    .�5�      -   5        5�      5�      5�      5�      5�      5�      
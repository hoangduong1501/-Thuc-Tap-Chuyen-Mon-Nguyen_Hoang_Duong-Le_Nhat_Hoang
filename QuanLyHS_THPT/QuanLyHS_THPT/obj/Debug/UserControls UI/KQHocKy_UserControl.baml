   M S B A M L   `   `   `  ����H  DQuanLyHS_THPT, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:QuanLyHS_THPT.UserControls_UIQuanLyHS_THPT.UserControls_UI  5      7    1QuanLyHS_THPT.UserControls_UI.KQHocKy_UserControl   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      7local+clr-namespace:QuanLyHS_THPT.UserControls_UI  5      .��5
      � 
�������  � ColumnDefinitions  5   
   �� 5      $	��120 �6   �� 5      $��* �6   .+�5   
   �� .+�5      �� $��Chọn Lớp��6   $��18(�6(   $��Center=�66   $��0,40,0,0q�6S   �� 5      -   5         ��Name$ 
cbb_NamHoc��5      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 
Năm Học��5      $��90��6:    �� 
IsEditable . $��0,10,0,0q�5   #   �� 5      -   5        $ cbb_KhoiLop��5      $ Khối Lớp��5      $��90��6;    . $��0,10,0,0q�5   #   �� 5      -   5        $ 
cbb_LopHoc��5      $ Lớp Học��5      $��90��6:    . $��0,10,0,0q�5   #   �� 5      -   5        $ 	cbb_HocKy��5      $ 
Học Kỳ��5      $��90��69    . $��0,10,0,0q�5   #   �� 5      -   5         ��Name$ btn_HienThi��5      $��	0,10,0,20q�6*    0  ,MaterialDesignFloatingActionMiniAccentButton#��[  5       � ToolTip$ Mở Bảng Điểm��5      .��5       '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ CardSearchOutline=�6*   $��24��6C   $��24��6O   5!      �� 5"      -   5        $ btn_ThemBang��5"      $��0,0,0,0q�6+   $y�	Collapsed=�6<   #��[  5#      $ Thêm��5$      .��5%        $ 	TablePlus=�6*   $��24��6;   $��24��6G   5&      �� 5'      -   5        $ btn_LuuBang��5'      $��0,10,0,0q�6*   #��[  5(      $ Lưu Bảng Điểm��5)      .��5*        $ ContentSaveAllOutline=�6*   $��24��6G   $��24��6S   5+      �� 5,      -   5        $ 
btn_LamMoi��5,      $��0,10,0,0q�6)   #��[  5-      $ 
Làm Mới��5.      .��5/        $ Refresh=�6*   $��24��69   $��24��6E   50      �� 51      -	   5        $ btn_Xuat��51      $��0,10,0,0q�6'   #��[  52      $ 
Làm Mới��53      .��54        $ MicrosoftExcel=�6*   $��24��6@   $��24��6L   55      �� 56      -
   5        $ btn_XuatReport��56      $��0,10,0,0q�6-   #��[  57      $ Xuất Báo Cáo��58      .��59        $ 	FileChart=�6*   $��24��6;   $��24��6G   5:      5<      � 5=   
   $��1��6    � RowDefinitions 5>      �� 5?      $��70 �6    �� 5@      $��* �6    .+�5B      � .+�5C      �� -   5         ��Name$ txt_MaHocSinh��5C       % !MaterialDesignFloatingHintTextBox#��[ 5D      $	��Top=�5E      $	��100��6-   	 �� 
IsReadOnly	 . $
��Left=�5F      $��5,0,0,0q�60   .��6A    5G      �� 5H      
 �� Orientation$
 
Horizontal=�6%   $��-2 0 0 0q�6>   .+�5I        $ BarcodeScan=�66   �� 5J      $	��Mã��6(   5K      .��5L   6   5M      �� 5N      -   5        $ 	txt_HoTen��5N      #��[ 5O      $	��Top=�5P      $	��175��6-   	 . $
��Left=�5Q      $��	115,0,0,0q�60   .��6C    5R      �� 5S      $
 
Horizontal=�6%   $��-2 0 0 0q�6>   .+�5T        $ CommentAccountOutline=�66   �� 5U      $��	Họ tên��6(   5V      .��5W   6   5X      �� 5Y      -   5        $ txt_DTB��5Y      #��[ 5Z      $	��Top=�5[      $	��100��6-   $
��Left=�5\      $��	302,0,0,0q�60   .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton . $��0��5]   J   .��6W    5^      �� 5_      $
 
Horizontal=�6%   $��-2 0 0 0q�6>   .+�5`        $ CodeTags=�66   �� 5a      $��Điểm DBM��6(   5b      .��5c   6   5d      �� 5e      -   5        $ cbb_Hanhkiem��5e       & "MaterialDesignFloatingHintComboBox#��[ 5f      $ Hạnh Kiểm��5g      $��90��6@    . $��	444,3,0,0q�5h      $	��Top=�6(   $
��Left=�6@   �� 5i      -   5        $ 
cbb_HocLuc��5i      #��[ 5j      $ Học Lực��5k      $��90��6>    . $��	556,3,0,0q�5l      $	��Top=�6(   $
��Left=�6@   �� 5m      -   5        $ 
btn_Update��5m        MaterialDesignIconButton#��[ 5n      $��	0,8,134,0q�5o      $ Kế tiếp��5p      $��Right=�6'   $	��Top=�6C    ( $MaterialDesignTextFieldBoxBackground#���  5q      $��7��6Y   .��5r        $! ArrowDownBoldHexagonOutline=�6.   5s      �� 5t      -   5        $ btn_Next��5t      #��[ 5u      $��0,8,74,0q�5v      $ Kế tiếp��5w      $��Right=�6'   $	��Top=�6C   #���  5x      $��8��6Y   .��5y        $ ChevronRight=�6.   5z      5{      � 5}      $��1��6   .+�5~      �� -   5         ��Name$ lv_BangDiem��5~       �� View 5      �� 5�      .P�5�      �� $	��Mã��6-    �� Width$ 70��69    �� DisplayMemberBinding 6D   �� *
ma_HocSinh+�� 5�      $��	Họ tên��6-   $	 180��6=    6I   �� *ten_HocSinh+�� 5�      $��Điểm TBM��6-   $	 120��6?    6K   �� *
diem_TBM+�� 5�      $��Hạnh Kiểm��6-   $	 120��6@    6L   �� *ten_HanhKiem+�� 5�      $��Học Lực��6-   $	 120��6>    6J   �� *
ten_HocLuc+5�      ��5�      �� 5�       �� 
TargetType" ��6    .�5�      -   5        5�      5�      5�      5�      5�      5�      
   M S B A M L   `   `   `  ����H  DQuanLyHS_THPT, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:QuanLyHS_THPT.UserControls_UIQuanLyHS_THPT.UserControls_UI  5      6    0QuanLyHS_THPT.UserControls_UI.TraCuu_UserControl   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      =local+clr-namespace:QuanLyHS_THPT.UserControls_UI     5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .��5
      �� 
�������  �� Orientation$  
Horizontal=�6$   .+�5   
   � -   5         �Name$ 	grp_Input��5   5   $��0��6   $
��Left=�6   $	��Top=�5      $��
10,10,10,0q�6'   $	��520��6;   .+�5      �� $
��Left=�6   $��10,0,0,0q�64   $	��Top=�6F   .+�5      �� -   5         ��Name$ txt_MaHocSinh��5       %  !MaterialDesignFloatingHintTextBox#��[  5      $��Center=�5       �� 
IsReadOnly . .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton .     
SuffixText$  ��5      $	��200��5      .��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint 5      �� 5      $  
Horizontal=�5      $��-2 0 0 0q�5      .+�5      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Barcode=�5      �� 5      $��Mã học sinh��6(   5      .��5   6   5      �� 5       -   5        $ txt_TenHocSinh��5       #��[  5!      $��Center=�5"       .  $  ��5$      $	��200��5%      .��6    5&      �� 5'      $  
Horizontal=�5(      $��-2 0 0 0q�5)      .+�5*        $
 User=�5+      �� 5,      $��Tên học sinh��6(   5-      .��5.   6   5/      (  "System.Windows.Controls.DatePicker  50      -   5          Name$ dp_NgaySinh��50      $	��200��51      $ 
Ngày sinh��52       ( $MaterialDesignFloatingHintDatePicker#��[ 53      �� 54      -   5        	 ��Name$	 cbb_GioiTinh��54       & "MaterialDesignFloatingHintComboBox#��[ 55       .   SecondaryAccentBrush
   UnderlineBrush#
 �  57      .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Inverted=�58      $ Giới tính��59      $	��200��5:      5;      �� 5<      -   5        $ 
txt_DiaChi��5>   ,   #��[  5=      $��Center=�5>       . $  ��5@      $	��200��5A      .��6    5B      �� 5C      $  
Horizontal=�5D      $��-2 0 0 0q�5E      .+�5F        $ Location=�5G      �� 5H      $��Địa chỉ��6(   5I      .��5J   6   5K      �� 5L      -   5        $ 
txt_TenCha��5N   ,   #��[  5M      $��Center=�5N       . $  ��5P      $	��200��5Q      .��6    5R      �� 5S      $  
Horizontal=�5T      $��-2 0 0 0q�5U      .+�5V        $ Father=�5W      �� 5X      $��Họ tên cha��6(   5Y      .��5Z   6   5[      �� 5\      -   5        $	 cbb_NgheCha��5a   ?   #��[ 5]       . #
 �  5_      $ Inverted=�5`      $ Nghề nghiệp��5a      $	��200��5b      5c      �� 5d      -	   5        $ 	txt_TenMe��5f   0   #��[  5e      $��Center=�5f       . $  ��5h      $	��200��5i      .��6!    5j      �� 5k      $  
Horizontal=�5l      $��-2 0 0 0q�5m      .+�5n        $ Mother=�5o      �� 5p      $��Họ tên mẹ��6(   5q      .��5r   6   5s      �� 5t      -
   5        $	 
cbb_NgheMe��5y   C   #��[ 5u       . #
 �  5w      $ Inverted=�5x      $ Nghề nghiệp��5y      $	��200��5z      5{      �� 5|      -   5        $	 
cbb_DanToc��5�   ?   #��[ 5}       . #
 �  5      $ Inverted=�5�      $ 
Dân tộc��5�      $	��200��5�      5�      �� 5�      -   5        $	 cbb_TonGiao��5�   @   #��[ 5�       . #
 �  5�      $ Inverted=�5�      $ 
Tôn giáo��5�      $	��200��5�      5�      5�      �� 5�      $��Right=�6   $��0,0,10,0q�65   $	��Top=�6G   .+�5�      �� $  
Horizontal=�6   .+�5�      �� -   5         & "MaterialDesignFloatingActionButton#��[ 5�      3  -MaterialDesignThemes.Wpf.ButtonProgressAssist   IsIndicatorVisible .    Value$ -1Q�5�         IsIndeterminate . $��25��5�      $��25��6$    � ToolTip$ Đường dẫn ảnh��60   $��5,30,0,0q�6H   .��5�        $ ImageEditOutline=�62   $��20��6J   $��20��6U   5�      �� 5�      -   5         ��Name$ 
pic_AnhThe��5�   O   $/��)/QuanLyHS_THPT;component/Icons/images.jpg��6   $	��128��5�      $��96��6)   $��	10,30,0,0q�64   5�      5�      #  MaterialDesignThemes.Wpf.Chip  5�      -   5        $	��112��5�   "   $	��Top=�6.   $��248,210,0,0q�6F   $��Cập nhập��5�        PrimaryHueDarkBrush   IconBackground# �  5�       ! PrimaryHueDarkForegroundBrush   IconForeground# �  5�      $
��Auto��6R      Icon 5�        5�      $ Update=�6.   
�������6<   5�      5�      �� 5�   
   $��1��6   $	��400��6%   $	��Top=�62   $��5,50,5,0q�5�      .+�5�      �� -   5         ��Name$ btn_Sua��5�       0 ,MaterialDesignFloatingActionMiniAccentButton#��[ 5�      $ Sửa��5�      .��5�        $
 Edit=�6*   $��24��66   $��24��6B   5�      �� 5�      -   5        $ 
btn_LamMoi��5�      $��0,10,0,0q�6)   #��[ 5�      $ 
Làm mới��5�      .��5�        $ Refresh=�6*   $��24��69   $��24��6E   5�      �� 5�      -   5        $ btn_XuatBangTraCuu��5�      $��0,10,0,0q�61   #��[ 5�      $ Xuất Bảng��5�      .��5�        $ MicrosoftExcel=�6*   $��24��6@   $��24��6L   5�      5�      �� 5�   
   $��10,0,0,0q�6   $	��969��6'   .+�5�      � .+�5�      �� -   5        $ txt_Tim��5�   9   $��20,0,0,0q�5�      $
��Left=�6'   #��[  5�      $	��Top=�5�      $	��200��6-    . .��5�   J    5�      �� 5�      $  
Horizontal=�5�      $��-2 0 0 0q�5�      .+�5�        $ Search=�5�   !   �� 5�      $�� Tìm Kiếm��6(   5�      .��5�   6   5�      5�      � 5�      .+�5�      �� -   5        $��lvDanhSachHS��5�       �� View 5�      �� 5�      .P�5�      �� $	��Mã��6-    �� Width$ 70��69    �� DisplayMemberBinding 6D   �� *	maHocSinh+�� 5�      $��	Họ tên��6-   $	 150��6=    6I   �� *
tenHocSinh+�� 5�      $��Giới��6-   $ 60��6;    6F   �� *
gioiTinh+�� 5�      $��
Ngày sinh��6-   $ 95��6@    6K   �� *
ngaySinh+�� 5�      $��Địa chỉ��6-   $	 350��6>    6J   �� *diaChi+�� 5�      $��
Dân tộc��6-   $ 90��6>    6I   �� *danToc+�� 5�      $��
Tôn giáo��6-   $ 90��6?    6J   �� *	tonGiao+5�       �� 
GroupStyle 5�      (  "System.Windows.Controls.GroupStyle  5�         HeaderTemplate 5�      �� 5�   "   .R�5�   &   �� $
��Bold"�60   $��14(�6B   ��6P   �� *Name+5�   #   5�      5�      5�      5�      5�      5�      
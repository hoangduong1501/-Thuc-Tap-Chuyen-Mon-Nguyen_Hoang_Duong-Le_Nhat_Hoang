   M S B A M L   `   `   `  ����H  DQuanLyHS_THPT, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:QuanLyHS_THPT.Controls_UIQuanLyHS_THPT.Controls_UI  5   	   2    ,QuanLyHS_THPT.Controls_UI.SuaGiaoVien_Window   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   9local'clr-namespace:QuanLyHS_THPT.Controls_UI     5   	   V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	     � 
ResizeMode$  NoResize=�5	   	    � WindowStyle$
 None=�5
   	    � WindowStartupLocation$ CenterScreen=�5   	    � Title$ QuyDinh_Window��5   	   $	��381��6    $	��352��6-   .��5      �� 
������$��1,1,1,1q�6&    �� CornerRadius$ 10��6@   ._�5   
   � .+�5      �� -   5        $	��291��5      $	��Top=�6&   .+�5      �� $��Sửa Thông Tin��6   $��Center=�61   $��18(�5      $
��Bold"�6"   $��110,10q�64   �� 5      -   5         ��Name$ txt_MaGiaoVien��5   <    %  !MaterialDesignFloatingHintTextBox#��[  5      $��Center=�5      $	��200��60   .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton .  �� 
IsReadOnly . {�.  .��5   n   )  #MaterialDesignThemes.Wpf.HintAssist   Hint 5      �� 5      	 �� Orientation$	 
Horizontal=�5      $��-2 0 0 0q�5      .+�5      '  !MaterialDesignThemes.Wpf.PackIcon  
   Kind$
 Barcode=�5      �� 5      $��Mã giáo viên��6(   5      .��5   6   5      �� 5       -   5        $ txt_TenGiaoVien��5"   8   #��[  5!      $��Center=�5"      $	��200��6,    . .��5#   F    5$      �� 5%      $	 
Horizontal=�5&      $��-2 0 0 0q�5'      .+�5(        $
 CardAccountDetailsOutline=�5)      �� 5*      $��Tên giáo viên��6(   5+      .��5,   6   5-      �� 5.      -   5        $ 
txt_DiaChi��50   8   #��[  5/      $��Center=�50      $	��200��6,    . .��51   F    52      �� 53      $	 
Horizontal=�54      $��-2 0 0 0q�55      .+�56        $
 Location=�57      �� 58      $��Địa chỉ��6(   59      .��5:   6   5;      �� 5<      -   5        $ txt_DienThoai��5>   8   #��[  5=      $��Center=�5>      $	��200��6,    .    
SuffixText$  ��5@      .��6>    5A      �� 5B      $	 
Horizontal=�5C      $��-2 0 0 0q�5D      .+�5E        $
 Phone=�5F      �� 5G      $��Số điện thoại��6(   5H      .��5I   6   5J      �� 5K      -   5         ��Name$ cbb_ChuyenMon��5Q       & "MaterialDesignFloatingHintComboBox#��[ 5L       .   SecondaryAccentBrush   UnderlineBrush# �  5N      .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Inverted=�5O      $ Chuyên môn��5P      $	��200��5Q      6   5R      #  MaterialDesignThemes.Wpf.Chip  5S      -   5          Name$ btn_CapNhat��5T   7   $	��112��5S   "   $��55,305,0,42q�6.   $��Cập nhật��5T        PrimaryHueDarkBrush   IconBackground# �  5U       ! PrimaryHueDarkForegroundBrush   IconForeground# �  5V         Icon 5W        5X      $	
 Add=�6.   
�������69   5Z        5[      -   5        $ 	btn_Thoat��5\   4   $	��112��5[   "   $��185,305,0,42q�6.   $��Thoát��5\      # �  5]      # �  5^       5_        5`      $

 Edit=�6.   
�������6:   5b      5c      5d      5e      
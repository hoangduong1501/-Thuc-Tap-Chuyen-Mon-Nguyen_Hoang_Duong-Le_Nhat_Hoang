   M S B A M L   `   `   `  ����H  DQuanLyHS_THPT, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:QuanLyHS_THPT.UserControls_UIQuanLyHS_THPT.UserControls_UI  5      ;    5QuanLyHS_THPT.UserControls_UI.ThongTinLop_UserControl   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      =local+clr-namespace:QuanLyHS_THPT.UserControls_UI     5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .��5
      � 
�������  � RowDefinitions  5   
   �� 5      $��45 �6   �� 5      $��* �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      �� -   5         ��Name$ 
cbb_NamHoc��5   :    &  "MaterialDesignFloatingHintComboBox#��[  5      .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton .   SecondaryAccentBrush   UnderlineBrush# �  5      .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Inverted=�5      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 
Năm Học��5       �� 
IsEditable . $	��100��5   #   $��	230,0,0,5q�6/   �� 5      -   5        $ cbb_KhoiLop��5   ;   #��[  5       . # �  5      $ Inverted=�5      $ Khối Lớp��5       . $	��100��5   #   $��50,0,0,5q�6/   5      � 5   
   $��1��6    � ColumnDefinitions 5       �� 5!      $	��230 �6#   �� 5"      $��* �6#   .+�5$      � .+�5%      �� $
��Auto=�6   .��5&      �� -   5        	 ��Name$	 Grid_ItemLop��5&   !   5)      5*      5+      � 5,      $��1��6   .+�5-      �� -   5        $��lvDanhSachHS��5-      
 �� View
 5.      �� 5/      .P�50      �� $	��Mã��6-    �� Width$ 70��69    �� DisplayMemberBinding 6D   �� *	maHocSinh+�� 51      $��	Họ tên��6-   $	 170��6=    6I   �� *
tenHocSinh+�� 52      $��Giới��6-   $ 60��6;    6F   �� *
gioiTinh+�� 53      $��
Ngày sinh��6-   $ 95��6@    6K   �� *
ngaySinh+�� 54      $��Địa chỉ��6-   $	 190��6>    6J   �� *diaChi+�� 55      $��
Dân tộc��6-   $ 90��6>    6I   �� *danToc+�� 56      $��
Tôn giáo��6-   $ 90��6?    6J   �� *	tonGiao+57       �� 
GroupStyle 5:      (  "System.Windows.Controls.GroupStyle  5;         HeaderTemplate 5<      �� 5=   "   .R�5>   &   �� $
��Bold"�60   $��14(�6B   ��6P   �� *Name+5?   #   5A      5C      5D      5E      5F      5G      
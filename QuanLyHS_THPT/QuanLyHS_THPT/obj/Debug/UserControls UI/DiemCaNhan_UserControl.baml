   M S B A M L   `   `   `  ����H  DQuanLyHS_THPT, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:QuanLyHS_THPT.UserControls_UIQuanLyHS_THPT.UserControls_UI  5      :    4QuanLyHS_THPT.UserControls_UI.DiemCaNhan_UserControl   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      =local+clr-namespace:QuanLyHS_THPT.UserControls_UI     5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .��5
      � 
�������  � RowDefinitions  5   
   �� 5      $��70 �6   �� 5      $��* �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      �� -   5         ��Name$ 
cbb_NamHoc��5      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 
Năm Học��5      $��90��6:    �� 
IsEditable . $��20,0,0,0q�5   #   �� 5      -   5        $ cbb_KhoiLop��5      $ Khối Lớp��5      $��90��6;    . $��20,0,0,0q�5   #   �� 5      -   5        $ 	cbb_HocKy��5      $ 
Học Kỳ��5      $��90��69    . $��20,0,0,0q�5   #   �� 5      -   5        $ 
cbb_LopHoc��5      $ Lớp Học��5      $��90��6:    . $��20,0,0,0q�5   #   �� 5      -   5        $ cbb_HocSinh��5      $ 
Học Sinh��5      $	��200��6;    . $��20,0,0,0q�5   #   �� 5      -   5         ��Name$ btn_HienThi��5      $��40,0,0,0q�6*    0  ,MaterialDesignFloatingActionMiniAccentButton#��[  5        � ToolTip$ Mở Bảng Điểm��5!      .��5"      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ CardSearchOutline=�6*   $��24��6C   $��24��6O   5#      �� 5$      -   5        $ btn_XuatExcel��5$      $��20,0,0,0q�6,   #��[  5%      $ Mở Bảng Điểm��5&      .��5'        $ MicrosoftExcel=�6*   $��24��6@   $��24��6L   5(      �� 5)      -   5        $ btn_XuatReport��5)      $��20,0,0,0q�6-   #��[  5*      $ Mở Bảng Điểm��5+      .��5,        $ 	FileChart=�6*   $��24��6;   $��24��6G   5-      5.      � 5/   
   $��1��6   .+�50      �� -	   5         ��Name$ lv_BangDiem��50      	 �� View	 51      �� 52      .P�53      �� $��
Môn học��6)   
 �� Width$	
 200��6:    �� DisplayMemberBinding 6F   �� *	ten_Mon+�� 54      $��Điểm miệng��6)   $	
 120��6=    6I   �� *
diem_Mieng+�� 55      $��15p L1��6)   $	
 100��69    6E   �� *
diem_151+�� 56      $��15p L2��6)   $	
 100��69    6E   �� *
diem_152+�� 57      $��15p L3��6)   $	
 100��69    6E   �� *
diem_153+�� 58      $��45p L1��6)   $	
 100��69    6E   �� *
diem_451+�� 59      $��45p L2��6)   $	
 100��69    6E   �� *
diem_452+�� 5:      $��Thi HK��6)   $	
 100��69    6E   �� *
diem_Thi+�� 5;      $��TB Môn��6)   $	
 100��69    6E   �� *
diem_TBM+5<      5C      5D      5E      5F      
   M S B A M L   `   `   `  ����H  DQuanLyHS_THPT, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:QuanLyHS_THPT.UserControls_UIQuanLyHS_THPT.UserControls_UI  5      6    0QuanLyHS_THPT.UserControls_UI.NamHoc_UserControl   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      =local+clr-namespace:QuanLyHS_THPT.UserControls_UI     5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .��5
      � 
�������  � ColumnDefinitions  5   
   �� 5      $	��460 �6   �� 5      $	��460 �6   .+�5   
   �  � RowDefinitions 5      �� 5      $��50 �6    �� 5      $��* �6    .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� -   5         ��Name$ 
txt_NamHoc��5   4   $��50,0,0,0q�5       %  !MaterialDesignFloatingHintTextBox#��[  5      $��Center=�5      .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton .    
SuffixText$  ��5      $	��180��5      .��6%   )  #MaterialDesignThemes.Wpf.HintAssist   Hint 5      �� 5      $ 
Horizontal=�5   !   $��-2 0 0 0q�5   !   .+�5      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ 	TimerSand=�5    %   �� 5!      $��
Năm học��6(   5"      .��5#   6   5$      #  MaterialDesignThemes.Wpf.Chip  5%      -   5          Name$ btn_ThemNamHoc��5&   $   $	��112��5%   &   $��30,0,0,0q�62   $��Thêm��5&        PrimaryHueDarkBrush	   IconBackground#	 �  5'       ! PrimaryHueDarkForegroundBrush
   IconForeground#
 �  5(         Icon 5)        5*      $	 Add=�62   
�������6=   5,      5-      � 5.      $��1��6   $
��Left=�6    $	��402��6;   $��
34,10,0,10q�6G   .+�5/      �� -   5        $��lvDS_NamHoc��5/       � 	Resources 50       �� 
TargetType �� Triggers P� Property P� Value �� Property �� Value��%�   '��       �� 51      " ��6     52      P� 53   "    �@J�IsKeyboardFocusWithin . . �54   &   ��  �@��
IsSelected . 6C   55   #   .�57      -   5        58      59       �� View 5:      �� 5;      .P�5<      �� $��Mã năm��6-    �� Width$	 150��6=    �� DisplayMemberBinding 6I   �� *	ma_NamHoc+�� 5=      $��	Tên năm��6-   $	 200��6>    6J   �� *
ten_NamHoc+�� 5>       �� CellTemplate 5?   "   �� 5@   &   .R�5A   *   ��  ��Name$ btn_Xoa��6H   -   5        $��23��5A   1   $��23��6<     MaterialDesignIconButton#��[ 5B   -   $��0q�6_    � ToolTip$
 Xóa��5C   -   .��5D   .     $ Delete=�6F   5E   +   5F   '   5H      5I      5K      5L      5M      � 5N   
   $��1��6    5O      �� 5P      $��50 �6    �� 5Q      $��* �6    .+�5S      �� $ 
Horizontal=�5T      .+�5U      �� $��50,0,0,0q�6   #��[  5V      $��Center=�5W       . $  ��5Y      $	��180��5Z      .��6%    5[      �� 5\      $ 
Horizontal=�5]   !   $��-2 0 0 0q�5^   !   .+�5_        $ 	TimerSand=�5`   %   �� 5a      $��
Học kỳ��6(   5b      .��5c   6   5d        5e      -   5        $ btn_ThemHocKy��5f   $   $	��112��5e   &   $��30,0,0,0q�62   $��Thêm��5f      #	 �  5g      #
 �  5h       5i        5j      $	 Add=�62   
�������6=   5l      5m      � 5n      $��1��6   $
��Left=�6    $	��402��6;   $��
34,10,0,10q�6G   .+�5o      �� -   5        $��
lvDS_HocKy��5o       5p      ��%�   '��       �� 5q      " ��6     5r      P� 5s   "    �@J�IsKeyboardFocusWithin . . �5t   &   ��  �@��
IsSelected . 6C   5u   #   .�5w      -   5        5x      5y       5z      �� 5{      .P�5|      �� $��Mã năm��6-   $ 80��6=    6H   �� *
ma_HocKy+�� 5}      $��	Tên năm��6-   $	 100��6>    6J   �� *	ten_HocKy+�� 5~      $��	Hệ số��6-   $ 80��6<    6G   �� *heSo+�� 5       5�   "   �� 5�   &   .R�5�   *   �� $ btn_Xoa��6H   -	   5        $��23��5�   1   $��23��6<   #��[ 5�   -   $��0q�6_   $
 Xóa��5�   -   .��5�   .     $ Delete=�6F   5�   +   5�   '   5�      5�      5�      5�      5�      5�      5�      
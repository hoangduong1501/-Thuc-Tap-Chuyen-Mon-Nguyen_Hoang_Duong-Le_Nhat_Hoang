   M S B A M L   `   `   `  ����H  DQuanLyHS_THPT, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:QuanLyHS_THPT.UserControls_UIQuanLyHS_THPT.UserControls_UI  5      >    8QuanLyHS_THPT.UserControls_UI.DanToc_TonGiao_UserControl   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      =local+clr-namespace:QuanLyHS_THPT.UserControls_UI     5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .��5
      � 
�������  � ColumnDefinitions  5   
   �� 5      $	��460 �6   �� 5      $	��460 �6   �� 5      $��* �6   .+�5   
   �  � RowDefinitions 5      �� 5      $��50 �6    �� 5      $��* �6    .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� -   5         ��Name$ 
txt_DanToc��5   4   $��50,0,0,0q�5       %  !MaterialDesignFloatingHintTextBox#��[  5      $��Center=�5      .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton .    
SuffixText$  ��5      $	��180��5      .��6%   )  #MaterialDesignThemes.Wpf.HintAssist   Hint 5      �� 5      $ 
Horizontal=�5   !   $��-2 0 0 0q�5   !   .+�5       '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ 	TimerSand=�5!   %   �� 5"      $��
Dân Tộc��6(   5#      .��5$   6   5%      #  MaterialDesignThemes.Wpf.Chip  5&      -   5          Name$ btn_ThemDanToc��5'   $   $	��112��5&   &   $��30,0,0,0q�62   $��Thêm��5'        PrimaryHueDarkBrush	   IconBackground#	 �  5(       ! PrimaryHueDarkForegroundBrush
   IconForeground#
 �  5)         Icon 5*        5+      $	 Add=�62   
�������6=   5-      5.      � 5/      $��1��6   $
��Left=�6    $	��402��6;   $��
34,10,0,10q�6G   .+�50      �� -   5        $��lvDS_DanToc��50       � 	Resources 51       �� 
TargetType �� Triggers P� Property P� Value �� Property �� Value��%�   '��       �� 52      " ��6     53      P� 54   "    �@J�IsKeyboardFocusWithin . . �55   &   ��  �@��
IsSelected . 6C   56   #   .�58      -   5        59      5:       �� View 5;      �� 5<      .P�5=      �� $��Mã Dân Tộc��6-    �� Width$ 80��6A    �� DisplayMemberBinding 6L   �� *	ma_DanToc+�� 5>      $��Tên Dân Tộc��6-   $	 200��6B    6N   �� *
ten_DanToc+�� 5?       �� CellTemplate 5@   "   �� 5A   &   .R�5B   *   ��  ��Name$ btn_Xoa_DanToc��6H   -   5        $��23��5B   1   $��23��6<     MaterialDesignIconButton#��[ 5C   -   $��0q�6_    � ToolTip$
 Xóa��5D   -   .��5E   .     $ Delete=�6F   5F   +   5G   '   5I      5J      5L      5M      5N      � 5O   
   $��1��6    5P      �� 5Q      $��50 �6    �� 5R      $��* �6    .+�5T      �� $ 
Horizontal=�5U      .+�5V      �� -   5        $ txt_TonGiao��5V      $��50,0,0,0q�6/   #��[  5W      $��Center=�5X       . $  ��5Z      $	��180��5[      .��6%    5\      �� 5]      $ 
Horizontal=�5^   !   $��-2 0 0 0q�5_   !   .+�5`        $ 	TimerSand=�5a   %   �� 5b      $��
Tôn Giáo��6(   5c      .��5d   6   5e        5f      -   5        $ btn_ThemTonGiao��5g   $   $	��112��5f   &   $��30,0,0,0q�62   $��Thêm��5g      #	 �  5h      #
 �  5i       5j        5k      $	 Add=�62   
�������6=   5m      5n      � 5o      $��1��6   $
��Left=�6    $	��402��6;   $��
34,10,0,10q�6G   .+�5p      �� -   5        $��lvDS_TonGiao��5p       5q      ��%�   '��       �� 5r      " ��6     5s      P� 5t   "    �@J�IsKeyboardFocusWithin . . �5u   &   ��  �@��
IsSelected . 6C   5v   #   .�5x      -	   5        5y      5z       5{      �� 5|      .P�5}      �� $��Mã Tôn Giáo��6-   $ 80��6B    6M   �� *
ma_TonGiao+�� 5~      $��Tên Tôn Giáo��6-   $	 200��6C    6O   �� *ten_TonGiao+�� 5�       5�   "   �� 5�   &   .R�5�   *   �� $ btn_Xoa_TonGiao��6H   -
   5        $��23��5�   1   $��23��6<   #��[ 5�   -   $��0q�6_   $
 Xóa��5�   -   .��5�   .     $ Delete=�6F   5�   +   5�   '   5�      5�      5�      5�      5�      5�      5�      
   M S B A M L   `   `   `  ����H  DQuanLyHS_THPT, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:QuanLyHS_THPTQuanLyHS_THPT  5   	       QuanLyHS_THPT.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:QuanLyHS_THPT     5   	   V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	     � Title$  Login��5	   	   $	��500��6   $	��350��6$    � 
ResizeMode$ NoResize=�5
   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	   $��Segoe UI Emoji)�5   	    � Icon$' !Icons/icons8_ios_photos_500px.png��6%   .��5      � .+�5   
   �� -   5        $	��280��5      $	��Top=�6!   ��5      �� 5       �� EndPoint$ 0.5,1&�6&    �� 
StartPoint$ 0.5,0&�67   .��5      �  � Color$ 	#FF2281D1��6#   � 5      $ 	#FF34268A��6#    � Offset$ 1Q�65   � 5      $ 	#FF33288B��6#   $ 0.546Q�65   5      5      �� 5   
   $	��280��6   $	��240��6    $��Bottom=�6-   $��0,110q�6H   	 �� RadiusY$	 10��6W   
 �� RadiusX$
 10��6d   
������� J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5         
BlurRadius$ 15Q�6#      	Direction$ 0Q�63      RenderingBias$ Quality=�6A      ShadowDepth$ 1Q�6Y      Color$ 	#FFBBBBBB��6i   5      � 5   
   $��Bottom=�6   $��35,110q�6*   $	��240��6:   .+�5      �� $��ĐĂNG NHẬP��6   $��Center=�6(   $	��Top=�6E   $��5q�6]   
�������$��18(�6z   �� 5       $��Center=�6   $��15q�64   .+�5!      �� -   5         ��Name$ txt_TenDangNhap��5"   N   $
��0,10q�5!      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tên đăng nhập��6(    %  !MaterialDesignFloatingHintTextBox#��[  6W   $��Champagne & Limousines)�5"      $��18(�6@   6N   G� 5#      -   5         G�Name$ txt_MatKhau��5$   N   $
��0,10q�5#      $ Mật khẩu��6,    ) %MaterialDesignFloatingHintPasswordBox#��[ 6V   $��Champagne & Limousines)�5$      $��18(�6@   6N   5%      5&      �� 5'   
   -   5        $	��150��5'      $��Center=�6   $��Bottom=�6:   $
��0,95q�6U   $��LOGIN��6c   6s   �� 5(   
   -   5         ��Name$ status��5(   w   $��Center=�6   $��Bottom=�61   $��60q�6L   
���  �� � Cursor$
 Hand��6i   6w   �� 5)   
   $'��!/Icons/icons8_male_user_128px.png��6   $	��100��6;   $	��100��6G   $	��Top=�6T   $��30q�6l   �� 5+   
   -   5        $��40��5+      $��40��6   $	��Top=�6(   $��Right=�6@   $��	0,10,10,0q�6\   $��0q�6o   $��0q�5,   '    � ToolTip$ Thoát��6S   ��6   Z� .��5-      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Power=�6&   $��Center=�63   
�������$��35��6a   $��35��6m   5.      �� 5/   
   -   5        $��40��5/      $��40��6   $	��Top=�6(   $��Right=�6@   $��	0,10,50,0q�6\   $��0q�6o   $��0q�50   '   $ 	Thu nhỏ��6V   ��6   Z� .��51        $ ArrowBottomLeft=�6&   $��Center=�6=   
�������$��35��6k   $��35��6w   52      �� 53   
   -   5        $��40��53      $��40��6   $	��Top=�6(   $��Right=�6@   $��	0,10,90,0q�6\   $��0q�6o   $��0q�54   '   $&  Thay đổi Cơ sở dữ liệu��6N   ��6   Z� .��55        $ DatabaseSearch=�6&   $��Center=�6<   
�������$��35��6j   $��35��6v   56      �� 58   
   $��Liên kết sản phẩm��6   $��Center=�6-   $��Bottom=�6J   $��86,0,168,16q�6e   
�������$
 Hand��6�   �� 59   
   $��Center=�6   $��Bottom=�6.   $��20��6I   $��20��6T   $��Impact)�6`   $��18(�6t   ���	#FF3D56AC���	#FF3D56AC$��0q�6�   $��190,0,140,16q�6�   .��5:        $ Facebook=�6&   $��Center=�66   
�������$��18��6d   $��18��6o   5;      �� 5<   
   $��Center=�6   $��Bottom=�6.   $��20��6I   $��20��6T   $��Impact)�6`   $��18(�6t   ���	#FFE05959���	#FFE05959$��0q�6�   $��216,0,114,16q�6�   .��5=        $ 
GooglePlus=�6&   $��Center=�68   
�������$��18��6f   $��18��6q   5>      �� 5?   
   $��Center=�6   $��Bottom=�6.   $��20��6I   $��20��6T   $��Impact)�6`   $��18(�6t   ���#33298C���#33298C$��0q�6�   $��241,0,89,16q�6�   .��5@        $ Github=�6&   $��Center=�64   
�������$��18��6b   $��18��6m   5A      5B      5C      
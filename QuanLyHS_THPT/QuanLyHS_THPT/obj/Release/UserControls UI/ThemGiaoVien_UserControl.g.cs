﻿#pragma checksum "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "0ABD8A31FFEAE69FEE2867206B6059A1C6419D87104527D6757D3534EB939ED8"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Converters;
using MaterialDesignThemes.Wpf.Transitions;
using QuanLyHS_THPT.UserControls_UI;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace QuanLyHS_THPT.UserControls_UI {
    
    
    /// <summary>
    /// ThemGiaoVien_UserControl
    /// </summary>
    public partial class ThemGiaoVien_UserControl : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector, System.Windows.Markup.IStyleConnector {
        
        
        #line 12 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal MaterialDesignThemes.Wpf.Chip btn_Them;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox txt_TimKiem;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView lvDS_GiaoVien;
        
        #line default
        #line hidden
        
        
        #line 97 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbb_NamHoc;
        
        #line default
        #line hidden
        
        
        #line 105 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbb_Lop;
        
        #line default
        #line hidden
        
        
        #line 113 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbb_Mon;
        
        #line default
        #line hidden
        
        
        #line 121 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbb_GiaoVien;
        
        #line default
        #line hidden
        
        
        #line 131 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal MaterialDesignThemes.Wpf.Chip btn_PhanCong;
        
        #line default
        #line hidden
        
        
        #line 140 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView lvDS_PhanCong;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/QuanLyHS_THPT;component/usercontrols%20ui/themgiaovien_usercontrol.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.btn_Them = ((MaterialDesignThemes.Wpf.Chip)(target));
            
            #line 12 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
            this.btn_Them.Click += new System.Windows.RoutedEventHandler(this.Chip_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.txt_TimKiem = ((System.Windows.Controls.TextBox)(target));
            
            #line 20 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
            this.txt_TimKiem.KeyDown += new System.Windows.Input.KeyEventHandler(this.TextBox_KeyDown);
            
            #line default
            #line hidden
            return;
            case 3:
            this.lvDS_GiaoVien = ((System.Windows.Controls.ListView)(target));
            return;
            case 7:
            this.cbb_NamHoc = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 8:
            this.cbb_Lop = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 9:
            this.cbb_Mon = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 10:
            this.cbb_GiaoVien = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 11:
            this.btn_PhanCong = ((MaterialDesignThemes.Wpf.Chip)(target));
            
            #line 131 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
            this.btn_PhanCong.Click += new System.Windows.RoutedEventHandler(this.Chip_Click);
            
            #line default
            #line hidden
            return;
            case 12:
            this.lvDS_PhanCong = ((System.Windows.Controls.ListView)(target));
            return;
            }
            this._contentLoaded = true;
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        void System.Windows.Markup.IStyleConnector.Connect(int connectionId, object target) {
            System.Windows.EventSetter eventSetter;
            switch (connectionId)
            {
            case 4:
            eventSetter = new System.Windows.EventSetter();
            eventSetter.Event = System.Windows.UIElement.PreviewGotKeyboardFocusEvent;
            
            #line 41 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
            eventSetter.Handler = new System.Windows.Input.KeyboardFocusChangedEventHandler(this.SelectCurrentItem);
            
            #line default
            #line hidden
            ((System.Windows.Style)(target)).Setters.Add(eventSetter);
            break;
            case 5:
            
            #line 54 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Click);
            
            #line default
            #line hidden
            break;
            case 6:
            
            #line 65 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Click);
            
            #line default
            #line hidden
            break;
            case 13:
            
            #line 161 "..\..\..\UserControls UI\ThemGiaoVien_UserControl.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Click);
            
            #line default
            #line hidden
            break;
            }
        }
    }
}

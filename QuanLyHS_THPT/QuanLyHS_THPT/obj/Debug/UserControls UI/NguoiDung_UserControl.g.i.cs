﻿#pragma checksum "..\..\..\UserControls UI\NguoiDung_UserControl.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "5B2354D73BA4BCFFEC5DAFF43909CB58874B6E4108D355E7F4E20214E67DB0B3"
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
    /// NguoiDung_UserControl
    /// </summary>
    public partial class NguoiDung_UserControl : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 21 "..\..\..\UserControls UI\NguoiDung_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.RadioButton btn_GiaoVien;
        
        #line default
        #line hidden
        
        
        #line 25 "..\..\..\UserControls UI\NguoiDung_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.RadioButton btn_TaiKhoan;
        
        #line default
        #line hidden
        
        
        #line 27 "..\..\..\UserControls UI\NguoiDung_UserControl.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid Grid_Person;
        
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
            System.Uri resourceLocater = new System.Uri("/QuanLyHS_THPT;component/usercontrols%20ui/nguoidung_usercontrol.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\UserControls UI\NguoiDung_UserControl.xaml"
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
            this.btn_GiaoVien = ((System.Windows.Controls.RadioButton)(target));
            
            #line 21 "..\..\..\UserControls UI\NguoiDung_UserControl.xaml"
            this.btn_GiaoVien.Click += new System.Windows.RoutedEventHandler(this.btn_TaiKhoan_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.btn_TaiKhoan = ((System.Windows.Controls.RadioButton)(target));
            
            #line 25 "..\..\..\UserControls UI\NguoiDung_UserControl.xaml"
            this.btn_TaiKhoan.Click += new System.Windows.RoutedEventHandler(this.btn_TaiKhoan_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.Grid_Person = ((System.Windows.Controls.Grid)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}


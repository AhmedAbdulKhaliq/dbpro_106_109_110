//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IMS.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class StudentEnrollment
    {
        public Nullable<System.DateTime> DateOfEnrollment { get; set; }
        public int CourseId { get; set; }
        public string StudentId { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Course Course { get; set; }
    }
}
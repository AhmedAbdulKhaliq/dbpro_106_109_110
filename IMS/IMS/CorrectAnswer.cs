//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IMS
{
    using System;
    using System.Collections.Generic;
    
    public partial class CorrectAnswer
    {
        public int QuestionId { get; set; }
        public int AnswerId { get; set; }
        public int Id { get; set; }
    
        public virtual Answer Answer { get; set; }
        public virtual Question Question { get; set; }
    }
}

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Barber.Repository.Dal
{
    using System;
    using System.Collections.Generic;
    
    public partial class Resource2Service
    {
        public int ID { get; set; }
        public int ServiceID { get; set; }
        public int ResourceHistoryID { get; set; }
        public double Quantity { get; set; }
        public string Description { get; set; }
        public bool IsHidden { get; set; }
    
        public virtual ResourceHistory ResourceHistory { get; set; }
        public virtual Service Service { get; set; }
    }
}

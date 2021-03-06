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
    
    public partial class Resource
    {
        public Resource()
        {
            this.ResourceHistory1 = new HashSet<ResourceHistory>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public int CurrentResourceHistoryID { get; set; }
        public double QuantityForPrice { get; set; }
        public string Description { get; set; }
        public byte[] TimesStamp { get; set; }
        public bool IsHidden { get; set; }
        public int QuantityTypeID { get; set; }
    
        public virtual QuantityType QuantityType { get; set; }
        public virtual ResourceHistory ResourceHistory { get; set; }
        public virtual ICollection<ResourceHistory> ResourceHistory1 { get; set; }
    }
}

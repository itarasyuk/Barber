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
    
    public partial class Client
    {
        public Client()
        {
            this.Calendar = new HashSet<Calendar>();
            this.Visit = new HashSet<Visit>();
        }
    
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Description { get; set; }
        public bool IsHidden { get; set; }
    
        public virtual ICollection<Calendar> Calendar { get; set; }
        public virtual ICollection<Visit> Visit { get; set; }
    }
}

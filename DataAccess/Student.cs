//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Student
    {
        public Student()
        {
            this.Ozviats = new HashSet<Ozviat>();
        }
    
        public int StuID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public long StudentCode { get; set; }
        public Nullable<int> SGarde { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public Nullable<int> FatherID { get; set; }
        public Nullable<int> MotherID { get; set; }
        public Nullable<long> NationalCode { get; set; }
        public Nullable<long> IdentityCode { get; set; }
        public string BirthDate { get; set; }
        public string BirthLocation { get; set; }
        public string Address { get; set; }
        public string RegisterLocation { get; set; }
        public string PhoneNumber { get; set; }
        public string PreviousSchool { get; set; }
        public string ArgentPhoneNumber { get; set; }
        public string Ilneses { get; set; }
        public Nullable<bool> Hand { get; set; }
        public string Sarparast { get; set; }
        public string Image { get; set; }
        public string CodeRahgiri { get; set; }
        public string Description { get; set; }
        public string ParentUser { get; set; }
        public string ParentPass { get; set; }
    
        public virtual Father Father { get; set; }
        public virtual Mother Mother { get; set; }
        public virtual ICollection<Ozviat> Ozviats { get; set; }
    }
}
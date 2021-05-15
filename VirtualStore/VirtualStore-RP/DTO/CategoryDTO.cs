using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualStore_RP.DTO
{
    public class CategoryDTO
    {
        private int id;
        private string name, description;

        public int Id { get => id; set => id = value; }
        public string Description { get => description; set => description = value; }

        public string Name
        {
            set
            {
                if (value != string.Empty)
                {
                    this.name = value;
                }
                else
                {
                    throw new Exception("Campo nome obrigatório");
                }
            }
            get { return this.name; }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualStore_RP.DTO
{
    public class ProviderDTO
    {
        private int id;
        private string name, cnpj, email, phone, representativeName, representativePhone;

        public int Id { get => id; set => id = value; }

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

        public string Cnpj
        {
            set
            {
                if (value != string.Empty)
                {
                    this.cnpj = value;
                }
                else
                {
                    throw new Exception("Campo CNPJ obrigatório");
                }
            }
            get { return this.cnpj; }
        }

        public string Email
        {
            set
            {
                if (value != string.Empty)
                {
                    this.email = value;
                }
                else
                {
                    throw new Exception("Campo E-mail obrigatório");
                }
            }
            get { return this.email; }
        }

        public string Phone
        {
            set
            {
                if (value != string.Empty)
                {
                    this.phone = value;
                }
                else
                {
                    throw new Exception("Campo telefone obrigatório");
                }
            }
            get { return this.phone; }
        }
        public string RepresentativeName
        {
            set
            {
                if (value != string.Empty)
                {
                    this.representativeName = value;
                }
                else
                {
                    throw new Exception("Campo nome do representante obrigatório");
                }
            }
            get { return this.representativeName; }
        }

        public string RepresentativePhone
        {
            set
            {
                if (value != string.Empty)
                {
                    this.representativePhone = value;
                }
                else
                {
                    throw new Exception("Campo telefone do representante obrigatório");
                }
            }
            get { return this.representativePhone; }
        }
    }
}
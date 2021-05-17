using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualStore_RP.DTO
{
    public class ClientDTO
    {
        private int id;
        private string name, type, cpf, phone, email, password;

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

        public string Type
        {
            set
            {
                if (value != string.Empty)
                {
                    this.type = value;
                }
                else
                {
                    throw new Exception("Campo tipo obrigatório");
                }
            }
            get { return this.type; }
        }

        public string Cpf
        {
            set
            {
                if (value != string.Empty)
                {
                    this.cpf = value;
                }
                else
                {
                    throw new Exception("Campo CPF obrigatório");
                }
            }
            get { return this.cpf; }
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
                    throw new Exception("Campo email obrigatório");
                }
            }
            get { return this.email; }
        }

        public string Password
        {
            set
            {
                if (value != string.Empty)
                {
                    this.password = value;
                }
                else
                {
                    throw new Exception("Campo senha obrigatório");
                }
            }
            get { return this.password; }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualStore_RP.DTO
{
    public class AddressDTO
    {
        private int id, clientID;
        private string street, number, neighborhood, city, cep;

        public int Id { get => id; set => id = value; }

        public int ClientID
        {
            set
            {
                if (value != 0)
                {
                    this.clientID = value;
                }
                else
                {
                    throw new Exception("Campo cliente obrigatório");
                }
            }
            get { return this.clientID; }
        }

        public string Street
        {
            set
            {
                if (value != string.Empty)
                {
                    this.street = value;
                }
                else
                {
                    throw new Exception("Campo rua obrigatório");
                }
            }
            get { return this.street; }
        }

        public string Number
        {
            set
            {
                if (value != string.Empty)
                {
                    this.number = value;
                }
                else
                {
                    throw new Exception("Campo número obrigatório");
                }
            }
            get { return this.number; }
        }

        public string Neighborhood
        {
            set
            {
                if (value != string.Empty)
                {
                    this.neighborhood = value;
                }
                else
                {
                    throw new Exception("Campo bairro obrigatório");
                }
            }
            get { return this.neighborhood; }
        }

        public string City
        {
            set
            {
                if (value != string.Empty)
                {
                    this.city = value;
                }
                else
                {
                    throw new Exception("Campo cidade obrigatório");
                }
            }
            get { return this.city; }
        }

        public string Cep
        {
            set
            {
                if (value != string.Empty)
                {
                    this.cep = value;
                }
                else
                {
                    throw new Exception("Campo CEP obrigatório");
                }
            }
            get { return this.cep; }
        }
    }
}
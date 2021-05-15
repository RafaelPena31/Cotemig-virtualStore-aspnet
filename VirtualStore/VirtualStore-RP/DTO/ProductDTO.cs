using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualStore_RP
{
    public class ProductDTO
    {
        private int id, stockQuantity, categoryID, providerID;
        private string name, description, photo;
        private double productValue;

        public int Id { get => id; set => id = value; }
        public string Photo { get => photo; set => photo = value; }

        public string Name
        {
            set
            {
                if (value != string.Empty)
                {
                    this.name = value;
                } else
                {
                    throw new Exception("Campo nome obrigatório");
                }
            }
            get { return this.name; }
        }

        public string Description
        {
            set {
                if (value != string.Empty)
                {
                    this.description = value;
                }
                else
                {
                    throw new Exception("Campo descrição obrigatório!");
                }
            }
            get { return this.description; }
        }

        public int StockQuantify
        {
            set { 
                if (value != 0)
                {
                    this.stockQuantity = value;
                }
                else
                {
                    throw new Exception("Campo de quantidade de estoque obrigatório!");
                }
            }
            get { return this.stockQuantity; }
        }

        public int CategoryID
        {
            set { 
                if (value != 0)
                {
                    this.categoryID = value;
                } else
                {
                    throw new Exception("Campo categoria obrigatório!");
                }
            }
            get { return this.categoryID; }
        }

        public int ProviderID
        {
            set
            {
                if (value != 0)
                {
                    this.providerID = value;
                }
                else
                {
                    throw new Exception("Campo fornecedor obrigatório!");
                }
            }
            get { return this.providerID; }
        }

        public double ProductValue
        {
            set
            {
                if (value != 0)
                {
                    this.productValue = value;
                }
                else
                {
                    throw new Exception("Campo valor do produto obrigatório!");
                }
            }
            get { return this.productValue; }
        }

    }
}
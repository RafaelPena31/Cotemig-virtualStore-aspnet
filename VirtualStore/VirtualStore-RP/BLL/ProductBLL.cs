using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace VirtualStore_RP.BLL
{
    public class ProductBLL
    {
        private MySqlDAL connection = new MySqlDAL();

        public void Insert(ProductDTO product)
        {
            string sql = string.Format($@"INSERT INTO product VALUES(NULL,'{product.Name}', '{product.Description}', '{product.ProductValue}', '{product.StockQuantify}', '{product.Photo}', '{product.ProviderID}', '{product.CategoryID}');");
            connection.ExecutionSQL(sql);
        }

        public void Delete(ProductDTO product)
        {
            string sql = string.Format($@"DELETE FROM product WHERE id = '{product.Id}';");
            connection.ExecutionSQL(sql);
        }

        public void Update(ProductDTO product)
        {
            string sql = string.Format($@"UPDATE product SET name='{product.Name}',description='{product.Description}',value='{product.ProductValue}',stockQuantity='{product.StockQuantify}',photo='{product.Photo}', provider_id='{product.ProviderID}', category_id='{product.CategoryID}' WHERE id = '{product.Id}';");
            connection.ExecutionSQL(sql);
        }

        public DataTable ConsultId(int Id)
        {
            string sql = string.Format($@"SELECT * FROM product WHERE id = '{Id}';");
            return connection.QueryExecution(sql);
        }
        
        public DataTable SearchProducts(string conditional)
        {
            string sql = string.Format($@"SELECT pt.id, pt.name, pt.description, pt.value, pr.namePro, c.nameCat, pt.photo, pt.stockQuantity FROM product as pt, category as c, provider as pr WHERE pt.category_id = c.id and pt.provider_id = pr.id and {conditional} ORDER BY pt.id;");
            return connection.QueryExecution(sql);
        }
    }
}
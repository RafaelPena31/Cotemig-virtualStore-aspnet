using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using VirtualStore_RP.DTO;

namespace VirtualStore_RP.BLL
{
    public class CategoryBLL
    {
        private MySqlDAL connection = new MySqlDAL();

        public void Insert(CategoryDTO category)
        {
            string sql = string.Format($@"INSERT INTO category VALUES(NULL, '{category.Name}', '{category.Description}');");
            connection.ExecutionSQL(sql);
        }

        public void Delete(int id)
        {
            string sql = string.Format($@"DELETE FROM category WHERE id = '{id}';");
            connection.ExecutionSQL(sql);
        }

        public void Update(CategoryDTO category)
        {
            string sql = string.Format($@"UPDATE category SET name='{category.Name}', description='{category.Description}' WHERE id = '{category.Id}';");
            connection.ExecutionSQL(sql);
        }

        public DataTable ConsultID(int id)
        {
            string sql = string.Format($@"SELECT * FROM category WHERE id = '{id}';");
            return connection.QueryExecution(sql);
        }

        public DataTable SearchClient(string conditional)
        {
            string sql = string.Format($@"SELECT c.name, c.description FROM category as c, address as a WHERE a.category_id = c.id and '{conditional}' ORDER BY c.id;");
            return connection.QueryExecution(sql);
        }
    }
}
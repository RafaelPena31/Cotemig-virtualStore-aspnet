using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using VirtualStore_RP.DTO;

namespace VirtualStore_RP.BLL
{
    public class AddressBLL
    {
        private MySqlDAL connection = new MySqlDAL();

        public void Insert(AddressDTO address)
        {
            string sql = string.Format($@"INSERT INTO address VALUES(NULL, '{address.Street}', '{address.Number}', '{address.Neighborhood}', '{address.City}', '{address.Cep}');");
            connection.ExecutionSQL(sql);
        }

        public void Delete(int id)
        {
            string sql = string.Format($@"DELETE FROM address WHERE id = '{id}';");
            connection.ExecutionSQL(sql);
        }

        public void Update(AddressDTO address)
        {
            string sql = string.Format($@"UPDATE address SET street='{address.Street}', number='{address.Number}', neighborhood='{address.Neighborhood}', city='{address.City}', cep='{address.Cep}' WHERE id = '{address.Id}';");
            connection.ExecutionSQL(sql);
        }

        public DataTable ConsultID(int id)
        {
            string sql = string.Format($@"SELECT * FROM address WHERE id = '{id}';");
            return connection.QueryExecution(sql);
        }
    }
}
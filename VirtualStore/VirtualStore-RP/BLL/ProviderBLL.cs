using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using VirtualStore_RP.DTO;

namespace VirtualStore_RP.BLL
{
    public class ProviderBLL
    {
        private MySqlDAL connection = new MySqlDAL();

        public void Insert(ProviderDTO provider)
        {
            string sql = string.Format($@"INSERT INTO provider VALUES(NULL, '{provider.Name}', '{provider.Cnpj}', '{provider.Email}', '{provider.Phone}', '{provider.RepresentativeName}', '{provider.RepresentativePhone}');");
            connection.ExecutionSQL(sql);
        }

        public void Delete(int id)
        {
            string sql = string.Format($@"DELETE FROM provider WHERE id = '{id}';");
            connection.ExecutionSQL(sql);
        }

        public void Update(ProviderDTO provider)
        {
            string sql = string.Format($@"UPDATE provider SET name='{provider.Name}', cnpj='{provider.Cnpj}', email='{provider.Email}', phone='{provider.Phone}', representativeName='{provider.RepresentativeName}', representativePhone='{provider.RepresentativePhone}' WHERE id = '{provider.Id}';");
            connection.ExecutionSQL(sql);
        }
        public string ReturnID(string email)
        {
            string sql = string.Format($@"SELECT id FROM provider WHERE email = '{email}';");
            DataTable dt = connection.QueryExecution(sql);
            if (dt.Rows.Count == 1)
            {
                Console.WriteLine(dt.Rows[0]["id"].ToString());
                return dt.Rows[0]["id"].ToString();
            }
            else
            {
                return "NOT_FOUND";
            }
        }

        public DataTable ConsultID(int id)
        {
            string sql = string.Format($@"SELECT * FROM provider WHERE id = '{id}';");
            return connection.QueryExecution(sql);
        }
        public DataTable GetProvider()
        {
            string sql = string.Format($@"SELECT * FROM provider;");
            return connection.QueryExecution(sql);
        }

        public DataTable SearchProvider(string conditional)
        {
            string sql = string.Format($@"SELECT p.id, p.name, p.cnpj, p.email, p.phone, p.representativeName, p.representativePhone FROM provider as p WHERE {conditional} ORDER BY p.id;");
            return connection.QueryExecution(sql);
        }
    }
}
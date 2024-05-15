using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeSystem
{
    public class Cookbook
    {
        public static DataTable Load(int cookbookid)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("CookbookGet");
            SQLUtility.SetParamValue(cmd, "@CookbookId", cookbookid);
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static DataTable LoadCookbookRecipeByCookbookId(int cookbookid)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("CookbookRecipeGet");
            //SQLUtility.SetParamValue(cmd, "@CookbookId", cookbookid);
            cmd.Parameters["@CookbookId"].Value = cookbookid;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static DataTable AutoCreateCookbook(int usernameid)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("CookbookCreate");
            SQLUtility.SetParamValue(cmd, "@UsernameId", usernameid);
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static void Delete(DataTable dtcookbook)
        {
            int id = (int)dtcookbook.Rows[0]["CookbookId"];
            SqlCommand cmd = SQLUtility.GetSQLCommand("CookbookDelete");
            SQLUtility.SetParamValue(cmd, "@CookbookId", id);
            SQLUtility.ExecuteSQL(cmd);
        }
        public static void Save(DataTable dtcookbook)
        {
            if (dtcookbook.Rows.Count == 0)
            {
                throw new Exception("Cannot call Cookbook save method because there are no rows in the table.");
            }
            DataRow r = dtcookbook.Rows[0];
            //yf added false
            SQLUtility.SaveDataRow(r, "CookbookUpdate");
        }
        public static void SaveCookbookRecipe(DataTable dt, int cookbookid)
        {
            foreach (DataRow r in dt.Select("", "", DataViewRowState.Added))
            {
                r["CookbookId"] = cookbookid;
            }
            SQLUtility.SaveDataTable(dt, "CookbookRecipeUpdate");
        }
        public static void DeleteCookbookRecipe(int cookbookrecipeid)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand("CookbookRecipeDelete");
            //cmd.Parameters["@CookbookRecipeId"].Value = cookbookrecipeid;
            SQLUtility.SetParamValue(cmd, "@CookbookRecipeId", cookbookrecipeid);
            SQLUtility.ExecuteSQL(cmd);
        }
        public static DataTable GetUsernameList()
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("UsernameGet");
            SQLUtility.SetParamValue(cmd, "@All", 1);
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
    }
}

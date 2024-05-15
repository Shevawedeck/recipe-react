using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeSystem
{
    public class Recipe
    {
        public static DataTable SearchRecipes(string recipename)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("RecipeSearch");
            SQLUtility.SetParamValue(cmd, "@RecipeName", recipename);
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }

        public static DataTable Load(int recipeid)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("RecipeGet");
            SQLUtility.SetParamValue(cmd, "@RecipeId", recipeid);
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static DataTable CloneAndGetDT(int recipeid)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("RecipeClone");
            SQLUtility.SetParamValue(cmd, "@RecipeId", recipeid);
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static DataTable GetCuisineList()
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("CuisineGet");
            SQLUtility.SetParamValue(cmd, "@All", 1);
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static DataTable GetUsernameList()
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("UsernameGet");
            SQLUtility.SetParamValue(cmd, "@All", 1);
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static void Save(DataTable dtrecipe)
        {
            if(dtrecipe.Rows.Count == 0)
            {
                throw new Exception("Cannot call Recipe save method because there are no rows in the table.");
            }
            DataRow r = dtrecipe.Rows[0];
            SQLUtility.SaveDataRow(r, "RecipeUpdate");
        }
        public static void SaveDate(DataTable dtrecipe)
        {
            if (dtrecipe.Rows.Count == 0)
            {
                throw new Exception("Cannot call Recipe save date method because there are no rows in the table.");
            }
            DataRow r = dtrecipe.Rows[0];
            SQLUtility.SaveDataRow(r, "RecipeDateUpdate");
        }
        public static void SaveDateDraft(DataTable dtrecipe)
        {
            if (dtrecipe.Rows.Count == 0)
            {
                throw new Exception("Cannot call Recipe save date method because there are no rows in the table.");
            }
            DataRow r = dtrecipe.Rows[0];
            SQLUtility.SaveDataRow(r, "RecipeDraft");
        }
        public static void Delete(DataTable dtrecipe)
        {
            int id = (int)dtrecipe.Rows[0]["RecipeId"];
            SqlCommand cmd = SQLUtility.GetSQLCommand("RecipeDelete");
            SQLUtility.SetParamValue(cmd, "@RecipeId", id);
            SQLUtility.ExecuteSQL(cmd);
        }
    }
}

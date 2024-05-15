using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeSystem
{
    public class BizIngredient: BizObject<BizIngredient>
    {
        private int _ingredientid;
        private string _ingredientname = "";
        
        public List<BizIngredient> Search(string ingredientnameval)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand(this.GetSprocName);
            SQLUtility.SetParamValue(cmd, "IngredientName", ingredientnameval);
            DataTable dt = SQLUtility.GetDataTable(cmd);
            return this.GetListFromDataTable(dt);
        }
        public int IngredientId
        {
            get { return _ingredientid;}
            set
            {
                if( _ingredientid != value)
                {
                    _ingredientid = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string IngredientName
        {
            get { return _ingredientname; }
            set
            {
                if (_ingredientname != value)
                {
                    _ingredientname = value;
                    InvokePropertyChanged();
                }
            }
        }
    }
}

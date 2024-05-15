using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeSystem
{
    public class BizRecipe:BizObject<BizRecipe>
    {
        public BizRecipe() 
        {

        }
        private int _recipeId;
        private int _usernameId;
        private int _cuisineId;
        private string _recipename = "";
        private int _calories;
        private DateTime _datedrafted;
        private DateTime? _datepublished;
        private DateTime? _datearchived;
        private string _vegan = "";
        private string _recipestatus = "";
        private string _usernamename = "";
        private string _cuisinetype = "";
        private int _numingredients;
        private string _recipeimage = "";

        public List<BizRecipe> SearchByCookbook(string cookbookname)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand("CookbookRecipeSearch");
            SQLUtility.SetParamValue(cmd, "@CookbookName", cookbookname);
            DataTable dt = SQLUtility.GetDataTable(cmd);
            return this.GetListFromDataTable(dt);
        }
        public List<BizRecipe> SearchByCuisine(string cuisinetype)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand("CuisineRecipeSearch");
            SQLUtility.SetParamValue(cmd, "@CuisineType", cuisinetype);
            DataTable dt = SQLUtility.GetDataTable(cmd);
            return this.GetListFromDataTable(dt);
        }
        public int RecipeId
        {
            get { return _recipeId; }
            set
            {
                if (_recipeId != value)
                {
                    _recipeId = value;
                    InvokePropertyChanged();
                }
            }
        }

        public int UsernameId
        {
            get { return _usernameId; }
            set
            {
                if (_usernameId != value)
                {
                    _usernameId = value;
                    InvokePropertyChanged();
                }
            }
        }

        public int CuisineId
        {
            get { return _cuisineId; }
            set
            {
                if (_cuisineId != value)
                {
                    _cuisineId = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string RecipeName
        {
            get { return _recipename; }
            set
            {
                if (_recipename != value)
                {
                    _recipename = value;
                    InvokePropertyChanged();
                }
            }
        }
        public int Calories
        {
            get { return _calories; }
            set
            {
                if (_calories != value)
                {
                    _calories = value;
                    InvokePropertyChanged();
                }
            }
        }
        public DateTime DateDrafted
        {
            get { return _datedrafted; }
            set
            {
                if (_datedrafted != value)
                {
                    _datedrafted = value;
                    InvokePropertyChanged();
                }
            }
        }
        public DateTime? DatePublished
        {
            get { return _datepublished; }
            set
            {
                if (_datepublished != value)
                {
                    _datepublished = value;
                    InvokePropertyChanged();
                }
            }
        }
        public DateTime? DateArchived
        {
            get { return _datearchived; }
            set
            {
                if (_datearchived != value)
                {
                    _datearchived = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string Vegan
        {
            get { return _vegan; }
            set
            {
                if (_vegan != value)
                {
                    _vegan = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string RecipeStatus
        {
            get { return _recipestatus; }
            set
            {
                if (_recipestatus != value)
                {
                    _recipestatus = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string UsernameName
        {
            get { return _usernamename; }
            set
            {
                if (_usernamename != value)
                {
                    _usernamename = value;
                    InvokePropertyChanged();
                }
            }
        }
        public int NumIngredients
        {
            get { return _numingredients; }
            set
            {
                if (_numingredients != value)
                {
                    _numingredients = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string RecipeImage
        {
            get { return _recipeimage; }
            set
            {
                if (_recipeimage != value)
                {
                    _recipeimage = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string CuisineType
        {
            get { return _cuisinetype; }
            set
            {
                if (_cuisinetype != value)
                {
                    _cuisinetype = value;
                    InvokePropertyChanged();
                }
            }
        }
    }
}

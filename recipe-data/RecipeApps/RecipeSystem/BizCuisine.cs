using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeSystem
{
    public class BizCuisine:BizObject<BizCuisine>
    {
        public BizCuisine() 
        {
        }
        private int _cuisineId;
        private string _cuisinetype = "";
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

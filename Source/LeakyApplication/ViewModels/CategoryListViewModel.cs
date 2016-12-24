using System.Collections.Generic;
using System.Linq;
using System.Windows.Input;
using LeakyApplication.Models;

namespace LeakyApplication.ViewModels
{
    public class CategoryListViewModel
    {
        public IEnumerable<CategoryListItemViewModel> Categories { get; private set; }

        public CategoryListViewModel()
        {
            Categories = DataFactory.GetCategories().Select(c => new CategoryListItemViewModel(c));
        }
    }

    public class CategoryListItemViewModel
    {
        private readonly Category _category;

        public string Name
        {
            get { return _category.Name; }
        }

        public int ItemCount
        {
            get { return _category.Items.Count; }
        }

        public CategoryListItemViewModel(Category category)
        {
            _category = category;
        }
    }
}

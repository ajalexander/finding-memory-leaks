using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Linq;
using LeakyApplication.Models;

namespace LeakyApplication.ViewModels
{
    public class CategoryListViewModel : ObservableObject
    {
        public IEnumerable<CategoryListItemViewModel> Categories { get; private set; }

        public CategoryListViewModel()
        {
            Categories = DataFactory.GetCategories().Select(c => new CategoryListItemViewModel(c));
        }
    }

    public class CategoryListItemViewModel : ObservableObject
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

            category.PropertyChanged += CategoryOnPropertyChanged;
            category.Items.CollectionChanged += ItemsOnCollectionChanged;
        }

        private void CategoryOnPropertyChanged(object sender, PropertyChangedEventArgs propertyChangedEventArgs)
        {
            RaiseEvent("Name");
        }

        private void ItemsOnCollectionChanged(object sender, NotifyCollectionChangedEventArgs notifyCollectionChangedEventArgs)
        {
            RaiseEvent("ItemCount");
        }
    }
}

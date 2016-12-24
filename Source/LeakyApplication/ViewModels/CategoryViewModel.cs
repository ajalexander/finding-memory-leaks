using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Windows.Input;
using LeakyApplication.Models;
using LeakyApplication.Utilities;

namespace LeakyApplication.ViewModels
{
    public class CategoryViewModel : ObservableObject
    {
        public ObservableCollection<Category> Categories { get; private set; }

        private Category _category;

        public Category Category
        {
            get { return _category; }
            set
            {
                _category = value;

                SelectCategoryActivities();
                
                RaiseEvent("Category");
            }
        }

        private void SelectCategoryActivities()
        {
            if (null != Category)
            {
                _category.Items.CollectionChanged += ItemsOnCollectionChanged;
            }

            RaiseEvent("CategorySelected");
            RaiseEvent("Name");
            RaiseEvent("Items");
            RaiseEvent("ItemCount");
        }

        public bool CategorySelected
        {
            get { return null != Category; }
        }

        public string Name
        {
            get
            {
                if (null == Category)
                    return null;

                return Category.Name;
            }
            set
            {
                Category.Name = value;
                RaiseEvent("Name");
            }
        }

        public int ItemCount
        {
            get
            {
                if (null == Category)
                    return 0;

                return Category.Items.Count;
            }
        }

        public IEnumerable<string> Items
        {
            get
            {
                if (null == Category)
                    return new string[0];

                return Category.Items.Select(item => item.Name);
            }
        }

        public ICommand NewCategoryCommand { get; private set; }

        public ICommand RemoveCategoryCommand { get; private set; }

        public ICommand AddItemCommand { get; private set; }

        private string _newItem;

        public string NewItem
        {
            get { return _newItem; }
            set
            {
                _newItem = value;
                RaiseEvent("NewItem");
            }
        }

        public CategoryViewModel()
        {
            Categories = new ObservableCollection<Category>(DataFactory.GetCategories());

            AddItemCommand = new RelayCommand(AddItem);
            NewCategoryCommand = new RelayCommand(NewCategory);
            RemoveCategoryCommand = new RelayCommand(RemoveCategory);
        }

        private void NewCategory(object obj)
        {
            var newCategory =new Category
            {
                Name = "New Category"
            };

            DataFactory.AddCategory(newCategory);

            Categories.Add(newCategory);
            Category = newCategory;
        }

        private void RemoveCategory(object obj)
        {
            if (null == Category)
                return;

            DataFactory.RemoveCategory(Category);

            Categories.Remove(Category);
            Category = null;
        }

        private void AddItem(object parameter)
        {
            Category.Items.Add(new CategoryItem
            {
                Name = NewItem
            });
            NewItem = null;

            RaiseEvent("Items");
        }

        private void ItemsOnCollectionChanged(object sender, NotifyCollectionChangedEventArgs notifyCollectionChangedEventArgs)
        {
            RaiseEvent("ItemCount");
        }
    }
}
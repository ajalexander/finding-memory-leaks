using System.Collections.Generic;
using System.Linq;

namespace LeakyApplication.Models
{
    public static class DataFactory
    {
        private static readonly List<Category> Categories;

        static DataFactory()
        {
            Categories = new List<Category>();

            Categories.Add(new Category
            {
                Name = "Books",
                Items =
                {
                    new CategoryItem { Name = "The Brothers Karamozov" },
                    new CategoryItem { Name = "War and Peace" },
                    new CategoryItem { Name = "A Tale of Two Cities" }
                }
            });

            Categories.Add(new Category
            {
                Name = "Movies",
                Items =
                {
                    new CategoryItem { Name = "Casablanca" },
                    new CategoryItem { Name = "The Bishop's Wife" }
                }
            });

            Categories.Add(new Category
            {
                Name = "Newspapers"
            });
        }

        public static IEnumerable<Category> GetCategories()
        {
            return Categories;
        } 

        public static Category GetCategory(string name)
        {
            return Categories.Single(cat => cat.Name == name);
        }

        public static void AddCategory(Category category)
        {
            Categories.Add(category);
        }

        public static void RemoveCategory(Category category)
        {
            Categories.Remove(category);
        }
    }
}

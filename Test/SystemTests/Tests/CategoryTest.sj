//USEUNIT Application
//USEUNIT AssertionHelper

var window = app.Windows.Main;
var listPage = window.Pages.List;
var editPage = window.Pages.Edit;

function Main()
{
    app.Start();

    ShowsInitialItems();
    ShowExistingCategory();
    AddNewItem();
    AddNewCategory();
    RemoveCategory();
    ShowUpdatedItemsInList();

    app.Close();
}

function ShowsInitialItems()
{
    Assert.AreEqual(3, listPage.CategoryItems().Items.Count);

    Assert.AreEqual("Books", listPage.Name(1));
    Assert.AreEqual("Items: 3", listPage.ItemCount(1));
}

function ShowExistingCategory()
{
    window.ShowEditView();

    editPage.SelectCategory("Books");

    Assert.AreEqual("Books", editPage.Name().Text);
    Assert.AreEqual("Items: 3", editPage.ItemCount().Text);
}

function AddNewItem()
{
    editPage.AddItem("Anna Karenina");

    Assert.AreEqual("Items: 4", editPage.ItemCount().Text);
    Assert.AreEqual("", editPage.NewItemName().Text);
}

function AddNewCategory()
{
    editPage.AddCategory();
    editPage.Name().Text = "";
    editPage.Name().Keys("Music");

    editPage.AddItem("Mozart");

    Assert.AreEqual("Items: 1", editPage.ItemCount().Text);
}

function RemoveCategory()
{
    editPage.SelectCategory("Newspapers");
    editPage.RemoveCategory();
}

function ShowUpdatedItemsInList()
{
    window.ShowList();

    Assert.AreEqual(3, listPage.CategoryItems().Items.Count);

    Assert.AreEqual("Music", listPage.Name(3));
    Assert.AreEqual("Items: 1", listPage.ItemCount(3));
}
//USEUNIT Application

var loopsToRun = 25;

var window = app.Windows.Main;
var listPage = window.Pages.List;
var editPage = window.Pages.Edit;

function Main()
{
    app.Start();

    WaitForProfilerStart();
    RunLoops();
    WaitForProfilerStop();

    app.Close();
}

function WaitForProfilerStart()
{
    BuiltIn.ShowMessage("Attach the memory profiler to process (PID " + app.Process().Id + ") and take the initial snapshot");
}

function WaitForProfilerStop()
{
    BuiltIn.ShowMessage("Use the profiler to take another snapshot");
}

function RunLoops()
{
    for (var i = 0; i < loopsToRun; i++)
    {
        Indicator.PushText("Loop #" + (1 + i) + " (of " + loopsToRun + ")");

        RunOneLoop();

        Indicator.PopText();
    }
}

function RunOneLoop()
{
    AddCategory();
    ShowList();
    RemoveCategory();
    ShowList();
}

function ShowList()
{
    window.ShowList();
}

function AddCategory()
{
    window.ShowEditView();

    editPage.AddCategory();
    editPage.Name().Text = "";
    editPage.Name().Keys("Testing");

    editPage.AddItem("Item 1");
    editPage.AddItem("Item 2");
    editPage.AddItem("Item 3");
}

function RemoveCategory()
{
    window.ShowEditView();

    editPage.SelectCategory("Testing");

    editPage.RemoveCategory();
}

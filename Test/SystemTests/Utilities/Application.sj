//USEUNIT MainWindow

// Initialize the application
var app = new Init();

// Expose the windows as variables
var mainWindow = app.Windows.Main;

function Init()
{
    var process = null;

    this.Start = function()
    {
        while(this.Process().Exists)
            this.Process().Close();
        TestedApps.LeakyApplication.Run(1, true);
    }

    this.Close = function ()
    {
        this.Windows.Main.Close();
    }

    this.Process = function()
    {
        if (process == null || !process.Exists)
        {
            process = Sys.WaitProcess("LeakyApplication");
        }
        return process;
    }

    this.Windows =
    {
        Main: new MainWindow.Init(this)
    };
}

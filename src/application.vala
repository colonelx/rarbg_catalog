
using Gtk;


public class AppBootstrap : GLib.Object {
  public AppBootstrap () {
    new RootController ();
  }
  public static int main(string[] args)
	{
		Gtk.init(ref args);
		new AppBootstrap ();
		Gtk.main();
	 	return 0;
  }
}

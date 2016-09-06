
using Gtk;
namespace VM {
   public class Root : Object {
     Statusbar sbar;
     uint c_id;
      public Root () {
        try {
          var builder = new Builder ();
          builder.add_from_file ("src/view/root.glade");
          
          var window = builder.get_object ("root_window") as Window;
          
          builder.connect_signals(this);
          
          window.destroy.connect (Gtk.main_quit);
          sbar = builder.get_object ("statusBar") as Statusbar;
          c_id = sbar.get_context_id ("root");
          
          sbar.push(c_id, "Initializing Window");
          sbar.push(c_id, "Ready");
          
          window.show_all ();    
          stdout.printf ("Context_id = %u", c_id);
        } catch(Error e) {
          stderr.printf("Could not load UI: %s\n", e.message);
        }
      }
      
      [CCode (cname="G_MODULE_EXPORT on_refreshBtn_clicked")]
      public void on_refreshBtn_clicked (Button source) {
        sbar.push(c_id, "Quit");
        var cc = sbar.get_context_id ("root");
        stdout.printf ("Context_id = %u", cc);
        
      }
      [CCode (cname="G_MODULE_EXPORT on_quitBtn_clicked")]
      public void on_quitBtn_clicked (Button source) {
        try {
          //this.statusbar.push(1, "Quit");
           stdout.printf ("Context_id = %u", c_id);
        } catch(Error e) {
          stderr.printf("Could not load UI: %s\n", e.message);
        }
          Gtk.main_quit();
      }
      
     
   }
}
class RootView : GLib.Object {
  public RootView () {
    this._initWindow();
  }
  
  private void _initWindow()
  {
    
         new VM.Root();
    
  }
 
}

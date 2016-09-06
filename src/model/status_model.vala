
using GLib;

public class StatusModel : Object {

    private static GLib.Once<StatusModel> _instance;

    private static int _id = 0;

    public static unowned StatusModel instance () {
        return _instance.once (() => { return new StatusModel (); });
    }
    
    public static int getNextId() {
      _id++;
      return _id;
    }
}

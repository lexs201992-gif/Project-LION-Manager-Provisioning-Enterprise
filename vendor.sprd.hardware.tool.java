package vendor.sprd.hardware.tool;
import java.lang.String;
import android.os.RemoteException;
import android.os.IBinder;
import vendor.sprd.hardware.tool.IToolCallback;

private static class IToolControl$Stub$Proxy extends Object
{
/*
 * Field Definitions.
 */
      private String mCachedHash;
      private int mCachedVersion;
      private IBinder mRemote;
/*
 * Declared Constructors.
 */
     IToolControl$Stub$Proxy(IBinder) { ... }
    public IBinder asBinder() { ... }
    public String getInterfaceDescriptor() { ... }
    public synchronized String getInterfaceHash()  throws RemoteException{ ... }
    public int getInterfaceVersion()  throws RemoteException{ ... }
    public String getProp(String, int)  throws RemoteException{ ... }
    public String getSdPath()  throws RemoteException{ ... }
    public String getSdState()  throws RemoteException{ ... }
    public String isSupportFM()  throws RemoteException{ ... }
    public String readDev(String)  throws RemoteException{ ... }
    public String readSysDev(String)  throws RemoteException{ ... }
    public String runCmd(String)  throws RemoteException{ ... }
    public String runCmdForResult(String)  throws RemoteException{ ... }
    public String sendAtCmd(int, String)  throws RemoteException{ ... }
    public String sendCmd(String, String)  throws RemoteException{ ... }
    public String sendCommand(String, String)  throws RemoteException{ ... }
    public void setCallback(IToolCallback)  throws RemoteException{ ... }
    public String setProp(String, String, int)  throws RemoteException{ ... }
    public String writeDev(String, String)  throws RemoteException{ ... }
    public String writeSysDev(String, String)  throws RemoteException{ ... }

}

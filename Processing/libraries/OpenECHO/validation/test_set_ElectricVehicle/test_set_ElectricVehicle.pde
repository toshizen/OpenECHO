import com.sonycsl.echo.Echo;
import com.sonycsl.echo.EchoProperty;
import com.sonycsl.echo.eoj.EchoObject;
import com.sonycsl.echo.eoj.device.DeviceObject;
import com.sonycsl.echo.eoj.profile.NodeProfile;
import com.sonycsl.echo.eoj.device.housingfacilities.ElectricVehicle ;

import com.sonycsl.echo.processing.defaults.DefaultNodeProfile;
import com.sonycsl.echo.processing.defaults.DefaultController;


void setup(){
  try {
    Echo.start( new DefaultNodeProfile(),new DeviceObject[]{new DefaultController()});

    // 全ての自動車充放電器のOff
    ElectricVehicle.setG().reqSetOperationStatus(new byte[]{0x31}).send();

    // 車両接続確認
    ElectricVehicle.setG().reqSetVehicleConnectConfirmation(new byte[]{0x10}).send();

  } catch( IOException e){ 
    e.printStackTrace();
  }
  println("Started") ;
}

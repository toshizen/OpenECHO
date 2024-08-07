// 電力量センサーは分電盤だけではなく、そのものずばりの電力量センサ
// というクラスもあります。そこから電力量を取得してみましょう。

import com.sonycsl.echo.Echo;
import com.sonycsl.echo.EchoProperty;
import com.sonycsl.echo.node.EchoNode;
import com.sonycsl.echo.eoj.EchoObject;
import com.sonycsl.echo.eoj.device.DeviceObject;
import com.sonycsl.echo.eoj.profile.NodeProfile;
import com.sonycsl.echo.eoj.device.housingfacilities.SmartElectricEnergyMeter;

import com.sonycsl.echo.processing.defaults.DefaultNodeProfile;
import com.sonycsl.echo.processing.defaults.DefaultController;

// Unsigned byte to int
int bti(byte[] b) {
  int ret = 0 ;
  for ( int bi=0;bi<b.length;++bi ) ret = (ret<<8)|(int)(b[bi]&0xff) ;
  return ret ;
}

void setup() {
  Echo.addEventListener(new Echo.EventListener() {
    public void onNewSmartElectricEnergyMeter (SmartElectricEnergyMeter device) {
      println( "SmartElectricEnergyMeter sensor found.") ;
      device.setReceiver( new SmartElectricEnergyMeter.Receiver() {
        protected void onGetMeasuredInstantaneousElectricEnergy (EchoObject eoj, short tid, byte esv, 
                                                      EchoProperty property, boolean success) {
          super.onGetMeasuredInstantaneousElectricEnergy(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetMeasuredInstantaneousElectricEnergy" ) ; 
            return ;
          } 
          println("Integral electric energy : "+bti(property.edt)+"A") ;
        }

        protected void onGetMeasuredInstantaneousVoltages (EchoObject eoj, short tid, byte esv,
                                                                              EchoProperty property, boolean success) {
          super.onGetMeasuredInstantaneousVoltages(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetMeasuredInstantaneousVoltagess" ) ; 
            return ;
          } 
          println("TODO modify Instantaneous Voltages : "+((bti(property.edt)-0x8001)-3276.7)+"DATE:Time:Volt") ;
        }
        protected void onGetCumulativeAmountsOfElectricEnergyMeasuredAtFixedTimeNormalDirection (EchoObject eoj, short tid, byte esv, 
                                                                    EchoProperty property, boolean success) {
          super.onGetCumulativeAmountsOfElectricEnergyMeasuredAtFixedTimeNormalDirection(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call reqGetCumulativeAmountsOfElectricEnergyMeasuredAtFixedTimeNormalDirection" ) ; 
            return ;
          } 
          println("TODO modify onGetCumulativeAmountsOfElectricEnergyMeasuredAtFixedTimeNormalDirection : ") ;
          byte[] a = new byte[4] ;
          for ( int i=0;i<property.edt.length;++i ) {
            System.arraycopy(property.edt, i*4, a, 0, 4) ;
            println(i+": "+(0.001*bti(a))+"kWh") ;
          }
        }
        protected void onGetCumulativeAmountsOfElectricEnergyMeasuredAtFixedTimeReverseDirection(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetCumulativeAmountsOfElectricEnergyMeasuredAtFixedTimeReverseDirection(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetCumulativeAmountsOfElectricEnergyMeasuredAtFixedTimeReverseDirection" ) ; 
            return ;
          } 
          println("TODO modify Cumulative Amounts of Electric Energy : "+bti(property.edt)+"V") ;
        }
      }
      ) ;

      try {
        device.get().reqGetMeasuredInstantaneousElectricEnergy().reqGetMeasuredInstantaneousCurrents()
          .reqGetMeasuredInstantaneousVoltages().reqGetCumulativeAmountsOfElectricEnergyMeasuredAtFixedTimeNormalDirection()
          .reqGetCumulativeAmountsOfElectricEnergyMeasuredAtFixedTimeReverseDirection().send();
      } 
      catch(IOException e) {
        e.printStackTrace();
      } 
    }
  }) ;

  try {
    Echo.start( new DefaultNodeProfile(), new DeviceObject[] {
      new DefaultController()
    });
    NodeProfile.getG().reqGetSelfNodeInstanceListS().send();
  } 
  catch( IOException e) { 
    e.printStackTrace();
  }

  println("Started") ;
  
//  while (true) {
//    try {
//      // ノードに機器オブジェクトのリストを要求します。
//      NodeProfile.getG().reqGetSelfNodeInstanceListS().send();
//
//      // すべてのノード
//      EchoNode[] nodes = Echo.getNodes() ;
//      // 自分のノード
//      EchoNode local = Echo.getSelfNode() ;
//
//      for ( EchoNode en : nodes ) {
//        if ( en == local ) {
//          println("Node id = " + en.getAddress().getHostAddress() + "(local)");
//        }
//        else {
//          println("Node id = " + en.getAddress().getHostAddress());
//        }
//
//        println(" Node Profile = " + en.getNodeProfile());
//
//        println(" Devices:");
//        DeviceObject[] dos = en.getDevices();
//
//        for ( DeviceObject d : dos ) {
//          println("  " + d);
//        }
//        println("----");
//      }
//      println("--------");
//    } 
//    catch( IOException e) { 
//      e.printStackTrace();
//    }
//
//    // 10秒待つ
//    try { 
//      Thread.sleep(10000);
//    } 
//    catch (InterruptedException e) { 
//      e.printStackTrace();
//    }
//  }  
  
}

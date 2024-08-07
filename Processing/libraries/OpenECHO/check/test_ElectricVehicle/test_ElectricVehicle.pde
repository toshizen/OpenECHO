// 電力量センサーは分電盤だけではなく、そのものずばりの電力量センサ
// というクラスもあります。そこから電力量を取得してみましょう。

import com.sonycsl.echo.Echo;
import com.sonycsl.echo.EchoProperty;
import com.sonycsl.echo.node.EchoNode;
import com.sonycsl.echo.eoj.EchoObject;
import com.sonycsl.echo.eoj.device.DeviceObject;
import com.sonycsl.echo.eoj.profile.NodeProfile;
import com.sonycsl.echo.eoj.device.housingfacilities.ElectricVehicle;

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
    public void onNewElectricVehicle (ElectricVehicle device) {
      String ecc = String.format("0x0%X", device.ECHO_CLASS_CODE);
      println(ecc+" , ElectricVehicle") ;
      device.setReceiver( new ElectricVehicle.Receiver() {
        protected void onGetV2hStoredElectricity1(EchoObject eoj, short tid, byte esv, 
                                                      EchoProperty property, boolean success) {
          super.onGetV2hStoredElectricity1(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "!error onGetV2hStoredElectricity1" ) ; 
            return ;
          }
          println("C0 , "+bti(property.edt)+" , onGetV2hStoredElectricity1 ") ;
        }
        protected void onGetV2hStoredElectricity2(EchoObject eoj, short tid, byte esv, 
                                                      EchoProperty property, boolean success) {
          super.onGetV2hStoredElectricity2(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "!error onGetV2hStoredElectricity2" ) ; 
            return ;
          }
          println("C1 , "+bti(property.edt)+" , onGetV2hStoredElectricity2") ;
        }
        protected void onGetV2hRemainingAvailableCapacity1(EchoObject eoj, short tid, byte esv,
                                                                              EchoProperty property, boolean success) {
          super.onGetV2hRemainingAvailableCapacity1(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "!error onGetV2hRemainingAvailableCapacity1" ) ; 
            return ;
          } 
          println("C2 , "+((bti(property.edt)))+" , onGetV2hRemainingAvailableCapacity1") ;
        }
        protected void onGetV2hRemainingAvailableCapacity2(EchoObject eoj, short tid, byte esv,
                                                                              EchoProperty property, boolean success) {
          super.onGetV2hRemainingAvailableCapacity2(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "!error onGetV2hRemainingAvailableCapacity2" ) ; 
            return ;
          } 
          println("C3 , "+((bti(property.edt)))+" , onGetV2hRemainingAvailableCapacity2") ;
        }
        protected void onGetV2hRemainingAvailableCapacity3(EchoObject eoj, short tid, byte esv,
                                                                              EchoProperty property, boolean success) {
          super.onGetV2hRemainingAvailableCapacity3(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "!error onGetV2hRemainingAvailableCapacity3" ) ; 
            return ;
          } 
          println("C4 , "+((bti(property.edt)))+" , onGetV2hRemainingAvailableCapacity3") ;
        }
        protected void onGetRatedChargeCapacity(EchoObject eoj, short tid, byte esv, 
                                                                    EchoProperty property, boolean success) {
          super.onGetRatedChargeCapacity(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "!error onGetRatedChargeCapacity" ) ; 
            return ;
          } 
          println("C5 , "+((bti(property.edt)))+" , onGetRatedChargeCapacity") ;
        }
        protected void onGetRatedDischargeCapacity(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetRatedDischargeCapacity(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetRatedDischargeCapacity" ) ; 
            return ;
          } 
          println("C6 , "+bti(property.edt)+" , onGetRatedDischargeCapacity") ;
        }
        protected void onGetChargeableDischargeAbleStatus(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetChargeableDischargeAbleStatus(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetChargeableDischargeAbleStatus" ) ; 
            return ;
          } 
          println("C7 , "+bti(property.edt)+" , onGetChargeableDischargeAbleStatus") ;
        }
        protected void onGetMinimumMaximumChargeElectricEnergy(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetMinimumMaximumChargeElectricEnergy(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetMinimumMaximumChargeElectricEnergy" ) ; 
            return ;
          } 
          println("C8 , "+bti(property.edt)+" , onGetMinimumMaximumChargeElectricEnergy") ;
        }
        protected void onGetMinimumMaximumDischargeElectricEnergy(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetMinimumMaximumDischargeElectricEnergy(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetMinimumMaximumDischargeElectricEnergy" ) ; 
            return ;
          } 
          println("C9 , "+bti(property.edt)+" , onGetMinimumMaximumDischargeElectricEnergy") ;
          // EPC Nothing  
          println("CC , - , nothing");
          println("CD , - , nothing");
          println("CE , - , nothing");
          println("CF , - , nothing");
        }
        protected void onGetMinimumMaximumChargeCurrent(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetMinimumMaximumChargeCurrent(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetMinimumMaximumChargeCurrent" ) ; 
            return ;
          } 
          println("CA , "+bti(property.edt)+" , onGetMinimumMaximumChargeCurrent") ;
        }
        protected void onGetMinimumMaximumDischargeCurrent(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetMinimumMaximumDischargeCurrent(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetMinimumMaximumDischargeCurrent" ) ; 
            return ;
          } 
          println("CB ,"+bti(property.edt)+", onGetMinimumMaximumDischargeCurrent") ;
        }
        protected void onGetUsedCapacity1(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetUsedCapacity1(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetUsedCapacity1" ) ; 
            return ;
          } 
          println("D0 , "+bti(property.edt)+" , onGetUsedCapacity1") ;
        }
        protected void onGetUsedCapacity2(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetUsedCapacity2(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetUsedCapacity2" ) ; 
            return ;
          } 
          println("D1 , "+bti(property.edt)+" , onGetUsedCapacity2") ;
        }
        protected void onGetRatedVoltage(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetRatedVoltage(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetRatedVoltage" ) ; 
            return ;
          } 
          println("D2 , "+bti(property.edt)+" , onGetRatedVoltage") ;
        }
        protected void onGetMeasuredInstantaneousChargeDischargeElectricEnergy(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetMeasuredInstantaneousChargeDischargeElectricEnergy(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetMeasuredInstantaneousChargeDischargeElectricEnergy" ) ; 
            return ;
          } 
          println("D3 , "+bti(property.edt)+" , onGetMeasuredInstantaneousChargeDischargeElectricEnergy") ;
        } 
  
        protected void onGetMeasuredInstantaneousChargeDischargeCurrent(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetMeasuredInstantaneousChargeDischargeVoltage(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetMeasuredInstantaneousChargeDischargeVoltage" ) ; 
            return ;
          } 
          println("D5 , "+bti(property.edt)+" , onGetMeasuredInstantaneousChargeDischargeVoltage") ;
        }
        protected void onGetMeasuredCumulativeDischargeElectricEnergy(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetMeasuredCumulativeDischargeElectricEnergy(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetMeasuredCumulativeDischargeElectricEnergy" ) ; 
            return ;
          } 
          println("D6 , "+bti(property.edt)+" , onGetMeasuredCumulativeDischargeElectricEnergy") ;
        }
        protected void onGetCumulativeDischargeElectricEnergyResetSetting(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetCumulativeDischargeElectricEnergyResetSetting(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetCumulativeDischargeElectricEnergyResetSetting" ) ; 
            return ;
          }
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetCumulativeDischargeElectricEnergyResetSetting") ;
        } 
        protected void onGetMeasuredCumulativeChargeElectricEnergy(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetMeasuredCumulativeChargeElectricEnergy(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetMeasuredCumulativeChargeElectricEnergy" ) ; 
            return ;
          }
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetMeasuredCumulativeChargeElectricEnergy") ;
        }
        protected void onGetCumulativeChargeElectricEnergyResetSetting(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetCumulativeChargeElectricEnergyResetSetting(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetCumulativeChargeElectricEnergyResetSetting" ) ; 
            return ;
          }
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetCumulativeChargeElectricEnergyResetSetting") ;
        } 
        protected void onGetOperationModeSetting(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetOperationModeSetting(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetOperationModeSetting" ) ; 
            return ;
          }
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetOperationModeSetting") ;
        }
        protected void onGetSystemInterconnecteDType(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetSystemInterconnecteDType(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetSystemInterconnecteDType" ) ; 
            return ;
          }
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetSystemInterconnecteDType") ;
          println("DC , - , nothing") ;
          println("DD , - , nothing") ;
        }
        protected void onGetRemainingBatteryCapacity1(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetRemainingBatteryCapacity1(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetRemainingBatteryCapacity1" ) ; 
            return ;
          }
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetRemainingBatteryCapacity1") ;
        }
        protected void onGetRemainingBatteryCapacity2(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetRemainingBatteryCapacity2(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetRemainingBatteryCapacity2" ) ; 
            return ;
          }
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetRemainingBatteryCapacity2") ;
        }
        protected void onGetRemainingBatteryCapacity3(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetRemainingBatteryCapacity3(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetRemainingBatteryCapacity3" ) ; 
            return ;
          } 
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetRemainingBatteryCapacity3") ;
          // Nothing 
          println("E6 , - , nothing") ;
        }
        protected void onGetDischargingAmountSetting2(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetDischargingAmountSetting2(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetDischargingAmountSetting2" ) ; 
            return ;
          } 
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetDischargingAmountSetting2") ;
        }
        protected void onGetChargeElectricEnergySetting(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetChargeElectricEnergySetting(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetChargeElectricEnergySetting" ) ; 
            return ;
          } 
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetChargeElectricEnergySetting") ;
        }
        protected void onGetDischargeElectricEnergySetting(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onGetDischargeElectricEnergySetting(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onGetDischargeElectricEnergySetting" ) ; 
            return ;
          } 
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onGetDischargeElectricEnergySetting") ;
        }
        protected void onSetOperationModeSetting(EchoObject eoj, short tid, byte esv, 
                                                     EchoProperty property, boolean success) {
          super.onSetOperationModeSetting(eoj, tid, esv, property, success) ;
          if ( !success ) { 
            println( "error in call onSetOperationModeSetting" ) ; 
            return ;
          } 
          String epc = String.format("%X", property.epc);
          println(epc+" , "+bti(property.edt)+" , onSetOperationModeSetting") ;
        }         
      }
      ) ;

      try {
        ElectricVehicle.setG().reqSetOperationModeSetting(new byte[]{0x41}).send();
      } catch( IOException e){ 
        e.printStackTrace();
      }
      try {
        device.get()
          .reqGetV2hStoredElectricity1().reqGetV2hRemainingAvailableCapacity1()
          .reqGetRatedChargeCapacity().reqGetRatedDischargeCapacity()
          .reqGetChargeableDischargeAbleStatus().reqGetMinimumMaximumChargeElectricEnergy().reqGetMinimumMaximumDischargeElectricEnergy()
          .reqGetUsedCapacity1()
          .reqGetMeasuredInstantaneousChargeDischargeElectricEnergy()
          .reqGetMeasuredCumulativeDischargeElectricEnergy().reqGetMeasuredCumulativeChargeElectricEnergy()
          .reqGetOperationModeSetting().reqGetSystemInterconnecteDType()
          .reqGetRemainingBatteryCapacity1().reqGetRemainingBatteryCapacity3()
          .reqGetChargeElectricEnergySetting().reqGetDischargeElectricEnergySetting().send();
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

}

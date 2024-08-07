package com.sonycsl.echo.eoj.device.housingfacilities;

import com.sonycsl.echo.EchoProperty;
import com.sonycsl.echo.eoj.device.DeviceObject;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.junit.jupiter.api.Assertions.*;

class ElectricVehicleTest {

    private ElectricVehicle electricVehicle;

    @BeforeEach
    void setUp() {
        electricVehicle = Mockito.mock(ElectricVehicle.class, Mockito.CALLS_REAL_METHODS);
    }

    @Test
    void testSetupPropertyMaps() {
        electricVehicle.setupPropertyMaps();
        
        // Verify that the correct properties were added
        Mockito.verify(electricVehicle).addStatusChangeAnnouncementProperty(ElectricVehicle.EPC_OPERATION_STATUS);
        Mockito.verify(electricVehicle).removeSetProperty(ElectricVehicle.EPC_OPERATION_STATUS);
        Mockito.verify(electricVehicle).addGetProperty(ElectricVehicle.EPC_OPERATION_STATUS);
        Mockito.verify(electricVehicle).addGetProperty(ElectricVehicle.EPC_V2H_STORED_ELECTRICITY1);
        Mockito.verify(electricVehicle).addGetProperty(ElectricVehicle.EPC_V2H_STORED_ELECTRICITY2);
    }
}

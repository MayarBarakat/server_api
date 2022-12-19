package com.example.server_api;

import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

import com.pax.api.BaseSystemException;
import com.pax.api.BaseSystemManager;
import com.pax.api.PortException;
import com.pax.api.PortManager;
import com.pax.dal.IDAL;
import com.pax.dal.entity.EM1KeyType;
import com.pax.dal.entity.PiccCardInfo;
import com.pax.dal.exceptions.PiccDevException;
import com.pax.neptunelite.api.NeptuneLiteUser;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    static final String NATIVE_CHANNEL = "server_api/native";
    private MethodChannel channel;
    IDAL idal;
    byte b[];
    PiccPax piccPax;
    private EM1KeyType m1KeyType = EM1KeyType.TYPE_A;

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        BinaryMessenger messenger = flutterEngine.getDartExecutor().getBinaryMessenger();
        channel = new MethodChannel(messenger, NATIVE_CHANNEL);
        channel.setMethodCallHandler(
                ((call, result) -> {
                    if (call.method.equals("sdkInit")) {
                        sdkInit(result);
                        result.success(" Finish");
                    } else if (call.method.equals("readRFID")) {
                        piccPax = new PiccPax(MainActivity.this);
                        readRFID(result);

                    } else if (call.method.equals("sendCommand")) {

                        try {
                            sendCommand(result);
                        } catch (PortException | BaseSystemException e) {
                            e.printStackTrace();
                        }

                    } else if (call.method.equals("receiveCommand")) {

                        try {
                            receiveCommand(result);
                        } catch (PortException | BaseSystemException e) {
                            e.printStackTrace();
                        }

                    } else {
                        result.notImplemented();

                    }
                })
        );
    }

    private void receiveCommand(MethodChannel.Result result) throws PortException, BaseSystemException {
        String receivedData = new String(PortManager.getInstance().portRecvs((byte) 0x00, 10, 3000));
        if (receivedData.length() != 0) {
            BaseSystemManager.getInstance().beep();
            result.success(receivedData);
        }
    }


    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    private void sendCommand(MethodChannel.Result result) throws PortException, BaseSystemException {

        byte[] receive;
        PortManager.getInstance().portOpen((byte) 0x00, "9600,8,n,1");

        PortManager.getInstance().portSends((byte) 0x00, b);
        receive = PortManager.getInstance().portRecvs((byte) 0x00, 20, 100);
//        BaseSystemManager.getInstance().beep();
        String newString = new String(receive);

        if (newString.length() != 0) {
            newString = newString.substring(6, 12) + " %" + "\n";

            Log.d("Hardware", newString);
        }
        result.success(newString);

    }

    String convert(byte[] data) {
        StringBuilder sb = new StringBuilder(data.length);
        for (int i = 0; i < data.length; ++i) {
            if (data[i] < 0) throw new IllegalArgumentException();
            sb.append((char) data[i]);
        }
        return sb.toString();
    }

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    private void readRFID(MethodChannel.Result result) {
        try {
            piccPax.open();
            piccPax.setOnReadCardListenerCallBack(new ReadCardListenerCallBack() {
                @Override
                public void onSuccess(PiccCardInfo piccCardInfo) {
                    try {

                        BaseSystemManager.getInstance().beep();
                        result.success(HexStringHandler.bytesToHex(piccCardInfo.getSerialInfo()));

                    } catch (BaseSystemException e) {
                        e.printStackTrace();
                    }
                }

                @Override
                public void onException(Exception e) {
                    result.success(e
                            .getMessage());
                }

                @Override
                public void onTimeOut() {
                    result.success("TimeOut");

                }
            }, 10000);
        } catch (PiccDevException e) {
            e.printStackTrace();
        }

    }

    private void sdkInit(MethodChannel.Result result) {

        try {
            idal = NeptuneLiteUser.getInstance().getDal(getApplicationContext());
            b = new byte[10];
            b[0] = 0x24;
            b[1] = 0x21;
            b[2] = 0x44;
            b[3] = 0x4F;
            b[4] = 0x30;
            b[5] = 0x31;
            b[6] = 0x33;
            b[7] = 0x39;
            b[8] = 0x0D;
            b[9] = 0x0A;

        } catch (Exception e) {
            e.printStackTrace();
        }
//        idal.getSys().beep(EBeepMode.FREQUENCE_LEVEL_6,500);

    }


}

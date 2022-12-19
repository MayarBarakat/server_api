package com.example.server_api;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import com.pax.api.PiccException;
import com.pax.api.PiccManager;
import com.pax.dal.IPicc;
import com.pax.dal.entity.ApduRespInfo;
import com.pax.dal.entity.ApduSendInfo;
import com.pax.dal.entity.EDetectMode;
import com.pax.dal.entity.EM1KeyType;
import com.pax.dal.entity.EM1OperateType;
import com.pax.dal.entity.EPiccRemoveMode;
import com.pax.dal.entity.EUartPort;
import com.pax.dal.entity.PiccCardInfo;
import com.pax.dal.entity.PiccPara;
import com.pax.dal.exceptions.PiccDevException;

public class PiccPax implements IPicc {
    private PiccManager piccManager;
    private boolean threadOpen = false;
    private Context context;
    private ReadCardListenerCallBack readCardListenerCallBack = null;

    public PiccPax(Context context) {
        this.context = context;
        try {
            piccManager = PiccManager.getInstance();
        } catch (PiccException e) {
            e.printStackTrace();
        }
    }

    public void setOnReadCardListenerCallBack(ReadCardListenerCallBack readCardListenerCallBack, int timeout) {
        this.readCardListenerCallBack = readCardListenerCallBack;
        if (!threadOpen) {
            waitUntilReadCard(timeout);
        } else {
            Toast.makeText(context, "Thread For reading card is already Open!!!", Toast.LENGTH_SHORT).show();

        }
    }

    private void waitUntilReadCard(int timeout) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                int msTime = timeout / 10;
                long time = System.currentTimeMillis();
                long currentTime = 0;
                while (true) {
                    threadOpen = true;
                    PiccCardInfo piccCardInfo = new PiccCardInfo();
                    try {
                        piccCardInfo = detect(EDetectMode.EMV_AB);
                        Thread.sleep(10);
                    } catch (PiccDevException | InterruptedException e) {
                        e.printStackTrace();
                        readCardListenerCallBack.onException(e);
                        break;
                    }
                    if (piccCardInfo.getSerialInfo().length != 0) {
                        readCardListenerCallBack.onSuccess(piccCardInfo);
                        break;
                    }
                    currentTime = System.currentTimeMillis();
                    if (currentTime >= time + timeout) {
                        readCardListenerCallBack.onTimeOut();
                        break;
                    }
                }
                threadOpen = false;
            }
        }).start();
    }

    @Override
    public void open() throws PiccDevException {
        if (piccManager != null) {
            try {
                piccManager.piccOpen();
                Log.d("picc", " Picc Open");
            } catch (PiccException e) {
                throw new PiccDevException(e.exceptionCode, e.getMessage());
            }
        }
    }

    @Override
    public PiccPara readParam() throws PiccDevException {
        return null;
    }

    @Override
    public void setParam(PiccPara piccPara) throws PiccDevException {

    }

    @Override
    public void setFelicaTimeOut(long l) throws PiccDevException {

    }

    @Override
    public PiccCardInfo detect(EDetectMode eDetectMode) throws PiccDevException {
        PiccCardInfo piccCardInfo = new PiccCardInfo();
        if (piccManager != null) {
            try {
                PiccManager.PiccCardInfo cardInfo = piccManager.piccDetect(eDetectMode.getDetectMode());
                if (cardInfo != null) {
                    piccCardInfo.setCardType(cardInfo.CardType);
                    piccCardInfo.setCID(cardInfo.CID);
                    piccCardInfo.setSerialInfo(cardInfo.SerialInfo);
                    piccCardInfo.setOther(cardInfo.Other);
                }
            } catch (PiccException e) {
                throw new PiccDevException(e.exceptionCode, e.getMessage());
            }
        }
        return piccCardInfo;
    }

    @Override
    public PiccCardInfo detect(byte b) throws PiccDevException {
        PiccCardInfo piccCardInfo = new PiccCardInfo();
        if (piccManager != null) {
            try {
                PiccManager.PiccCardInfo cardInfo = piccManager.piccDetect(b);
                if (cardInfo != null) {
                    piccCardInfo.setCardType(cardInfo.CardType);
                    piccCardInfo.setCID(cardInfo.CID);
                    piccCardInfo.setSerialInfo(cardInfo.SerialInfo);
                    piccCardInfo.setOther(cardInfo.Other);
                }
            } catch (PiccException e) {
                throw new PiccDevException(e.exceptionCode, e.getMessage());
            }
        }
        return piccCardInfo;
    }

    @Override
    public byte[] isoCommand(byte b, byte[] bytes) throws PiccDevException {
        return new byte[0];
    }

    @Override
    public void remove(EPiccRemoveMode ePiccRemoveMode, byte b) throws PiccDevException {

    }

    @Override
    public void close() throws PiccDevException {
        if (piccManager != null) {
            try {
                piccManager.piccClose();
            } catch (PiccException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void m1Auth(EM1KeyType em1KeyType, byte b, byte[] bytes, byte[] bytes1) throws PiccDevException {

    }

    @Override
    public byte[] m1Read(byte b) throws PiccDevException {
        return new byte[0];
    }

    @Override
    public void m1Write(byte b, byte[] bytes) throws PiccDevException {

    }

    @Override
    public void m1Operate(EM1OperateType em1OperateType, byte b, byte[] bytes, byte b1) throws PiccDevException {

    }

    @Override
    public void initFelica(byte b, byte b1) throws PiccDevException {

    }

    @Override
    public void setLed(byte b) throws PiccDevException {


    }

    @Override
    public ApduRespInfo isoCommandByApdu(byte b, ApduSendInfo apduSendInfo) throws PiccDevException {
        return null;
    }

    @Override
    public byte[] cmdExchange(byte[] bytes, int i) throws PiccDevException {
        return new byte[0];
    }

    @Override
    public void setPort(EUartPort eUartPort) {

    }

    @Override
    public void setFelicaTimeout(int i) throws PiccDevException {

    }

    @Override
    public PiccCardInfo detect(byte b, byte[] bytes) throws PiccDevException {
        return null;
    }

    @Override
    public void cardEmulateSetListenPara(byte[] bytes, byte[] bytes1, byte[] bytes2, byte[] bytes3) throws PiccDevException {

    }

    @Override
    public byte[] cardEmulateListen(byte b, int i, int i1) throws PiccDevException {
        return new byte[0];
    }

    @Override
    public void cardEmulateSend(byte[] bytes) throws PiccDevException {

    }

    @Override
    public byte[] cardEmulateReceive(int i, int i1) throws PiccDevException {
        return new byte[0];
    }

    @Override
    public void changeBaudRate(int i) throws PiccDevException {

    }

    @Override
    public void resetCarrier() throws PiccDevException {

    }

    @Override
    public byte[] extendFunction(byte[] bytes) throws PiccDevException {
        return new byte[0];
    }
}

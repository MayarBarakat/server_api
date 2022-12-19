package com.example.server_api;

import com.pax.dal.entity.PiccCardInfo;

public interface ReadCardListenerCallBack {

    public void onSuccess(PiccCardInfo piccCardInfo);

    public void onException(Exception e);

    public void onTimeOut();
}

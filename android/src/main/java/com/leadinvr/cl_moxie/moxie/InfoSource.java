package com.leadinvr.cl_moxie.moxie;

import android.app.Activity;

import java.util.Map;

public interface InfoSource {
    void fetch(Activity activity, Map<String, Object> params, FetchCallback callback);
}

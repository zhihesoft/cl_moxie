package com.leadinvr.cl_moxie;

import com.leadinvr.cl_moxie.moxie.Carrier;
import com.leadinvr.cl_moxie.moxie.FetchCallback;
import com.leadinvr.cl_moxie.moxie.Taobao;
import com.leadinvr.cl_moxie.moxie.Zhifubao;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * ClMoxiePlugin
 */
public class ClMoxiePlugin implements MethodCallHandler {

    private Registrar registrar;

    private ClMoxiePlugin(Registrar registrar) {
        this.registrar = registrar;
    }

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "cl_moxie");
        channel.setMethodCallHandler(new ClMoxiePlugin(registrar));
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        switch (call.method) {
            case "carrier":
                methodCarrier(call, result);
                break;
            case "taobao":
                methodTaobao(call, result);
                break;
            case "zhifubao":
                methodZhifubao(call, result);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void methodZhifubao(MethodCall call, final Result result) {
        try {
            Zhifubao taobao = new Zhifubao();
            Map<String, Object> params = new HashMap<>();
            params.put("userId", call.argument("userId").toString()); // SharedInfo.getInstance().getEntity(OauthTokenMo.class).getUserId());
            params.put("MOXIE_APIKEY", call.argument("MOXIE_APIKEY").toString()); // BuildConfig.MOXIE_APIKEY);
            taobao.fetch(registrar.activity(), params, new FetchCallback() {
                @Override
                public void call(String err, Object res) {
                    result.success(err);
                }
            });

        } catch (Exception ex) {
            result.success(ex.getMessage());
        }

    }

    private void methodTaobao(MethodCall call, final Result result) {
        try {
            Taobao taobao = new Taobao();
            Map<String, Object> params = new HashMap<>();
            params.put("userId", call.argument("userId").toString()); // SharedInfo.getInstance().getEntity(OauthTokenMo.class).getUserId());
            params.put("MOXIE_APIKEY", call.argument("MOXIE_APIKEY").toString()); // BuildConfig.MOXIE_APIKEY);
            taobao.fetch(registrar.activity(), params, new FetchCallback() {
                @Override
                public void call(String err, Object res) {
                    result.success(err);
                }
            });

        } catch (Exception ex) {
            result.success(ex.getMessage());
        }

    }

    private void methodCarrier(MethodCall call, final Result result) {
        try {
            Carrier carrier = new Carrier();
            Map<String, Object> params = new HashMap<>();
            params.put("userId", call.argument("userId").toString()); // SharedInfo.getInstance().getEntity(OauthTokenMo.class).getUserId());
            params.put("MOXIE_APIKEY", call.argument("MOXIE_APIKEY").toString()); // BuildConfig.MOXIE_APIKEY);
            params.put("phone", call.argument("phone").toString()); // SharedInfo.getInstance().getEntity(OauthTokenMo.class).getUsername());
            params.put("idCard", call.argument("idCard").toString()); // idCard);
            params.put("idCardName", call.argument("idCardName").toString()); // idCardName);
            carrier.fetch(registrar.activity(), params, new FetchCallback() {
                @Override
                public void call(String err, Object res) {
                    result.success(err);
                }
            });
        } catch (Exception ex) {
            // result.error("cl_moxie", ex.getMessage(), null);
            result.success(ex.getMessage());
        }

    }
}

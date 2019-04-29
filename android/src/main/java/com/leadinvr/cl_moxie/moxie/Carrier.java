package com.leadinvr.cl_moxie.moxie;

import com.moxie.client.model.MxLoginCustom;
import com.moxie.client.model.MxParam;

import java.util.HashMap;
import java.util.Map;

/**
 * 魔蝎运营商认证
 */
public class Carrier extends CommonInfo {
    public Carrier() {
        super(MxParam.PARAM_TASK_CARRIER);
    }

    @Override
    protected void setMxParams(MxParam mxParams, Map<String, Object> params) {
        MxLoginCustom loginCustom = new MxLoginCustom();
        Map<String, Object> loginParam = new HashMap<>();
        loginParam.put("phone", params.get("phone").toString());        // 手机号
        loginParam.put("name", params.get("idCardName").toString());    // 姓名
        loginParam.put("idcard", params.get("idCard").toString());      // 身份证
        // 是否允许用户修改以上信息（目前仅支持运营商）
        // MxParam.PARAM_COMMON_NO:不允许用户在页面上修改身份证/手机号/姓名/密码
        // MxParam.PARAM_COMMON_YES:允许用户在页面上修改身份证/手机号/姓名/密码
        loginCustom.setEditable(MxParam.PARAM_COMMON_NO);
        loginCustom.setLoginParams(loginParam);
        mxParams.setLoginCustom(loginCustom);
    }
}

/*
 * Copyright (c) 2014. Pokevian Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.pokevian.app.smartfleet.request;

import com.android.volley.Response.Listener;
import com.android.volley.ServerError;
import com.pokevian.app.smartfleet.model.VehicleModel;
import com.pokevian.app.smartfleet.setting.ServerUrl;
import com.pokevian.app.smartfleet.volley.GsonRequest;
import com.pokevian.app.smartfleet.volley.VolleyListener;
import com.pokevian.app.smartfleet.volley.VolleyParams;
import com.pokevian.caroo.common.smart.model.SmartCarModel;
import com.pokevian.caroo.common.smart.model.SmartCarModelList;
import com.pokevian.caroo.common.smart.model.SmartResponse;

import java.util.List;

public class GetVehicleModelRequest extends GsonRequest<SmartCarModelList> {

    public GetVehicleModelRequest(VehicleModel model, final VolleyListener<VehicleModel> listener) {
        super(ServerUrl.DATA_API, SmartCarModelList.class, listener);

        SmartCarModelList data = new SmartCarModelList();
        /*data.setLocale(Locale.getDefault());*/
        SmartCarModel searchParam = new SmartCarModel();
        searchParam.setCarMakerCd(model.getMakerCode());
        searchParam.setCarModelNameCd(model.getModelCode());
        searchParam.setCarSrcCd(model.getEngineCode());
        searchParam.setEngineDisplacement(model.getDisplacement());
        data.setSearchParam(searchParam);

        VolleyParams params = new VolleyParams();
        params.put("cmd", "getCarModelList");
        params.put("data", getGson().toJson(data));
        setParams(params);

        setListener(new Listener<SmartCarModelList>() {
            public void onResponse(SmartCarModelList response) {
                if (SmartResponse.RESULT_OK.equals(response.getResponse().getResult())) {
                    List<SmartCarModel> scms = response.getSmartCarModelList();
                    if (!scms.isEmpty()) {
                        SmartCarModel scm = scms.get(0);
                        listener.onResponse(new VehicleModel(scm));
                    } else {
                        listener.onResponse(null);
                    }
                } else {
                    listener.onErrorResponse(new ServerError());
                }
            }
        });
    }

}

package com.fandian.util;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import org.springframework.stereotype.Service;

import java.lang.reflect.Type;
import java.util.List;

/**
 * Created by zhijieliu on 2014/5/12.
 */
@Service
public class JSONUtil {
    GsonBuilder builder=new GsonBuilder();
    public <T> List<T> transJsonToBeanListByGson(String jsonStr, Class<T> type) {

        Gson gson=builder.setExclusionStrategies(
                new ExclusionStrategy(){

                    public boolean shouldSkipClass(Class<?> arg0) {
                        return false;
                    }

                    public boolean shouldSkipField(FieldAttributes arg0) {

                        if(arg0.getName().equals("ts"))
                            return true;
                        else
                            return false;
                    }

                }).create();

        List<T> beanList=gson.fromJson(jsonStr,
                new TypeToken<List<T>>(){}.getType());

        return beanList;
    }

    public <T> List<T> transJsonToBeanListByGson(String jsonStr,Type type) {

        Gson gson=builder.setExclusionStrategies(
                new ExclusionStrategy(){

                    public boolean shouldSkipClass(Class<?> arg0) {
                        return false;
                    }

                    public boolean shouldSkipField(FieldAttributes arg0) {

                        if(arg0.getName().equals("ts"))
                            return true;
                        else
                            return false;
                    }

                }).create();

        List<T> beanList=gson.fromJson(jsonStr,type);

        return beanList;
    }


    public <T> T transJsonToBeanByGson(String jsonStr,Class<T> type){
        return builder.create().fromJson(jsonStr,type);
    }

    public String transToJsonStrByGson(Object obj) {
        return builder.create().toJson(obj);
    }
}

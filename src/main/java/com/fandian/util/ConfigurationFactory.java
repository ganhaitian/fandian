package com.fandian.util;




import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.configuration.reloading.FileChangedReloadingStrategy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: zhijieliu
 * Date: 13-5-9
 * Time: 下午4:38
 * To change this template use File | Settings | File Templates.
 */
public class ConfigurationFactory {

    private static final Map<String,Configuration> CONFIGURATION_MAP = new HashMap<String, Configuration>();
    private static Logger log = LoggerFactory.getLogger(ConfigurationFactory.class);

    public static Configuration getConfiguation(String name){
        if (CONFIGURATION_MAP.containsKey(name)){
            return CONFIGURATION_MAP.get(name);
        }
        Configuration configuration = null;

        try {
            configuration = new PropertiesConfiguration(name);
            ((PropertiesConfiguration)configuration).setReloadingStrategy(new FileChangedReloadingStrategy());

            CONFIGURATION_MAP.put(name,configuration);
            return configuration;
        } catch (Exception e) {

            log.warn("fail to load task meta config ["+name+"]",e);
        }
        return null;
    }

    public static Configuration getGlobalConfiguration(){
        return getConfiguation("config.properties");
    }
}

package cn.yellowgg.utils;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.mchange.v1.util.ArrayUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.Mapping;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @Description:
 * @Author: yellowgg
 * @Date: Created in 2020/3/16 18:09
 */
public class JsonUtils {

    /**
     * 转json的时候，这种特殊的符号会转失败
     */
    private static final Set<String> SPECIAL_CODE = Sets.newHashSet("{}");

    private static GsonBuilder gsonBuilder = new GsonBuilder();

    /**
     * 将json转List使用这个方法 解决 BUG--->com.google.gson.internal.LinkedTreeMap cannot
     * be cast to basic.Product
     *
     * @As：调用方式:KikuuJsonUtils.stringToList(json, Product[].class);
     * <p>
     * 不会去掉包含null字段。
     **/
    public static <T> List<T> stringToList(String s, Class<T[]> clazz) {
        T[] arr = gsonBuilder.serializeNulls().create().fromJson(s, clazz);
        List<T> result = Lists.newArrayList();
        if (arr != null) {
            T t = null;
            for (int i = 0; i < arr.length; i++) {
                t = arr[i];
                result.add(t);
            }
        }
        return result;
    }

    public static <T> T stringToObj(String s, java.lang.reflect.Type clazz) {
        if (StringUtils.isEmpty(s) || SPECIAL_CODE.contains(s)) {
            return null;
        }
        T t = (T) gsonBuilder.enableComplexMapKeySerialization().create().fromJson(s, clazz);
        return t;
    }

    public static <T> T stringToObj(String s, java.lang.reflect.Type type, Class clazz, TypeAdapter adapter) {
        T t = (T) gsonBuilder.enableComplexMapKeySerialization().registerTypeAdapter(clazz, adapter).create()
                .fromJson(s, type);
        return t;
    }

    public static String objToJson(Object t, java.lang.reflect.Type type, Class clazz, TypeAdapter adapter) {
        if (t == null) {
            return "";
        }
        Gson gson = gsonBuilder.enableComplexMapKeySerialization().registerTypeAdapter(clazz, adapter).create();
        return gson.toJson(t, type);
    }

    public static String objToJson(Object t, java.lang.reflect.Type type) {
        if (t == null) {
            return "";
        }
        Gson gson = gsonBuilder.enableComplexMapKeySerialization().create();
        return gson.toJson(t, type);
    }


    private final static List<Class<?>> PrimitiveClasses = new ArrayList<Class<?>>() {
        {
            add(Long.class);
            add(Double.class);
            add(Integer.class);
            add(String.class);
            add(Boolean.class);
            add(java.util.Date.class);
            add(java.sql.Date.class);
        }
    };

    private final static boolean _IsPrimitive(Class<?> cls) {
        return cls.isPrimitive() || PrimitiveClasses.contains(cls);
    }

}

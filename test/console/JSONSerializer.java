package console;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import org.json.JSONObject;

public class JSONSerializer {
	// all the fields of class
	private static Map<Class<?>, Map<String, Field>> FIELDS = new ConcurrentHashMap<>(); // 缓存解析类的所有字段
	private static SimpleDateFormat FORMATTER; // Date字段解析示例
	private static Map<Class<?>, JSONConverter> sConverters = new ConcurrentHashMap<>(); // 自定义类解析器

	/**
	 * Check the class cache
	 * 
	 * @param klass
	 * @return
	 */
	private static boolean doesExist(Class<?> klass) {
		return FIELDS.containsKey(klass);
	}

	/**
	 * Cache the fields of class
	 * 
	 * @param klass
	 * @return
	 */
	private static Map<String, Field> parseFields(Class<?> klass) {
		Map<String, Field> fieldsMap = new ConcurrentHashMap<>();

		Field[] fields = klass.getDeclaredFields();
		if (fields != null) {
			for (Field field : fields) {
				String name = field.getName();
				int modifiers = field.getModifiers();
				boolean isStatic = Modifier.isStatic(modifiers);
				boolean isFinal = Modifier.isFinal(modifiers);
				boolean isTransient = Modifier.isTransient(modifiers);
				boolean isPublic = Modifier.isPublic(modifiers);
				if (isStatic || isFinal || isTransient) {
					continue;
				}
				if (isPublic) {
					fieldsMap.put(name, field);
				}
			}
		}

		return fieldsMap;
	}

	public static JSONObject toJSONObject(Object obj) { // 将实例解析成JSON对象
		JSONObject json = new JSONObject();
		Class<?> klass = obj.getClass();
		if (!doesExist(obj.getClass())) {
			FIELDS.put(klass, parseFields(klass));
		}
		Map<String, Field> classFields = FIELDS.get(klass);
		for (Entry<String, Field> field : classFields.entrySet()) {
			try {
				String property = field.getKey();
				Field propertyField = field.getValue();
				Object value = propertyField.get(obj);
				Class<?> type = propertyField.getType();
				if (isBaseType(type)) {
					json.put(property, value);
				} else if (type.equals(List.class)) {
					json.put(property, ((List<?>) value).toArray());
				} else {
					JSONConverter converter = sConverters.get(type); // 自定义解析器
					if (converter != null) {
						Object converted = converter.serialize(value);
						json.put(property, converted);
					} else {
						json.put(property, value);
					}
				}
			} catch (IllegalAccessException | IllegalArgumentException e) {
				e.printStackTrace();
			}
		}
		return json;
	}

	public static Object toObject(String str, Class<?> klass) {
		JSONObject json = new JSONObject(str);
		return toObject(json, klass);
	}

	public static Object toObject(JSONObject json, Class<?> klass) {
		if (json == null) {
			return null;
		}
		if (!doesExist(klass)) {
			FIELDS.put(klass, parseFields(klass));
		}
		Map<String, Field> fields = FIELDS.get(klass);
		try {
			Object obj = klass.newInstance();
			for (Object key : json.keySet()) {
				Field field = fields.get(key);
				Object value = json.get(key.toString());
				if (field == null || value == JSONObject.NULL) {
					continue;
				}
				value = tryConvert2Obj(field, value);
				field.set(obj, value);
			}
			return obj;
		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}

		return null;
	}

	private static Object tryConvert2Obj(Field field, Object value) {
		if (value == null) {
			return null;
		}

		Class<?> type = field.getType();
		if (type.equals(boolean.class) || type.equals(Boolean.class)) {
			value = Boolean.valueOf(value.toString());
		} else if (type.equals(int.class) || type.equals(Integer.class)) {
			value = Integer.valueOf(value.toString());
		} else if (type.equals(float.class) || type.equals(Float.class)) {
			value = Float.valueOf(value.toString());
		} else if (type.equals(double.class) || type.equals(Double.class)) {
			value = Double.valueOf(value.toString());
		} else if (type.equals(char.class) || type.equals(Character.class)) {
			value = new Character(value.toString().charAt(0));
		} else if (type.equals(long.class) || type.equals(Long.class)) {
			value = Long.valueOf(value.toString());
		} else if (type.equals(short.class) || type.equals(Short.class)) {
			value = Short.valueOf(value.toString());
		} else if (type.equals(byte.class) || type.equals(Byte.class)) {
			value = Byte.valueOf(value.toString());
		} else if (type.equals(Date.class)) { // date
			try {
				value = FORMATTER.parse(value.toString());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else if (value instanceof List<?>) { // list
			value = ((List<?>) value).toArray();
		} else if (value instanceof JSONObject) { // json
			JSONObject valueJson = (JSONObject) value;
			value = toObject(valueJson, field.getType());
		} else {
			JSONConverter converter = sConverters.get(type); // 自定义解析器
			if (converter != null) {
				value = converter.deserialize(value);
			}
		}

		return value;
	}

	public static boolean isBaseType(Class<?> type) { // 判断是否基本类型
		if (type.equals(boolean.class) || type.equals(Boolean.class)) {
			return true;
		} else if (type.equals(int.class) || type.equals(Integer.class)) {
			return true;
		} else if (type.equals(float.class) || type.equals(Float.class)) {
			return true;
		} else if (type.equals(double.class) || type.equals(Double.class)) {
			return true;
		} else if (type.equals(char.class) || type.equals(Character.class)) {
			return true;
		} else if (type.equals(long.class) || type.equals(Long.class)) {
			return true;
		} else if (type.equals(short.class) || type.equals(Short.class)) {
			return true;
		} else if (type.equals(byte.class) || type.equals(Byte.class)) {
			return true;
		}
		return false;
	}

	public static interface JSONConverter { // 自定义转换器接口
		public Class<?> getConverterClass();
		public Object deserialize(Object value);
		public Object serialize(Object value);
	}

	static class InnerTest2Json { // 测试类
		public String name;
		public String password;
		public int age;
		public BigDecimal money;
	}
	
	static class MyConverter implements JSONConverter { // 自定义解析器， 用来解析BigDecimal

		@Override
		public Class<?> getConverterClass() {
			return BigDecimal.class;
		}

		@Override
		public Object deserialize(Object value) { // 反序列化
			if (value == null) {
				return null;
			}
			return new BigDecimal(value.toString());
		}

		@Override
		public Object serialize(Object value) { // 序列化
			if (value == null) {
				return null;
			}
			return value.toString();
		}
		
	}

	public static void main(String[] args) {
		MyConverter converter = new MyConverter(); // 添加自定义的解析器
		sConverters.put(converter.getConverterClass(), converter);
		
		InnerTest2Json test1 = new InnerTest2Json();
		test1.name = "David";
		test1.password = "david";
		test1.age = 30;
		test1.money = new BigDecimal("19837416823681638461823617234681.11341234");
		JSONObject json = toJSONObject(test1);
		System.out.println("JSON String: " + json.toString());

		InnerTest2Json test2 = (InnerTest2Json) toObject(json, InnerTest2Json.class);
		System.out.println("转换成类实例:");
		System.out.println(test2.name);
		System.out.println(test2.password);
		System.out.println(test2.age);
		System.out.println(test2.money);
	}
}
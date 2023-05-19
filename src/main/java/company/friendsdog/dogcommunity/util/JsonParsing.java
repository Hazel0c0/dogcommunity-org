package company.friendsdog.dogcommunity.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.json.JSONObject;

public class JsonParsing {
  public static void main(String[] args) {
    String data =null;

// ObjectMapper 인스턴스 생성
    ObjectMapper objectMapper = new ObjectMapper();

    try {

      // JSON 문자열을 Java 객체로 변환
//      MyObject obj = objectMapper.readValue(jsonString, MyObject.class);
//
//       파싱된 객체 사용
//      System.out.println("name: " + obj.getName());
//      System.out.println("age: " + obj.getAge());
//      System.out.println("city: " + obj.getCity());
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
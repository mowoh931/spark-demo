package com.baar.sparkdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SparkDemoApplication {


    public static void main(String[] args) {
        SpringApplication.run(SparkDemoApplication.class, args);
//        SparkConf sparkConf = new SparkConf();
//        sparkConf.setAppName("spark-demo");
//        sparkConf.setMaster("local[*]");
//
//        try (JavaSparkContext sparkContext = new JavaSparkContext(sparkConf)){
//
//        } catch (RuntimeException e) {
//            throw new RuntimeException(e);
//        }

        String dataPath = "resources/data/MOCK_DATA.json";
    }

}

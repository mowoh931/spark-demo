// package com.baar.sparkdemo.configuration;
//
// import org.apache.spark.sql.SparkSession;
// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;
//
// @Configuration
// public class SparkConfig {
//
//     @Bean
//     public SparkSession sparkSession() {
//         return SparkSession.builder()
//                 .appName("Spring Boot Spark App")
//                 .master("spark://spark-master:7077")
//                 .getOrCreate();
//     }
// }
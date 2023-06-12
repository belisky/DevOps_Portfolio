package com.develeap;

import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )  {
        String version = System.getProperty("java.version");
        System.out.println("Java Version is "+version);
        JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
        boolean hasCompiler = (compiler!=null);
        boolean hasJava8 = version.contains("1.8");

        System.out.println("You succeeded in building the application - 33 points");
        System.out.println("You succeeded in running the application - 33 points");
        int points=66;

        if (hasJava8) {
            System.out.println("You have the right Java version - 10 points");
            points+=10;
        } else {
            System.out.println("You have the wrong Java version. -10 points.");
            points-=10;
        }

        if (hasCompiler) {
            System.out.println("You are running on a JDK Machine - Bad practice. -25 points");
            points-=25;
        } else {
            System.out.println("And you are running on a JRE machine - 24 points.");
            points+=24;
        }

        if (points!=100) {
            System.out.println("Which brings us to "+points+"/100. Not too good. You can do better.");
        } else {
            System.out.println("Full points - 100/100. Good work!");
        }
    }
}

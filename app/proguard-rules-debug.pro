# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in E:\workspace\android\sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# do not obfuscate
#-dontobfuscate

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

#-keep class com.pokevian.app.smartfleet.ui.tripmonitor.TripMonitorFragment$JavaScriptInterface {
#  public *;
#}
#-keep class com.pokevian.app.smartfleet.ui.tripmonitor.PopupActivity$JavaScriptInterface {
#  public *;
#}

-keepclasseswithmembers class * {
 @android.webkit.JavascriptInterface <methods>;
}

-keep class * extends android.webkit.WebViewClient {
  public *;
}
-keep class * extends android.webkit.WebChromeClient {
  public *;
}

# support library
-keep public class android.support.v7.widget.** { *; }
-keep public class android.support.v7.internal.widget.** { *; }
-keep public class android.support.v7.internal.view.menu.** { *; }
-keep public class android.support.v4.** { *; }
-keep public class android.support.design.widget.** { *; }

-keep public class * extends android.support.v4.view.ActionProvider {
    public <init>(android.content.Context);
}

-keep class org.apache.http.** { *; }

-keep class kr.co.fingerpush.** { *; }

# Beans
-keep class com.pokevian.caroo.** { *; }
-keep class com.pokevian.app.smartfleet.model.** { *; }

###############################################################################
# refelection
-keep class com.android.internal.telephony.ITelephony { *; }
-keep !abstract class com.pokevian.app.smartfleet.service.floatinghead.** { *;}

# Warnings to be removed.
-dontwarn org.apache.ibatis.**
-dontwarn org.springframework.**
-dontwarn org.codehaus.jackson.**
-dontwarn javax.servlet.http.**
-dontwarn org.apache.log4j.**
-dontwarn com.google.common.cache.**
-dontwarn com.google.common.primitives.**
-dontwarn com.pokevian.caroo.common.smart.model.**

-assumenosideeffects class com.pokevian.lib.obd2.util.Log {
     public static int t(...);
     public static int d(...);
     public static int i(...);
     }
#     public static int w(...);
#     public static int e(...);
#     public static int p(...);
#}

-assumenosideeffects class org.apache.log4j.** {
    public void trace(...);
    public void debug(...);
    }
#    public void info(...);
#    public void warn(...);
#}

-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int d(...);
    }
#    public static int i(...);
#    public static int w(...);
#    public static int e(...);
#}

-renamesourcefileattribute PG
-keepattributes SourceFile,LineNumberTable

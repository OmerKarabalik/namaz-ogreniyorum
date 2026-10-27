# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.provider.** { *; }
-keep class io.flutter.plugins.** { *; }

# Flutter Generated Plugin Registrant
-keep class io.flutter.plugins.GeneratedPluginRegistrant { *; }

# Google Mobile Ads (AdMob)
-keep class com.google.android.gms.ads.** { *; }
-keep class com.google.ads.** { *; }

# Audioplayers
-keep class xyz.laspilleria.audioplayers.** { *; }
-keep class com.solido.audioplayers.** { *; }

# MainActivity
-keep class com.omrkr.namaz.ogreniyorum.app.MainActivity { *; }

# Flutter Local Notifications & Gson (Fixes TypeToken.getSuperclassTypeParameter crash in ScheduledNotificationReceiver)
-keep class com.dexterous.flutterlocalnotifications.** { *; }
-keep class com.dexterous.flutterlocalnotifications.models.** { *; }
-dontwarn com.dexterous.flutterlocalnotifications.**
-keepclassmembers class com.dexterous.flutterlocalnotifications.** { *; }
-keepclassmembers class com.dexterous.flutterlocalnotifications.models.** { *; }

-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**
-keep class * extends com.google.gson.reflect.TypeToken
-keep class * extends com.google.gson.reflect.TypeToken { *; }
-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}
-keepclassmembers enum * { *; }

# Geolocator
-keep class com.baseflow.geolocator.** { *; }
-dontwarn com.baseflow.geolocator.**

# Desugaring / Java 8+ APIs
-keep class j$.** { *; }
-dontwarn j$.**

# General Keep Attributes
-keepattributes EnclosingMethod
-keepattributes InnerClasses
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes Exceptions
-keepattributes SourceFile,LineNumberTable

# Google Play Core (Deferred components / SplitCompat)
-dontwarn com.google.android.play.core.**

# AndroidX WorkManager & Room Database (fixes WorkDatabase reflection crash in release mode)
-keep class androidx.work.** { *; }
-dontwarn androidx.work.**
-keep class androidx.work.impl.** { *; }
-dontwarn androidx.work.impl.**
-keep class androidx.work.impl.WorkDatabase { *; }
-keep class * extends androidx.work.impl.WorkDatabase { *; }
-keep class androidx.room.** { *; }
-dontwarn androidx.room.**
-keep class * extends androidx.room.RoomDatabase { *; }

# AndroidX Startup
-keep class androidx.startup.** { *; }
-dontwarn androidx.startup.**



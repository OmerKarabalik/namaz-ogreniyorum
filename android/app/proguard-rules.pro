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

# Flutter Local Notifications
-keep class com.dexterous.flutterlocalnotifications.** { *; }
-dontwarn com.dexterous.flutterlocalnotifications.**

# Geolocator
-keep class com.baseflow.geolocator.** { *; }
-dontwarn com.baseflow.geolocator.**

# Desugaring / Java 8+ APIs
-keep class j$.** { *; }
-dontwarn j$.**

# General Keep Attributes
-keepattributes *Annotation*
-keepattributes Exceptions
-keepattributes InnerClasses
-keepattributes Signature
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



# Keep Spotify SDK classes
-keep class com.spotify.** { *; }
-dontwarn com.spotify.**

# Keep Jackson (used by Spotify SDK)
-keep class com.fasterxml.jackson.** { *; }
-dontwarn com.fasterxml.jackson.**

# Keep annotations
-keep @interface com.spotify.base.annotations.**

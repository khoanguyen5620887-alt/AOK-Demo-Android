plugins {
    id("com.android.application")
}

android {
    namespace = "com.aok.demo"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.aok.demo"
        minSdk = 23
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
        }
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.13.1")
    implementation("androidx.appcompat:appcompat:1.7.0")
}

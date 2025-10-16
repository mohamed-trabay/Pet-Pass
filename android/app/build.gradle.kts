plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.pet_pass"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11

        // ✅ تفعيل دعم desugaring (مطلوب لبعض المكتبات مثل flutter_local_notifications)
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.pet_pass"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // حالياً موقّع بمفاتيح debug لتجارب التطوير فقط
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// ✅ dependencies النهائية بعد التعديل
dependencies {
    // مكتبة مطلوبة لتفعيل desugaring ودعم Java 8+
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")

    // مكتبة Kotlin القياسية (ضرورية لبعض المزايا)
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
}

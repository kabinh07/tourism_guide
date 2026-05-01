allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Fix for packages (e.g. isar_flutter_libs) that don't set namespace (AGP 8.0+)
// and compileSdk < 34 which causes lStar attr linking errors in release builds.
subprojects {
    if (!state.executed) {
        afterEvaluate {
            val android = extensions.findByType<com.android.build.gradle.LibraryExtension>()
            if (android != null) {
                if (android.namespace == null) {
                    android.namespace = project.group.toString()
                }
                if ((android.compileSdk ?: 0) < 34) {
                    android.compileSdk = 34
                }
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

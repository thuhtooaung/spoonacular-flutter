import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.thuhtooaung.spoonacular.dev"
            resValue(type = "string", name = "app_name", value = "Spoonacular Dev")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.thuhtooaung.spoonacular"
            resValue(type = "string", name = "app_name", value = "Spoonacular")
        }
    }
}
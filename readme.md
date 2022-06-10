## bugly自动上传mapping 

下载当前包，替换fuckBugly.bat内的appid和appkey

版本采用$versionName-v$versionCode的方式，为保持一致，需要在bugly初始化时新增以下代码
```
CrashReport.setAppVersion(this, "${BuildConfig.VERSION_NAME}-v${BuildConfig.VERSION_CODE}")
```

将此包所在文件夹放入环境变量，然后命令行 运行 
```
fuckBugly.bat "版本号" "mapping所在文件夹" "你的appid" "你的appkey"
```

同时支持gradle task 自动配置
```
android {}

task _uploadMappingWindows(type:Exec){
    println("--------------------- upload fucking bugly mapping ---------------------")
    if (System.getProperty('os.name').toLowerCase(Locale.ROOT).contains('windows')) {
        def dir = "$buildDir\\outputs\\mapping\\release"
        def appid = 'appid'
        def appkey = 'appkey'
        def projectId = project.android.defaultConfig.applicationId
        workingDir "$dir"
        commandLine 'cmd', '/c', "fuckBugly.bat ${project.android.defaultConfig.versionName}-v${project.android.defaultConfig.versionCode} $dir $appid $appkey $projectId"
    }
}
project.tasks.whenTaskAdded { Task task ->
    if (task.name.contains('assembleRelease')) {
        task.finalizedBy _uploadMappingWindows
    }
}

```

这个包含了openjdk8的jre，因为垃圾bugly竟然不支持11，想必大多数开发环境都已经换11+了，所以内置一套8的jre，方便直接使用

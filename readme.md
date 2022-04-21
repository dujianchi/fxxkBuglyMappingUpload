#bugly自动上传mapping 

下载当前包，替换fuckBugly.bat内的appid和appkey

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
        workingDir "$dir"
        commandLine 'cmd', '/c', "fuckBugly.bat ${project.android.defaultConfig.versionName}-v${project.android.defaultConfig.versionCode} $dir $appid $appkey"
    }
}
project.tasks.whenTaskAdded { Task task ->
    if (task.name.contains('assembleRelease')) {
        task.finalizedBy _uploadMappingWindows
    }
}

```

这个包含了openjdk8的jre，因为垃圾bugly竟然不支持11，想必大多数开发环境都已经换11+了，所以内置一套8的jre，方便直接使用

pipeline {
    agent any
    environment{
    //项目名
     name='VueDemo_Sell_Eleme'
    //仓库地址
     github='https://github.com/tomcat-ll/vue.git'
    //jenkins远程服务器
     server_name='103_server'
    sever_port = '81'}
    stages {
        stage(‘pipeline开始拉取‘) {
        steps{
         echo "清理workspace"
          sh("ls -al ${env.WORKNSPACE}")
          deleteDir()  // clean up current work directory
          sh("ls -al ${env.WORKSPACE}")
                  echo "开始拉取"
                 checkout([$class: 'GitSCM', branches: [[name: '*/'+env.BRANCH_NAME]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b1ef8492-1493-4a99-bc34-128736e69203', url: "${github}"]]])

        }
        }

         stage(‘pipeline编译打包‘) {
         steps{
                          echo "开始编译打包1111"
                          sh "npm install"
                          sh "npm run build"
                          //检查下之前docker中是否存在已有的容器和镜像，有则删除
                          echo '****************************** delete container and image... ******************************'
                                          sh 'docker ps -a|grep $name|awk \'{print $1}\'|xargs -i docker stop {}|xargs -i docker rm {}'
                                          sh 'docker images|grep $name|grep dev|awk \'{print $3}\'|xargs -i docker rmi {}'
                                          //构建镜像
                          sh "docker build  -t ${project_name}:latest ."
                          //启动容器
                           sh 'docker run -d -p 81:80 --restart=always --name $name ${project_name}:latest'
                          }

                        }


        }
}
